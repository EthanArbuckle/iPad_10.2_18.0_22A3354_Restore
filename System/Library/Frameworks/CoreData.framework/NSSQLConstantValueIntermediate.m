@implementation NSSQLConstantValueIntermediate

- (BOOL)_addBindVarForConstId:(uint64_t)a3 ofType:(void *)a4 inContext:
{
  const __CFString *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  NSSQLBindVariable *v12;

  if (a1)
  {
    if (objc_msgSend(a1, "isTargetColumnsScoped"))
      v8 = CFSTR("selectBindVars");
    else
      v8 = CFSTR("bindVars");
    v9 = (void *)objc_msgSend(a4, "objectForKey:", v8);
    objc_opt_self();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v10 = _sqlCoreLookupSQLEntityForEntityDescription((void *)objc_msgSend(a4, "objectForKey:", CFSTR("persistentStore")), a2);
      if (v10)
        v11 = *(int *)(v10 + 184);
      else
        v11 = 0;
      a2 = (_QWORD *)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v11);
    }
    objc_opt_class();
    v12 = -[NSSQLBindVariable initWithValue:sqlType:propertyDescription:allowCoercion:]([NSSQLBindVariable alloc], "initWithValue:sqlType:propertyDescription:allowCoercion:", a2, a3, 0, (objc_opt_isKindOfClass() & 1) == 0);
    objc_msgSend(v9, "addObject:", v12);

  }
  return a1 != 0;
}

- (id)generateSQLStringInContext:(id)a3
{
  void *v5;
  uint64_t v6;
  id v7;
  int v8;
  id constantValue;
  __CFString *v10;
  uint64_t type;
  _QWORD *v12;
  NSSQLConstantValueIntermediate *v13;
  _QWORD *v14;
  void *v15;
  uint64_t v16;
  const __CFString *v17;
  void *v18;
  NSSQLBindVariable *v19;
  NSSQLBindVariable *v20;
  NSSQLBindVariable *v21;
  _BOOL4 v22;
  uint64_t v23;
  id v24;
  void *v25;
  void *v26;
  id *v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  unsigned __int8 *v33;
  unsigned __int8 *v34;
  int v35;
  BOOL v37;
  void *v38;
  uint64_t v39;
  uint64_t v40;
  id v41;
  const __CFString *v42;
  uint64_t v43;
  void *v44;
  uint64_t v45;
  NSSQLBindVariable *v46;
  uint64_t v47;
  NSSQLBindVariable *v48;
  unsigned int v49;
  uint64_t v50;
  void *v51;
  void *v52;
  void *v53;
  _QWORD *v54;
  uint64_t v55;
  void *v56;
  void *v57;
  int v58;
  const __CFString *v59;
  const __CFString *v60;
  void *v61;
  void *v63;
  uint64_t v64;
  void *v65;
  uint64_t v66;
  uint64_t v67;
  const __CFString *v68;
  uint64_t v69;
  const __CFString *v70;
  void *v71;
  uint64_t v72;
  uint64_t v73;
  unsigned int v74;
  const __CFString *v75;
  id v76;
  _QWORD v77[4];
  _QWORD v78[5];

  v78[4] = *MEMORY[0x1E0C80C00];
  v5 = (void *)MEMORY[0x18D76B4E4](self, a2);
  if (-[NSSQLIntermediate isIndexScoped](self, "isIndexScoped"))
  {
    if (!self->_constantValue
      || (v6 = objc_msgSend(MEMORY[0x1E0C99E38], "null"), v7 = self->_constantValue, (id)v6 == v7))
    {
      v10 = CFSTR("nil");
    }
    else
    {
      v8 = objc_msgSend(v7, "isNSNumber");
      constantValue = self->_constantValue;
      if (v8)
      {
        v10 = (__CFString *)objc_msgSend(constantValue, "description");
      }
      else if (objc_msgSend(constantValue, "isNSString"))
      {
        v10 = (__CFString *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("'%@'"), self->_constantValue);
      }
      else if (objc_msgSend(self->_constantValue, "isNSDate"))
      {
        v38 = (void *)MEMORY[0x1E0CB3940];
        objc_msgSend(self->_constantValue, "timeIntervalSinceReferenceDate");
        v10 = (__CFString *)objc_msgSend(v38, "stringWithFormat:", CFSTR("%f"), v39);
      }
      else
      {
        v40 = *MEMORY[0x1E0C99778];
        v41 = self->_constantValue;
        v75 = CFSTR("valueSpecified");
        v76 = v41;
        objc_msgSend(a3, "setObject:forKey:", objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", v40, CFSTR("Can't specify non string/number/date value as part of index"), objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v76, &v75, 1)), CFSTR("NSUnderlyingException"));
        v10 = 0;
      }
    }
    goto LABEL_94;
  }
  type = self->_type;
  v12 = self->_constantValue;
  if (!self->_type)
  {
    if (v12)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v15 = (void *)objc_msgSend(v12, "objectID");
        if (!v15)
          goto LABEL_24;
LABEL_17:
        if ((objc_msgSend(v15, "isTemporaryID") & 1) == 0
          && (v16 = objc_msgSend(v15, "persistentStore"),
              v16 == objc_msgSend(a3, "objectForKey:", CFSTR("persistentStore"))))
        {
          if (-[NSSQLIntermediate isTargetColumnsScoped](self, "isTargetColumnsScoped"))
            v42 = CFSTR("selectBindVars");
          else
            v42 = CFSTR("bindVars");
          v18 = (void *)objc_msgSend(a3, "objectForKey:", v42);
          if (objc_msgSend((id)objc_msgSend(a3, "objectForKey:", CFSTR("generatePairs")), "BOOLValue"))
          {
            v43 = objc_msgSend((id)objc_msgSend(a3, "objectForKey:", CFSTR("persistentStore")), "model");
            if (v43)
              v44 = *(void **)(v43 + 32);
            else
              v44 = 0;
            v45 = objc_msgSend(v44, "objectForKey:", objc_msgSend(v15, "entityName"));
            v46 = [NSSQLBindVariable alloc];
            if (v45)
              v47 = *(unsigned int *)(v45 + 184);
            else
              v47 = 0;
            v48 = -[NSSQLBindVariable initWithInt64:sqlType:](v46, "initWithInt64:sqlType:", v47, 2);
            objc_msgSend(v18, "addObject:", v48);

          }
          v20 = -[NSSQLBindVariable initWithInt64:sqlType:]([NSSQLBindVariable alloc], "initWithInt64:sqlType:", objc_msgSend(v15, "_referenceData64"), 2);
        }
        else
        {
          if (-[NSSQLIntermediate isTargetColumnsScoped](self, "isTargetColumnsScoped"))
            v17 = CFSTR("selectBindVars");
          else
            v17 = CFSTR("bindVars");
          v18 = (void *)objc_msgSend(a3, "objectForKey:", v17);
          v19 = [NSSQLBindVariable alloc];
          v20 = -[NSSQLBindVariable initWithValue:sqlType:propertyDescription:](v19, "initWithValue:sqlType:propertyDescription:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", 0), 2, 0);
        }
        v21 = v20;
        objc_msgSend(v18, "addObject:", v20);

        v22 = 1;
        goto LABEL_87;
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v15 = v12;
        goto LABEL_17;
      }
    }
