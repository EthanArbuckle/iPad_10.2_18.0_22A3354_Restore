@implementation NSSQLLocationAttributeRTreeExtension

- (NSSQLLocationAttributeRTreeExtension)initWithObjectFromUserInfo:(id)a3 onAttributeNamed:(id)a4 onEntity:(id)a5
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  NSSQLLocationAttributeRTreeExtension *v14;
  NSAttributeDescription *v15;
  int v16;
  NSObject *userInfoObject;
  NSArray *v18;
  objc_super v20;

  v20.receiver = self;
  v20.super_class = (Class)NSSQLLocationAttributeRTreeExtension;
  v14 = -[NSSQLLocationAttributeRTreeExtension init](&v20, sel_init);
  if (v14)
  {
    if (a3 && ((objc_msgSend(a3, "isNSArray") & 1) != 0 || (objc_msgSend(a3, "isNSString") & 1) != 0))
    {
      v14->_userInfoObject = a3;
      v14->_sqlEntity = (NSSQLEntity *)a5;
      v14->_attributeName = (NSString *)a4;
      v14->_components = 0;
      v15 = (NSAttributeDescription *)(id)objc_msgSend((id)objc_msgSend(-[NSSQLEntity entityDescription](v14->_sqlEntity, "entityDescription"), "attributesByName"), "valueForKey:", a4);
      v14->_attributeDescription = v15;
      v14->_rtreeTableName = (NSString *)+[NSSQLLocationAttributeRTreeExtension newRTReeTableNameForAttribute:onEntity:]((uint64_t)NSSQLLocationAttributeRTreeExtension, v15, (uint64_t)-[NSSQLEntity entityDescription](v14->_sqlEntity, "entityDescription"));
      v14->_latProp = 0;
      v14->_longProp = 0;
      v14->_insertSQLStrings = (NSArray *)objc_alloc_init(MEMORY[0x1E0C99D20]);
      v14->_dropSQLStrings = (NSArray *)objc_alloc_init(MEMORY[0x1E0C99D20]);
      v14->_bulkUpdateSQLStrings = (NSArray *)objc_alloc_init(MEMORY[0x1E0C99D20]);
      v16 = -[NSObject isNSArray](v14->_userInfoObject, "isNSArray");
      userInfoObject = v14->_userInfoObject;
      if (v16)
      {
        v18 = -[NSObject copy](userInfoObject, "copy");
LABEL_10:
        v14->_components = v18;
        return v14;
      }
      if (-[NSObject isNSString](userInfoObject, "isNSString"))
      {
        v18 = (NSArray *)(id)objc_msgSend((id)-[NSObject stringByReplacingOccurrencesOfString:withString:](v14->_userInfoObject, "stringByReplacingOccurrencesOfString:withString:", CFSTR(" "), &stru_1E1EE23F0), "componentsSeparatedByString:", CFSTR(","));
        goto LABEL_10;
      }
    }
    else
    {
      _NSCoreDataLog(1, (uint64_t)CFSTR("UserInfo Object for RTree location must be either an array or a comma separated string of two components identifying the latitude / longitude properties - %@"), v8, v9, v10, v11, v12, v13, (uint64_t)a4);

      return 0;
    }
  }
  return v14;
}

+ (uint64_t)newRTReeTableNameForAttribute:(uint64_t)a3 onEntity:
{
  id v5;
  void *v6;

  objc_opt_self();
  v5 = objc_alloc(MEMORY[0x1E0CB3940]);
  if (a3)
  {
    if ((*(_BYTE *)(a3 + 120) & 4) != 0)
    {
      v6 = *(void **)(a3 + 72);
    }
    else
    {
      do
      {
        v6 = (void *)a3;
        a3 = objc_msgSend((id)a3, "superentity");
      }
      while (a3);
    }
  }
  else
  {
    v6 = 0;
  }
  return objc_msgSend(v5, "initWithFormat:", CFSTR("Z_RT_%@_%@"), objc_msgSend(v6, "name"), objc_msgSend(a2, "name"));
}

