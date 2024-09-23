@implementation NSBatchUpdateRequest

- (NSPredicate)predicate
{
  return (NSPredicate *)objc_getProperty(self, a2, 24, 1);
}

- (BOOL)includesSubentities
{
  return *(_DWORD *)&self->_flags & 1;
}

- (unint64_t)requestType
{
  return 6;
}

- (void)_resolveEntityWithContext:(id)a3
{
  int v5;
  _QWORD *v6;
  uint64_t v7;
  id *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  id v12;
  NSDictionary *v13;
  id entity;

  if ((*(_BYTE *)&self->_flags & 8) != 0)
  {
    v5 = objc_msgSend(a3, "_allowAncillaryEntities");
    v6 = (_QWORD *)objc_msgSend(a3, "persistentStoreCoordinator");
    if (v5)
    {
      if (!v6)
        goto LABEL_10;
      v7 = v6[12];
      if (!v7)
        goto LABEL_10;
      v8 = (id *)(v7 + 56);
    }
    else
    {
      v9 = objc_msgSend(v6, "managedObjectModel");
      if (!v9)
        goto LABEL_10;
      v8 = (id *)(v9 + 32);
    }
    v10 = (void *)objc_msgSend(*v8, "objectForKey:", self->_entity);
    if (v10)
    {
      v11 = v10;
      v12 = v10;
      entity = self->_entity;
      self->_entity = v11;
      *(_DWORD *)&self->_flags &= ~8u;
      v13 = self->_columnsToUpdate;
      -[NSBatchUpdateRequest _setValidatedPropertiesToUpdate:]((id *)&self->super.super.isa, v13);

      return;
    }
LABEL_10:
    objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99768], objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Can't find entity for batch update (%@)"), self->_entity), 0));
  }
}

- (void)setPredicate:(NSPredicate *)predicate
{
  objc_setProperty_atomic(self, a2, predicate, 24);
}

- (NSBatchUpdateRequest)initWithEntity:(NSEntityDescription *)entity
{
  NSBatchUpdateRequest *v4;

  v4 = -[NSBatchUpdateRequest init](self, "init");
  if (v4)
    v4->_entity = entity;
  return v4;
}

- (NSBatchUpdateRequest)init
{
  NSBatchUpdateRequest *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)NSBatchUpdateRequest;
  result = -[NSBatchUpdateRequest init](&v3, sel_init);
  if (result)
    result->_flags = (_requestFlags)(*(_DWORD *)&result->_flags & 0xFFFFFFF8 | 1);
  return result;
}

- (void)dealloc
{
  objc_super v3;

  self->_entity = 0;
  self->_predicate = 0;

  self->_columnsToUpdate = 0;
  v3.receiver = self;
  v3.super_class = (Class)NSBatchUpdateRequest;
  -[NSPersistentStoreRequest dealloc](&v3, sel_dealloc);
}

- (void)setPropertiesToUpdate:(NSDictionary *)propertiesToUpdate
{
  NSDictionary *v5;

  if (self->_columnsToUpdate != propertiesToUpdate)
  {
    if ((*(_BYTE *)&self->_flags & 8) != 0)
    {
      v5 = propertiesToUpdate;

      self->_columnsToUpdate = propertiesToUpdate;
    }
    else
    {
      -[NSBatchUpdateRequest _setValidatedPropertiesToUpdate:]((id *)&self->super.super.isa, propertiesToUpdate);
    }
  }
}