LABEL_24:
    v23 = -[NSSQLiteAdapter sqlTypeForExpressionConstantValue:](objc_msgSend((id)objc_msgSend(a3, "objectForKey:", CFSTR("persistentStore")), "adapter"), v12);
    v24 = -[NSSQLIntermediate _lastScopedItem](self->super._scope, "_lastScopedItem");
    if (!v24)
      goto LABEL_77;
    v25 = v24;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0
      || (objc_msgSend((id)objc_opt_class(), "isSimpleKeypath:", v25) & 1) == 0
      && !-[NSSQLIntermediate isVariableBasedKeypathScopedBySubquery:]((uint64_t)self, v25))
    {
      goto LABEL_77;
    }
    v26 = (void *)objc_msgSend((id)objc_msgSend((id)objc_msgSend(v25, "arguments"), "objectAtIndex:", 0), "constantValue");
    v27 = -[NSSQLIntermediate governingEntityForKeypathExpression:](self, "governingEntityForKeypathExpression:", v25);
    v28 = (void *)objc_msgSend(v26, "componentsSeparatedByString:", CFSTR("."));
    v29 = objc_msgSend(v28, "count");
    v74 = v23;
    if (v29)
    {
      v30 = v29;
      v31 = objc_msgSend(v28, "objectAtIndex:", 0);
      if (v27)
      {
        v32 = 1;
        while (1)
        {
          v33 = (unsigned __int8 *)objc_msgSend(v27[5], "objectForKey:", v31);
          if (!v33)
            break;
          v34 = v33;
          v35 = v33[24];
          v37 = v30 != v32 && v35 == 7;
          if (v35 == 9 || v37 || objc_msgSend(v33, "isToMany"))
            v27 = (id *)objc_msgSend(v34, "destinationEntity");
          if (v30 == v32)
            goto LABEL_61;
          v31 = objc_msgSend(v28, "objectAtIndex:", v32++);
          if (!v27)
            goto LABEL_44;
        }
        if (objc_msgSend(CFSTR("entity"), "isEqual:", v31))
        {
          v34 = (unsigned __int8 *)v27[17];
          goto LABEL_61;
        }
      }
      else
      {
LABEL_44:
        objc_msgSend(CFSTR("entity"), "isEqual:", v31);
      }
    }
    v34 = 0;