- (void)dealloc
{
  objc_super v3;

  self->_userInfoObject = 0;
  self->_components = 0;

  self->_sqlEntity = 0;
  self->_attributeName = 0;

  self->_attributeDescription = 0;
  self->_rtreeTableName = 0;

  self->_latProp = 0;
  self->_longProp = 0;

  self->_insertSQLStrings = 0;
  self->_dropSQLStrings = 0;

  self->_bulkUpdateSQLStrings = 0;
  v3.receiver = self;
  v3.super_class = (Class)NSSQLLocationAttributeRTreeExtension;
  -[NSSQLLocationAttributeRTreeExtension dealloc](&v3, sel_dealloc);
}

- (NSArray)insertSQLStrings
{
  return self->_insertSQLStrings;
}

- (NSArray)dropSQLStrings
{
  return self->_dropSQLStrings;
}

- (NSArray)bulkUpdateSQLStrings
{
  return self->_bulkUpdateSQLStrings;
}

- (BOOL)isEqualToExtension:(id)a3
{
  BOOL v5;
  NSUInteger v6;
  void *v7;
  NSArray *components;
  uint64_t v9;
  uint64_t v10;
  _QWORD v12[6];
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  char v16;
  objc_super v17;

  v17.receiver = self;
  v17.super_class = (Class)NSSQLLocationAttributeRTreeExtension;
  if ((-[NSSQLLocationAttributeRTreeExtension isEqual:](&v17, sel_isEqual_) & 1) != 0)
    return 1;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    return 0;
  v6 = -[NSArray count](self->_components, "count");
  v7 = a3 ? (void *)*((_QWORD *)a3 + 2) : 0;
  if (v6 != objc_msgSend(v7, "count"))
    return 0;
  v13 = 0;
  v14 = &v13;
  v15 = 0x2020000000;
  v16 = 1;
  components = self->_components;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __59__NSSQLLocationAttributeRTreeExtension_isEqualToExtension___block_invoke;
  v12[3] = &unk_1E1EE07F0;
  v12[4] = a3;
  v12[5] = &v13;
  -[NSArray enumerateObjectsUsingBlock:](components, "enumerateObjectsUsingBlock:", v12);
  if (*((_BYTE *)v14 + 24)
    && (!a3 ? (v9 = 0) : (v9 = *((_QWORD *)a3 + 6)),
        -[NSAttributeDescription isEqual:](self->_attributeDescription, "isEqual:", v9)))
  {
    if (a3)
      v10 = *((_QWORD *)a3 + 3);
    else
      v10 = 0;
    v5 = -[NSStoreMapping isEqual:](self->_sqlEntity, "isEqual:", v10);
  }
  else
  {
    v5 = 0;
  }
  _Block_object_dispose(&v13, 8);
  return v5;
}

uint64_t __59__NSSQLLocationAttributeRTreeExtension_isEqualToExtension___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  uint64_t v6;
  void *v7;
  uint64_t result;

  v6 = *(_QWORD *)(a1 + 32);
  if (v6)
    v7 = *(void **)(v6 + 16);
  else
    v7 = 0;
  result = objc_msgSend(a2, "isEqualToString:", objc_msgSend(v7, "objectAtIndexedSubscript:"));
  if ((result & 1) == 0)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 0;
    *a4 = 1;
  }
  return result;
}