- (void)_setValidatedPropertiesToUpdate:(id *)a1
{
  id *v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;
  id v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  void *v21;
  uint64_t *v22;
  const __CFString **v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  uint64_t v34;
  id v35;
  uint64_t v36;
  uint64_t v37;
  void *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  void *v42;
  uint64_t v43;
  id v44;
  id *v45;
  void *v46;
  uint64_t v47;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  const __CFString *v53;
  uint64_t v54;
  const __CFString *v55;
  uint64_t v56;
  const __CFString *v57;
  uint64_t v58;
  const __CFString *v59;
  uint64_t v60;
  const __CFString *v61;
  uint64_t v62;
  const __CFString *v63;
  uint64_t v64;
  const __CFString *v65;
  uint64_t v66;
  const __CFString *v67;
  uint64_t v68;
  _BYTE v69[128];
  uint64_t v70;

  v70 = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    v2 = a1;
    v3 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    v49 = 0u;
    v50 = 0u;
    v51 = 0u;
    v52 = 0u;
    v47 = objc_msgSend(a2, "countByEnumeratingWithState:objects:count:", &v49, v69, 16);
    if (v47)
    {
      v4 = *(_QWORD *)v50;
      v45 = v2;
LABEL_4:
      v5 = 0;
      while (1)
      {
        if (*(_QWORD *)v50 != v4)
          objc_enumerationMutation(a2);
        v6 = *(void **)(*((_QWORD *)&v49 + 1) + 8 * v5);
        v7 = (void *)MEMORY[0x18D76B4E4]();
        v8 = objc_msgSend(a2, "objectForKey:", v6);
        if (objc_msgSend(v6, "isNSString"))
        {
          v46 = v7;
          v9 = (void *)objc_msgSend(v6, "componentsSeparatedByString:", CFSTR("."));
          v10 = (void *)objc_msgSend(v2, "entity");
          if (objc_msgSend(v9, "count") != 1)
          {

            v36 = objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid string keypath %@ passed to propertiesToUpdate:"), v6), 0);
            v37 = *MEMORY[0x1E0CB28A8];
            v67 = CFSTR("NSUnderlyingException");
            v68 = v36;
            v33 = (void *)objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", v37, 134060, objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v68, &v67, 1));
            v2 = v45;
            v7 = v46;
            goto LABEL_33;
          }
          v11 = (void *)objc_msgSend((id)objc_msgSend(v10, "propertiesByName"), "objectForKey:", objc_msgSend(v9, "objectAtIndex:", 0));
          v2 = v45;
          v7 = v46;
          if (!v11 || (v6 = v11, objc_msgSend(v11, "isTransient")))
          {

            v24 = objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid string key %@ passed to propertiesToUpdate:"), 0), 0);
            v19 = (void *)MEMORY[0x1E0CB35C8];
            v20 = *MEMORY[0x1E0CB28A8];
            v65 = CFSTR("NSUnderlyingException");
            v66 = v24;
            v21 = (void *)MEMORY[0x1E0C99D80];
            v22 = &v66;
            v23 = &v65;
            goto LABEL_31;
          }
        }
        v12 = (void *)objc_msgSend(v2, "entity");
        v13 = objc_msgSend(v6, "name");
        if (!v12
          || (v14 = (void *)objc_msgSend((id)objc_msgSend(v12, "propertiesByName"), "objectForKey:", v13)) == 0)
        {

          v18 = objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Attribute/relationship description names passed to propertiesToUpdate must match name on fetch entity (%@)"), 0), 0);
          v19 = (void *)MEMORY[0x1E0CB35C8];
          v20 = *MEMORY[0x1E0CB28A8];
          v63 = CFSTR("NSUnderlyingException");
          v64 = v18;
          v21 = (void *)MEMORY[0x1E0C99D80];
          v22 = &v64;
          v23 = &v63;
          goto LABEL_31;
        }
        v15 = v14;
        if (objc_msgSend(v14, "isTransient"))
        {

          v25 = objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid property %@ passed as key to propertiesToUpdate:"), v15), 0);
          v19 = (void *)MEMORY[0x1E0CB35C8];
          v20 = *MEMORY[0x1E0CB28A8];
          v61 = CFSTR("NSUnderlyingException");
          v62 = v25;
          v21 = (void *)MEMORY[0x1E0C99D80];
          v22 = &v62;
          v23 = &v61;
          goto LABEL_31;
        }
        v16 = objc_msgSend(v15, "_propertyType");
        switch(v16)
        {
          case 4:

            v26 = objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid relationship (%@) passed to propertiesToUpdate:"), v15), 0);
            v19 = (void *)MEMORY[0x1E0CB35C8];
            v20 = *MEMORY[0x1E0CB28A8];
            v57 = CFSTR("NSUnderlyingException");
            v58 = v26;
            v21 = (void *)MEMORY[0x1E0C99D80];
            v22 = &v58;
            v23 = &v57;
            goto LABEL_31;
          case 6:

            v27 = objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid derived attribute (%@) passed to propertiesToUpdate:"), v15), 0);
            v19 = (void *)MEMORY[0x1E0CB35C8];
            v20 = *MEMORY[0x1E0CB28A8];
            v55 = CFSTR("NSUnderlyingException");
            v56 = v27;
            v21 = (void *)MEMORY[0x1E0C99D80];
            v22 = &v56;
            v23 = &v55;
            goto LABEL_31;
          case 5:

            v28 = objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid expressionDescription %@ passed as key to propertiesToUpdate:"), v15), 0);
            v19 = (void *)MEMORY[0x1E0CB35C8];
            v20 = *MEMORY[0x1E0CB28A8];
            v59 = CFSTR("NSUnderlyingException");
            v60 = v28;
            v21 = (void *)MEMORY[0x1E0C99D80];
            v22 = &v60;
            v23 = &v59;
LABEL_31:
            v29 = objc_msgSend(v21, "dictionaryWithObjects:forKeys:count:", v22, v23, 1);
            v30 = v19;
            v31 = v20;
            v32 = 134060;
LABEL_32:
            v33 = (void *)objc_msgSend(v30, "errorWithDomain:code:userInfo:", v31, v32, v29);
LABEL_33:
            v17 = v33;
            objc_autoreleasePoolPop(v7);
            v3 = 0;
            goto LABEL_34;
        }
        if (HIBYTE(dword_1ECD8DE20))
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0 && (objc_msgSend(v15, "isOptional") & 1) == 0)
          {

            v38 = (void *)MEMORY[0x1E0C99D80];
            v39 = objc_msgSend(v15, "name");
            v40 = objc_msgSend(v38, "dictionaryWithObjectsAndKeys:", v12, CFSTR("NSValidationErrorObject"), v39, CFSTR("NSValidationErrorKey"), objc_msgSend(MEMORY[0x1E0C99E38], "null"), CFSTR("NSValidationErrorValue"), 0);
            v41 = objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid NULL value for key (%@) passed to propertiesToUpdate:"), objc_msgSend(v15, "name")), v40);
            v42 = (void *)MEMORY[0x1E0CB35C8];
            v43 = *MEMORY[0x1E0CB28A8];
            v53 = CFSTR("NSUnderlyingException");
            v54 = v41;
            v29 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v54, &v53, 1);
            v30 = v42;
            v31 = v43;
            v32 = 1570;
            goto LABEL_32;
          }
        }
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
          v8 = objc_msgSend(MEMORY[0x1E0CB35D0], "expressionForConstantValue:", v8);
        objc_msgSend(v3, "setObject:forKey:", v8, v15);
        objc_autoreleasePoolPop(v7);
        if (v47 == ++v5)
        {
          v47 = objc_msgSend(a2, "countByEnumeratingWithState:objects:count:", &v49, v69, 16);
          if (v47)
            goto LABEL_4;
          break;
        }
      }
    }
    v17 = 0;