LABEL_61:
    v49 = objc_msgSend(v34, "propertyType");
    if (v49 <= 9)
    {
      if (((1 << v49) & 0x38C) != 0)
      {
        v50 = 2;
LABEL_64:
        if ((_QWORD *)objc_msgSend(MEMORY[0x1E0C99E38], "null") == v12)
          v12 = 0;
        if ((_DWORD)v50)
        {
          if ((_DWORD)v50 == 7 && v74 == 8)
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              v51 = (void *)MEMORY[0x1E0CB37E8];
              objc_msgSend(v12, "timeIntervalSinceReferenceDate");
              v12 = (_QWORD *)objc_msgSend(v51, "numberWithDouble:");
            }
            v23 = 7;
          }
          else
          {
            v23 = v50;
          }
        }
        else
        {
          v23 = v74;
        }
LABEL_77:
        v52 = (void *)objc_msgSend((id)objc_msgSend(a3, "valueForKey:", CFSTR("explicitRestrictingEntityQualifier")), "lastObject");
        if (objc_msgSend(v52, "isEqual:", MEMORY[0x1E0C9AAB0]))
        {
          v53 = (void *)objc_msgSend(a3, "valueForKey:", CFSTR("persistentStore"));
          v54 = (_QWORD *)objc_msgSend(v53, "model");
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v55 = _sqlEntityForEntityDescription((uint64_t)v54, v12);
            if (!v55)
              goto LABEL_85;
            goto LABEL_84;
          }
          if (objc_msgSend(v12, "isNSString"))
          {
            v56 = (void *)objc_msgSend(v54, "entityNamed:", v12);
            if (!v56)
            {
              if (v54)
                v63 = (void *)v54[4];
              else
                v63 = 0;
              v64 = objc_msgSend(v63, "allKeys");
              v65 = (void *)MEMORY[0x1E0C9AA60];
              if (v64)
                v66 = v64;
              else
                v66 = MEMORY[0x1E0C9AA60];
              v67 = objc_msgSend(v53, "identifier");
              if (v67)
                v68 = (const __CFString *)v67;
              else
                v68 = CFSTR("no store ID");
              v69 = objc_msgSend(v53, "configurationName");
              if (v69)
                v70 = (const __CFString *)v69;
              else
                v70 = CFSTR("no config");
              v71 = (void *)objc_msgSend((id)objc_msgSend(v54, "managedObjectModel"), "entitiesForConfiguration:", objc_msgSend(v53, "configurationName"));
              if (v71)
                v65 = (void *)objc_msgSend(v71, "valueForKey:", CFSTR("name"));
              v77[0] = CFSTR("KnownEntities");
              v77[1] = CFSTR("StoreID");
              v78[0] = v66;
              v78[1] = v68;
              v77[2] = CFSTR("Configuration");
              v77[3] = CFSTR("ConfigurationEntities");
              v78[2] = v70;
              v78[3] = v65;
              v72 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v78, v77, 4);
              if (!objc_msgSend((id)objc_msgSend((id)objc_msgSend(v54, "managedObjectModel"), "entitiesByName"), "valueForKey:", v12)|| (objc_msgSend(v65, "containsObject:", v12) & 1) != 0|| (v73 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("\"%@\" is not in current configuration - %@."), v12, v70)) == 0)
              {
                v73 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("\"%@\" is not a valid entity name."), v73, v12);
              }
              objc_msgSend(a3, "setObject:forKey:", objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99768], v73, v72), CFSTR("NSUnderlyingException"));
              v22 = 0;
              goto LABEL_87;
            }
            v55 = (uint64_t)v56;
            v12 = (_QWORD *)objc_msgSend(v56, "entityDescription");