- (BOOL)validate:(id *)a3
{
  id v5;
  NSAttributeDescription *attributeDescription;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t *v11;
  uint64_t *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t *v16;
  uint64_t *v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  BOOL v23;
  NSArray *components;
  id v25;
  id v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  NSObject *v35;
  void *v37;
  uint8_t buf[4];
  const char *v39;
  __int16 v40;
  int v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  _QWORD v51[2];

  v51[1] = *MEMORY[0x1E0C80C00];
  v37 = 0;
  v5 = -[NSSQLEntity entityDescription](self->_sqlEntity, "entityDescription");
  attributeDescription = self->_attributeDescription;
  if (!attributeDescription)
  {
    v13 = (void *)MEMORY[0x1E0CB35C8];
    v14 = *MEMORY[0x1E0CB28A8];
    v42 = *MEMORY[0x1E0CB2D68];
    v43 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Unable to configure location index: couldn't find an attribute named '%@' on '%@'"), self->_attributeName, objc_msgSend(-[NSSQLEntity entityDescription](self->_sqlEntity, "entityDescription"), "name"));
    v15 = (void *)MEMORY[0x1E0C99D80];
    v16 = &v43;
    v17 = &v42;
LABEL_6:
    v18 = objc_msgSend(v15, "dictionaryWithObjects:forKeys:count:", v16, v17, 1);
    v19 = v13;
    v20 = v14;
    goto LABEL_9;
  }
  if (!-[NSPropertyDescription isTransient](attributeDescription, "isTransient"))
  {
    v21 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("RTree tables can only be created to back transient attributes. %@.%@ is not transient."), objc_msgSend(v5, "name"), -[NSPropertyDescription name](self->_attributeDescription, "name"));
    v8 = (void *)MEMORY[0x1E0CB35C8];
    v9 = *MEMORY[0x1E0CB28A8];
    v44 = *MEMORY[0x1E0CB2D68];
    v45 = v21;
    v10 = (void *)MEMORY[0x1E0C99D80];
    v11 = &v45;
    v12 = &v44;
    goto LABEL_8;
  }
  if (-[NSAttributeDescription attributeType](self->_attributeDescription, "attributeType"))
  {
    v7 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Unable to configure location index: %@.%@ type is %@ but should be %@."), objc_msgSend(v5, "name"), -[NSPropertyDescription name](self->_attributeDescription, "name"), +[NSAttributeDescription stringForAttributeType:](NSAttributeDescription, "stringForAttributeType:", -[NSAttributeDescription attributeType](self->_attributeDescription, "attributeType")), +[NSAttributeDescription stringForAttributeType:](NSAttributeDescription, "stringForAttributeType:", 0));
    v8 = (void *)MEMORY[0x1E0CB35C8];
    v9 = *MEMORY[0x1E0CB28A8];
    v46 = *MEMORY[0x1E0CB2D68];
    v47 = v7;
    v10 = (void *)MEMORY[0x1E0C99D80];
    v11 = &v47;
    v12 = &v46;
LABEL_8:
    v18 = objc_msgSend(v10, "dictionaryWithObjects:forKeys:count:", v11, v12, 1);
    v19 = v8;
    v20 = v9;
LABEL_9:
    v22 = (void *)objc_msgSend(v19, "errorWithDomain:code:userInfo:", v20, 134060, v18);
    v37 = v22;
    if (v22)
      goto LABEL_10;
LABEL_22:
    v28 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Illegal attempt to return an error without one in %s:%d");
    _NSCoreDataLog(17, v28, v29, v30, v31, v32, v33, v34, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Persistence/NSSQLLocationAttributeRTreeExtension.m");
    v35 = __pflogFaultLog;
    if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 136315394;
      v39 = "/Library/Caches/com.apple.xbs/Sources/Persistence/NSSQLLocationAttributeRTreeExtension.m";
      v40 = 1024;
      v41 = 181;
      _os_log_fault_impl(&dword_18A253000, v35, OS_LOG_TYPE_FAULT, "CoreData: Illegal attempt to return an error without one in %s:%d", buf, 0x12u);
    }
    return 0;
  }
  components = self->_components;
  if (!components)
  {
    v13 = (void *)MEMORY[0x1E0CB35C8];
    v14 = *MEMORY[0x1E0CB28A8];
    v48 = *MEMORY[0x1E0CB2D68];
    v49 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@.%@ has an invalid description for a location index. It must be either an array or a comma separated string of two components identifying the latitude / longitude properties to use."), objc_msgSend(-[NSSQLEntity entityDescription](self->_sqlEntity, "entityDescription"), "name"), self->_attributeName);
    v15 = (void *)MEMORY[0x1E0C99D80];
    v16 = &v49;
    v17 = &v48;
    goto LABEL_6;
  }
  if (-[NSArray count](components, "count") != 2)
  {
    v13 = (void *)MEMORY[0x1E0CB35C8];
    v14 = *MEMORY[0x1E0CB28A8];
    v50 = *MEMORY[0x1E0CB2D68];
    v51[0] = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("'%@' is not a valid description for a location index, it should include two comma separated components or be an array of two string identifying the attributes which make up the location index."), self->_userInfoObject);
    v15 = (void *)MEMORY[0x1E0C99D80];
    v16 = v51;
    v17 = &v50;
    goto LABEL_6;
  }
  v25 = -[NSArray firstObject](self->_components, "firstObject");
  v26 = -[NSArray lastObject](self->_components, "lastObject");
  if (v5)
  {
    self->_latProp = (NSAttributeDescription *)(id)objc_msgSend((id)objc_msgSend(v5, "propertiesByName"), "objectForKey:", v25);
    v27 = (void *)objc_msgSend((id)objc_msgSend(v5, "propertiesByName"), "objectForKey:", v26);
  }
  else
  {
    v27 = 0;
    self->_latProp = 0;
  }
  self->_longProp = (NSAttributeDescription *)v27;
  if (-[NSSQLLocationAttributeRTreeExtension validatePropertyWithDescription:andName:forUseAs:onAttributeNamed:onEntityNamed:error:]((_BOOL8)self, self->_latProp, (uint64_t)v25, (uint64_t)CFSTR("latitude"), (uint64_t)self->_attributeName, objc_msgSend(v5, "name"), (uint64_t *)&v37)&& -[NSSQLLocationAttributeRTreeExtension validatePropertyWithDescription:andName:forUseAs:onAttributeNamed:onEntityNamed:error:]((_BOOL8)self, self->_longProp, (uint64_t)v26, (uint64_t)CFSTR("longitude"), (uint64_t)self->_attributeName, objc_msgSend(v5, "name"), (uint64_t *)&v37))
  {
    -[NSSQLLocationAttributeRTreeExtension generateSQLStrings]((uint64_t)self);
    return 1;
  }
  v22 = v37;
  if (!v37)
    goto LABEL_22;