LABEL_34:
    v34 = objc_msgSend(v3, "count");
    if (v34 != objc_msgSend(a2, "count"))
    {

      if (v17)
        v44 = v17;
LABEL_46:
      objc_exception_throw((id)objc_msgSend((id)objc_msgSend(v17, "userInfo"), "valueForKey:", CFSTR("NSUnderlyingException")));
    }
    if (v17)
    {
      v35 = v17;
      if (!v3)
        goto LABEL_46;
    }
    else if (!v3)
    {
      v17 = 0;
      goto LABEL_46;
    }

    v2[5] = v3;
  }
}

- (NSEntityDescription)entity
{
  if ((*(_BYTE *)&self->_flags & 8) != 0)
    objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0CB2FA8], objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("This batch update request (%p) was created with a string name (%@), and cannot respond to -entity until used by an NSManagedObjectContext"), self, self->_entity, 0), 0));
  return (NSEntityDescription *)self->_entity;
}

- (NSBatchUpdateRequestResultType)resultType
{
  return ((unint64_t)self->_flags >> 1) & 3;
}

- (NSDictionary)propertiesToUpdate
{
  return self->_columnsToUpdate;
}

- (BOOL)_secureOperation
{
  return (*(_BYTE *)&self->_flags >> 4) & 1;
}

- (id)encodeForXPC
{
  id v2;
  void *v3;
  id v4;

  v2 = -[NSBatchUpdateRequestEncodingToken initForRequest:]([NSBatchUpdateRequestEncodingToken alloc], "initForRequest:", self);
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB36F8]), "initRequiringSecureCoding:", 1);
  objc_msgSend(v3, "setDelegate:", objc_opt_class());
  objc_msgSend(v3, "encodeObject:forKey:", v2, CFSTR("root"));
  objc_msgSend(v3, "finishEncoding");
  v4 = (id)objc_msgSend(v3, "encodedData");

  return v4;
}