LABEL_84:
            v57 = (void *)objc_msgSend(a3, "valueForKey:", CFSTR("explicitRestrictingEntityQualifier"));
            objc_msgSend(v57, "replaceObjectAtIndex:withObject:", objc_msgSend(v57, "indexOfObject:", v52), v55);
          }
        }
LABEL_85:
        v13 = self;
        v14 = v12;
        type = v23;
        goto LABEL_86;
      }
      if (v49 == 1)
      {
        v50 = objc_msgSend(v34, "sqlType");
        if ((_DWORD)v50 == 15)
        {
          v12 = +[_PFRoutines retainedEncodeObjectValue:forTransformableAttribute:]((uint64_t)_PFRoutines, (uint64_t)v12, (void *)objc_msgSend(v34, "propertyDescription"));
          v23 = 10;
          goto LABEL_77;
        }
        goto LABEL_64;
      }
      if (v49 == 5)
      {
        v50 = 1;
        goto LABEL_64;
      }
    }
    v50 = 0;
    goto LABEL_64;
  }
  v13 = self;
  v14 = self->_constantValue;
LABEL_86:
  v22 = -[NSSQLConstantValueIntermediate _addBindVarForConstId:ofType:inContext:](v13, v14, type, a3);
LABEL_87:
  v58 = objc_msgSend((id)objc_msgSend(a3, "objectForKey:", CFSTR("generatePairs")), "BOOLValue");
  v59 = CFSTR("(?, ?)");
  if (!v22)
    v59 = 0;
  v60 = CFSTR("?");
  if (!v22)
    v60 = 0;
  if (v58)
    v10 = (__CFString *)v59;
  else
    v10 = (__CFString *)v60;
LABEL_94:
  v61 = (void *)-[__CFString mutableCopy](v10, "mutableCopy");
  objc_autoreleasePoolPop(v5);
  return v61;
}

- (void)dealloc
{
  objc_super v3;

  self->_constantValue = 0;
  v3.receiver = self;
  v3.super_class = (Class)NSSQLConstantValueIntermediate;
  -[NSSQLConstantValueIntermediate dealloc](&v3, sel_dealloc);
}

- (NSSQLConstantValueIntermediate)initWithConstantValue:(id)a3 inScope:(id)a4 context:(id)a5
{
  NSSQLConstantValueIntermediate *v8;
  uint64_t v9;
  uint64_t v10;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)NSSQLConstantValueIntermediate;
  v8 = -[NSSQLIntermediate initWithScope:](&v12, sel_initWithScope_, a4);
  if (v8)
  {
    v8->_constantValue = a3;
    v8->_type = 0;
    objc_opt_self();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v9 = _sqlCoreLookupSQLEntityForEntityDescription((void *)objc_msgSend(a5, "objectForKey:", CFSTR("persistentStore")), a3);
      v10 = objc_msgSend(a5, "objectForKey:", CFSTR("entitySpecificationKeypath"));
      if (v10)
        objc_msgSend(a4, "setDisambiguatingEntity:withKeypath:hasToMany:", v9, v10, objc_msgSend((id)objc_msgSend(a5, "objectForKey:", CFSTR("entitySpecificationKeypathContainsToMany")), "BOOLValue"));
    }
  }
  return v8;
}

- (NSSQLConstantValueIntermediate)initWithConstantValue:(id)a3 ofType:(unsigned __int8)a4 inScope:(id)a5 context:(id)a6
{
  NSSQLConstantValueIntermediate *v10;
  NSSQLConstantValueIntermediate *v11;
  uint64_t v12;
  uint64_t v13;

  v10 = -[NSSQLConstantValueIntermediate initWithConstantValue:inScope:context:](self, "initWithConstantValue:inScope:context:", a3, a5, a6);
  v11 = v10;
  if (v10)
  {
    v10->_type = a4;
    objc_opt_self();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v12 = _sqlCoreLookupSQLEntityForEntityDescription((void *)objc_msgSend(a6, "objectForKey:", CFSTR("persistentStore")), a3);
      v13 = objc_msgSend(a6, "objectForKey:", CFSTR("entitySpecificationKeypath"));
      if (v13)
        objc_msgSend(a5, "setDisambiguatingEntity:withKeypath:hasToMany:", v12, v13, objc_msgSend((id)objc_msgSend(a6, "objectForKey:", CFSTR("entitySpecificationKeypathContainsToMany")), "BOOLValue"));
    }
  }
  return v11;
}

@end