LABEL_10:
  if (!a3)
    return 0;
  v23 = 0;
  *a3 = v22;
  return v23;
}

- (BOOL)validatePropertyWithDescription:(uint64_t)a3 andName:(uint64_t)a4 forUseAs:(uint64_t)a5 onAttributeNamed:(uint64_t)a6 onEntityNamed:(uint64_t *)a7 error:
{
  uint64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;
  uint64_t *v20;
  uint64_t *v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  NSObject *v37;
  uint8_t buf[4];
  const char *v39;
  __int16 v40;
  int v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  _QWORD v49[3];

  v49[1] = *MEMORY[0x1E0C80C00];
  if (result)
  {
    v13 = result;
    v14 = (void *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Unable to configure location index (invalid %@ on %@.%@): "), a4, a6, a5);
    v15 = v14;
    if (a2)
    {
      if (objc_msgSend(a2, "_isAttribute"))
      {
        if ((objc_msgSend(a2, "isTransient") & 1) != 0)
        {
          v16 = objc_msgSend(v15, "stringByAppendingFormat:", CFSTR("%@.%@ is a transient attribute."), a6, a3);
          v17 = (void *)MEMORY[0x1E0CB35C8];
          v18 = *MEMORY[0x1E0CB28A8];
          v46 = *MEMORY[0x1E0CB2D68];
          v47 = v16;
          v19 = (void *)MEMORY[0x1E0C99D80];
          v20 = &v47;
          v21 = &v46;
        }
        else
        {
          if (objc_msgSend(a2, "attributeType") == 500)
            return 1;
          v28 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Unable to configure location index (invalid %@ on %@.%@): %@.%@ is of type %@ and should be of type %@."), a4, objc_msgSend((id)objc_msgSend(*(id *)(v13 + 24), "entityDescription"), "name"), a5, objc_msgSend((id)objc_msgSend(*(id *)(v13 + 24), "entityDescription"), "name"), a3, +[NSAttributeDescription stringForAttributeType:](NSAttributeDescription, "stringForAttributeType:", objc_msgSend(a2, "attributeType")), +[NSAttributeDescription stringForAttributeType:](NSAttributeDescription, "stringForAttributeType:", 500));
          v17 = (void *)MEMORY[0x1E0CB35C8];
          v18 = *MEMORY[0x1E0CB28A8];
          v48 = *MEMORY[0x1E0CB2D68];
          v49[0] = v28;
          v19 = (void *)MEMORY[0x1E0C99D80];
          v20 = v49;
          v21 = &v48;
        }
      }
      else
      {
        v27 = objc_msgSend(v15, "stringByAppendingFormat:", CFSTR("%@.%@ is a relationship."), a6, a3);
        v17 = (void *)MEMORY[0x1E0CB35C8];
        v18 = *MEMORY[0x1E0CB28A8];
        v44 = *MEMORY[0x1E0CB2D68];
        v45 = v27;
        v19 = (void *)MEMORY[0x1E0C99D80];
        v20 = &v45;
        v21 = &v44;
      }
      v24 = objc_msgSend(v19, "dictionaryWithObjects:forKeys:count:", v20, v21, 1);
      v25 = v17;
      v26 = v18;
    }
    else
    {
      v22 = (void *)MEMORY[0x1E0CB35C8];
      v23 = *MEMORY[0x1E0CB28A8];
      v42 = *MEMORY[0x1E0CB2D68];
      v43 = objc_msgSend(v14, "stringByAppendingFormat:", CFSTR("couldn't find an attribute named '%@' on '%@' to use as the %@."), a3, a6, a4);
      v24 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v43, &v42, 1);
      v25 = v22;
      v26 = v23;
    }
    v29 = objc_msgSend(v25, "errorWithDomain:code:userInfo:", v26, 134060, v24);
    if (v29)
    {
      if (a7)
      {
        result = 0;
        *a7 = v29;
        return result;
      }
    }
    else
    {
      v30 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Illegal attempt to return an error without one in %s:%d");
      _NSCoreDataLog(17, v30, v31, v32, v33, v34, v35, v36, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Persistence/NSSQLLocationAttributeRTreeExtension.m");
      v37 = __pflogFaultLog;
      result = os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT);
      if (!result)
        return result;
      *(_DWORD *)buf = 136315394;
      v39 = "/Library/Caches/com.apple.xbs/Sources/Persistence/NSSQLLocationAttributeRTreeExtension.m";
      v40 = 1024;
      v41 = 226;
      _os_log_fault_impl(&dword_18A253000, v37, OS_LOG_TYPE_FAULT, "CoreData: Illegal attempt to return an error without one in %s:%d", buf, 0x12u);
    }
    return 0;
  }
  return result;
}