+ (id)decodeFromXPCArchive:(id)a3 withContext:(id)a4 withPolicy:(id)a5
{
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  int v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  int v16;
  uint64_t v17;
  NSBatchUpdateRequest *v18;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3710]), "initForReadingFromData:error:", a3, 0);
  objc_msgSend(v7, "setDelegate:", a4);
  v8 = (void *)objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", objc_opt_class());
  if (a5)
    v8 = (void *)objc_msgSend(v8, "setByAddingObjectsFromSet:", objc_msgSend(a5, "allowableClassesForClientWithContext:", a4));
  v9 = (void *)objc_msgSend(v7, "decodeObjectOfClasses:forKey:", v8, CFSTR("root"));

  v22 = 0u;
  v23 = 0u;
  v20 = 0u;
  v21 = 0u;
  v10 = (void *)objc_msgSend((id)objc_msgSend(v9, "columnsToUpdate", 0), "allValues");
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v11)
  {
    v12 = 0;
    v13 = *(_QWORD *)v21;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v21 != v13)
          objc_enumerationMutation(v10);
        v15 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * i);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          v16 = objc_msgSend(v15, "constantValue") == 0;
        else
          v16 = objc_msgSend(v15, "isEqual:", objc_msgSend(MEMORY[0x1E0C99E38], "null"));
        v12 += v16;
      }
      v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    }
    while (v11);
    v17 = v12;
  }
  else
  {
    v17 = 0;
  }
  if (objc_msgSend(v9, "nullValueCount") != v17)
    return 0;
  v18 = -[NSBatchUpdateRequest initWithEntityName:]([NSBatchUpdateRequest alloc], "initWithEntityName:", objc_msgSend(v9, "entityName"));
  -[NSBatchUpdateRequest setPredicate:](v18, "setPredicate:", objc_msgSend(v9, "predicate"));
  -[NSBatchUpdateRequest setPropertiesToUpdate:](v18, "setPropertiesToUpdate:", objc_msgSend(v9, "columnsToUpdate"));
  -[NSBatchUpdateRequest setResultType:](v18, "setResultType:", objc_msgSend(v9, "resultType"));
  -[NSBatchUpdateRequest setIncludesSubentities:](v18, "setIncludesSubentities:", objc_msgSend(v9, "includeSubEntities"));
  -[NSBatchUpdateRequest _setSecureOperation:](v18, "_setSecureOperation:", objc_msgSend(v9, "secure"));
  return v18;
}

+ (NSBatchUpdateRequest)batchUpdateRequestWithEntityName:(NSString *)entityName
{
  return (NSBatchUpdateRequest *)(id)objc_msgSend(objc_alloc((Class)a1), "initWithEntityName:", entityName);
}

- (NSBatchUpdateRequest)initWithEntityName:(NSString *)entityName
{
  NSBatchUpdateRequest *v4;

  v4 = -[NSBatchUpdateRequest init](self, "init");
  if (v4)
  {
    v4->_entity = entityName;
    *(_DWORD *)&v4->_flags |= 8u;
  }
  return v4;
}

- (NSString)description
{
  return (NSString *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<NSBatchUpdateRequest : entity = %@, properties = %@, subentities = %d, predicate = %@"), -[NSBatchUpdateRequest entityName](self, "entityName"), self->_columnsToUpdate, *(_DWORD *)&self->_flags & 1, self->_predicate);
}

- (NSString)entityName
{
  NSString *result;

  result = (NSString *)self->_entity;
  if ((*(_BYTE *)&self->_flags & 8) == 0)
    return (NSString *)-[NSString name](result, "name");
  return result;
}

- (void)setIncludesSubentities:(BOOL)includesSubentities
{
  self->_flags = (_requestFlags)(*(_DWORD *)&self->_flags & 0xFFFFFFFE | includesSubentities);
}

- (void)setResultType:(NSBatchUpdateRequestResultType)resultType
{
  self->_flags = (_requestFlags)(*(_DWORD *)&self->_flags & 0xFFFFFFF9 | (2 * (resultType & 3)));
}

- (void)_setSecureOperation:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  self->_flags = (_requestFlags)(*(_DWORD *)&self->_flags & 0xFFFFFFEF | v3);
}

@end