- (void)generateSQLStrings
{
  id *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  id v11;
  id v12;

  if (a1)
  {
    v2 = *(id **)(a1 + 24);
    v3 = objc_msgSend(*(id *)(a1 + 56), "name");
    if (v2)
      v2 = (id *)objc_msgSend(v2[5], "objectForKey:", v3);
    v4 = *(_QWORD *)(a1 + 24);
    v5 = objc_msgSend(*(id *)(a1 + 64), "name");
    if (v4)
      v6 = (void *)objc_msgSend(*(id *)(v4 + 40), "objectForKey:", v5);
    else
      v6 = 0;
    v7 = objc_msgSend(*(id *)(a1 + 24), "tableName");
    v8 = objc_msgSend(v2, "columnName");
    v9 = objc_msgSend(v6, "columnName");
    v10 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v11 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v12 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    objc_msgSend(v10, "addObject:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("CREATE VIRTUAL TABLE IF NOT EXISTS %@ USING RTREE (Z_PK INTEGER PRIMARY KEY, %@_MIN FLOAT, %@_MAX FLOAT, %@_MIN FLOAT, %@_MAX FLOAT)"), *(_QWORD *)(a1 + 40), v8, v8, v9, v9));
    objc_msgSend(v11, "addObject:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("DROP TABLE IF EXISTS %@"), *(_QWORD *)(a1 + 40)));
    objc_msgSend(v10, "addObject:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("CREATE TRIGGER IF NOT EXISTS %@_INSERT AFTER INSERT ON %@ FOR EACH ROW BEGIN INSERT OR REPLACE INTO %@ (Z_PK, %@_MIN, %@_MAX, %@_MIN, %@_MAX) VALUES (NEW.Z_PK, NEW.%@ ,NEW.%@, NEW.%@, NEW.%@) ; END"),
        *(_QWORD *)(a1 + 40),
        v7,
        *(_QWORD *)(a1 + 40),
        v8,
        v8,
        v9,
        v9,
        v8,
        v8,
        v9,
        v9));
    objc_msgSend(v11, "addObject:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("DROP TRIGGER IF EXISTS %@_INSERT"), *(_QWORD *)(a1 + 40)));
    objc_msgSend(v10, "addObject:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("CREATE TRIGGER IF NOT EXISTS %@_UPDATE AFTER UPDATE ON %@ FOR EACH ROW BEGIN DELETE FROM %@ WHERE Z_PK = NEW.Z_PK ; INSERT INTO %@ (Z_PK, %@_MIN, %@_MAX, %@_MIN, %@_MAX) VALUES (NEW.Z_PK, NEW.%@ ,NEW.%@, NEW.%@, NEW.%@) ; END"),
        *(_QWORD *)(a1 + 40),
        v7,
        *(_QWORD *)(a1 + 40),
        *(_QWORD *)(a1 + 40),
        v8,
        v8,
        v9,
        v9,
        v8,
        v8,
        v9,
        v9));
    objc_msgSend(v11, "addObject:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("DROP TRIGGER IF EXISTS %@_UPDATE"), *(_QWORD *)(a1 + 40)));
    objc_msgSend(v10, "addObject:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("CREATE TRIGGER IF NOT EXISTS %@_DELETE AFTER DELETE ON %@ FOR EACH ROW BEGIN DELETE FROM %@ WHERE Z_PK = OLD.Z_PK ; END"),
        *(_QWORD *)(a1 + 40),
        v7,
        *(_QWORD *)(a1 + 40)));
    objc_msgSend(v11, "addObject:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("DROP TRIGGER IF EXISTS %@_DELETE"), *(_QWORD *)(a1 + 40)));
    objc_msgSend(v12, "addObject:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("INSERT OR REPLACE INTO %@ (Z_PK, %@_MIN, %@_MAX, %@_MIN, %@_MAX) SELECT Z_PK, %@, %@, %@, %@ from %@ where %@ NOT NULL and %@ NOT NULL"), *(_QWORD *)(a1 + 40), v8, v8, v9, v9, v8, v8, v9, v9, v7, v8, v9));

    *(_QWORD *)(a1 + 72) = objc_msgSend(v10, "copy");
    *(_QWORD *)(a1 + 80) = objc_msgSend(v11, "copy");

    *(_QWORD *)(a1 + 88) = objc_msgSend(v12, "copy");
  }
}

@end
