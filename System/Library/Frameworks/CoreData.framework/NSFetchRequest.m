@implementation NSFetchRequest

- (void)dealloc
{
  objc_super v3;

  if ((*((_BYTE *)&self->_flags + 1) & 2) != 0)

  self->_entity = 0;
  self->_predicate = 0;

  self->_sortDescriptors = 0;
  self->_relationshipKeyPathsForPrefetching = 0;

  self->_valuesToFetch = 0;
  self->_groupByProperties = 0;

  self->_havingPredicate = 0;
  *((_QWORD *)self->_additionalPrivateIvars + 1) = 0;
  PF_FREE_OBJECT_ARRAY(self->_additionalPrivateIvars);
  self->_additionalPrivateIvars = 0;
  v3.receiver = self;
  v3.super_class = (Class)NSFetchRequest;
  -[NSPersistentStoreRequest dealloc](&v3, sel_dealloc);
}

- (BOOL)_disablePersistentStoreResultCaching
{
  return (*((unsigned __int8 *)&self->_flags + 1) >> 5) & 1;
}

- (unint64_t)requestType
{
  return 1;
}

- (NSArray)propertiesToFetch
{
  return self->_valuesToFetch;
}

- (NSUInteger)fetchBatchSize
{
  return self->_batchSize;
}

- (NSFetchRequestResultType)resultType
{
  return ((unint64_t)self->_flags >> 3) & 7;
}

- (NSEntityDescription)entity
{
  if ((*((_BYTE *)&self->_flags + 1) & 2) != 0)
    objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0CB2FA8], objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("This fetch request (%p) was created with a string name (%@), and cannot respond to -entity until used by an NSManagedObjectContext"), self, self->_entity, 0), 0));
  return self->_entity;
}

- (NSUInteger)fetchLimit
{
  return self->_fetchLimit;
}

- (BOOL)returnsObjectsAsFaults
{
  return (*(_BYTE *)&self->_flags >> 6) & 1;
}

- (NSArray)relationshipKeyPathsForPrefetching
{
  return self->_relationshipKeyPathsForPrefetching;
}

- (BOOL)includesPropertyValues
{
  return (*(_BYTE *)&self->_flags >> 2) & 1;
}

- (BOOL)_isAsyncRequest
{
  return (*((unsigned __int8 *)&self->_flags + 2) >> 5) & 1;
}

- (void)setFetchLimit:(NSUInteger)fetchLimit
{
  unsigned int v3;

  v3 = fetchLimit;
  -[NSFetchRequest _throwIfNotEditable](self, "_throwIfNotEditable");
  self->_fetchLimit = v3;
}

- (NSPredicate)predicate
{
  return self->_predicate;
}

- (BOOL)includesSubentities
{
  return (*(_BYTE *)&self->_flags >> 1) & 1;
}

- (void)setSortDescriptors:(NSArray *)sortDescriptors
{
  NSArray *v5;

  -[NSFetchRequest _throwIfNotEditable](self, "_throwIfNotEditable");
  v5 = self->_sortDescriptors;
  if (v5 != sortDescriptors)
  {

    self->_sortDescriptors = (NSArray *)-[NSArray copy](sortDescriptors, "copy");
  }
}

- (void)setResultType:(NSFetchRequestResultType)resultType
{
  -[NSFetchRequest _throwIfNotEditable](self, "_throwIfNotEditable");
  self->_flags = (_fetchRequestFlags)(*(_DWORD *)&self->_flags & 0xFFFFFFC7 | (8 * (resultType & 7)));
  if (resultType == 4 || resultType == 1)
    -[NSFetchRequest setIncludesPropertyValues:](self, "setIncludesPropertyValues:", 0);
}

- (void)setPropertiesToFetch:(NSArray *)propertiesToFetch
{
  NSArray *v5;
  NSArray *v6;
  id v7;

  -[NSFetchRequest _throwIfNotEditable](self, "_throwIfNotEditable");
  if (self->_valuesToFetch != propertiesToFetch)
  {
    if ((-[NSEntityDescription isNSString](self->_entity, "isNSString") & 1) != 0)
    {
      *(_DWORD *)&self->_flags &= ~0x800u;
      v5 = (NSArray *)-[NSArray copy](propertiesToFetch, "copy");
    }
    else
    {
      v7 = 0;
      v6 = (NSArray *)-[NSFetchRequest _newValidatedProperties:groupBy:error:](self, propertiesToFetch, 0, &v7);
      if (!v6)
        objc_exception_throw((id)objc_msgSend((id)objc_msgSend(v7, "userInfo"), "valueForKey:", CFSTR("NSUnderlyingException")));
      v5 = v6;
      *(_DWORD *)&self->_flags |= 0x800u;
    }

    self->_valuesToFetch = v5;
  }
}

- (void)setIncludesPendingChanges:(BOOL)includesPendingChanges
{
  _BOOL4 v3;
  int v5;

  v3 = includesPendingChanges;
  -[NSFetchRequest _throwIfNotEditable](self, "_throwIfNotEditable");
  if (v3)
    v5 = 0;
  else
    v5 = 128;
  self->_flags = (_fetchRequestFlags)(*(_DWORD *)&self->_flags & 0xFFFFFF7F | v5);
}

- (void)setRelationshipKeyPathsForPrefetching:(NSArray *)relationshipKeyPathsForPrefetching
{
  NSArray *v5;

  -[NSFetchRequest _throwIfNotEditable](self, "_throwIfNotEditable");
  if (self->_relationshipKeyPathsForPrefetching != relationshipKeyPathsForPrefetching)
  {
    v5 = (NSArray *)-[NSArray copy](relationshipKeyPathsForPrefetching, "copy");

    self->_relationshipKeyPathsForPrefetching = v5;
  }
}

- (void)setFetchBatchSize:(NSUInteger)fetchBatchSize
{
  -[NSFetchRequest _throwIfNotEditable](self, "_throwIfNotEditable");
  self->_batchSize = fetchBatchSize;
}

- (void)setEntity:(NSEntityDescription *)entity
{
  if ((*((_BYTE *)&self->_flags + 1) & 2) != 0)
  {
    if ((-[NSString isEqual:](-[NSEntityDescription name](entity, "name"), "isEqual:", self->_entity) & 1) == 0)
      -[NSFetchRequest _throwIfNotEditable](self, "_throwIfNotEditable");

    *(_DWORD *)&self->_flags &= ~0x200u;
  }
  else
  {
    -[NSFetchRequest _throwIfNotEditable](self, "_throwIfNotEditable");
  }
  self->_entity = entity;
}

- (void)setPredicate:(NSPredicate *)predicate
{
  NSPredicate *v5;

  -[NSFetchRequest _throwIfNotEditable](self, "_throwIfNotEditable");
  v5 = self->_predicate;
  if (v5 != predicate)
  {

    self->_predicate = predicate;
  }
}

- (void)_throwIfNotEditable
{
  if (!-[NSFetchRequest _isEditable](self, "_isEditable"))
    objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99768], CFSTR("Can't modify a named fetch request in an immutable model."), 0));
}

- (BOOL)_isEditable
{
  return (*((_BYTE *)&self->_flags + 1) & 1) == 0;
}

- (void)setAffectedStores:(NSArray *)affectedStores
{
  objc_super v5;

  -[NSFetchRequest _throwIfNotEditable](self, "_throwIfNotEditable");
  v5.receiver = self;
  v5.super_class = (Class)NSFetchRequest;
  -[NSPersistentStoreRequest setAffectedStores:](&v5, sel_setAffectedStores_, affectedStores);
}

- (void)setFetchOffset:(NSUInteger)fetchOffset
{
  -[NSFetchRequest _throwIfNotEditable](self, "_throwIfNotEditable");
  *self->_additionalPrivateIvars = (id)fetchOffset;
}

- (void)setShouldRefreshRefetchedObjects:(BOOL)shouldRefreshRefetchedObjects
{
  _BOOL4 v3;
  int v5;

  v3 = shouldRefreshRefetchedObjects;
  -[NSFetchRequest _throwIfNotEditable](self, "_throwIfNotEditable");
  if (v3)
    v5 = 1024;
  else
    v5 = 0;
  self->_flags = (_fetchRequestFlags)(*(_DWORD *)&self->_flags & 0xFFFFFBFF | v5);
}

- (void)setPropertiesToGroupBy:(NSArray *)propertiesToGroupBy
{
  NSArray *v5;
  NSArray *v6;
  id v7;

  -[NSFetchRequest _throwIfNotEditable](self, "_throwIfNotEditable");
  if (self->_groupByProperties != propertiesToGroupBy)
  {
    if ((-[NSEntityDescription isNSString](self->_entity, "isNSString") & 1) != 0)
    {
      *(_DWORD *)&self->_flags &= ~0x800u;
      v5 = (NSArray *)-[NSArray copy](propertiesToGroupBy, "copy");
    }
    else
    {
      v7 = 0;
      v6 = (NSArray *)-[NSFetchRequest _newValidatedProperties:groupBy:error:](self, propertiesToGroupBy, 1, &v7);
      if (!v6)
        objc_exception_throw((id)objc_msgSend((id)objc_msgSend(v7, "userInfo"), "valueForKey:", CFSTR("NSUnderlyingException")));
      v5 = v6;
      *(_DWORD *)&self->_flags |= 0x800u;
    }

    self->_groupByProperties = v5;
  }
}

- (void)setReturnsDistinctResults:(BOOL)returnsDistinctResults
{
  _BOOL4 v3;

  v3 = returnsDistinctResults;
  -[NSFetchRequest _throwIfNotEditable](self, "_throwIfNotEditable");
  self->_flags = (_fetchRequestFlags)(*(_DWORD *)&self->_flags & 0xFFFFFFFE | v3);
}

- (unint64_t)_fetchBatchLRUEntriesLimit
{
  _fetchRequestFlags flags;
  BOOL v3;
  unsigned int v4;

  flags = self->_flags;
  v3 = ((*(unsigned int *)&flags >> 17) & 0xF) == 0;
  v4 = 1 << (((*(unsigned int *)&flags >> 17) & 0xF) - 1);
  if (v3)
    return 0;
  else
    return v4;
}

- (BOOL)shouldRefreshRefetchedObjects
{
  return (*((unsigned __int8 *)&self->_flags + 1) >> 2) & 1;
}

- (void)setHavingPredicate:(NSPredicate *)havingPredicate
{
  NSPredicate *v5;

  -[NSFetchRequest _throwIfNotEditable](self, "_throwIfNotEditable");
  if (self->_havingPredicate != havingPredicate)
  {
    v5 = havingPredicate;

    self->_havingPredicate = havingPredicate;
  }
}

- (id)_asyncResultHandle
{
  return (id)*((_QWORD *)self->_additionalPrivateIvars + 1);
}

- (void)_setAsyncResultHandle:(id)a3
{
  id v5;
  BOOL v6;

  v5 = (id)*((_QWORD *)self->_additionalPrivateIvars + 1);
  if (v5)
    v6 = v5 == a3;
  else
    v6 = 1;
  if (!v6)

  if (a3)
    *(_DWORD *)&self->_flags |= 0x200000u;
  *((_QWORD *)self->_additionalPrivateIvars + 1) = a3;
}

- (NSPredicate)havingPredicate
{
  return self->_havingPredicate;
}

- (NSUInteger)fetchOffset
{
  return (NSUInteger)*self->_additionalPrivateIvars;
}

- (NSArray)propertiesToGroupBy
{
  return self->_groupByProperties;
}

- (NSArray)sortDescriptors
{
  return self->_sortDescriptors;
}

- (BOOL)includesPendingChanges
{
  return (*(_DWORD *)&self->_flags & 0x80) == 0 && (*(_DWORD *)&self->_flags & 0x38) != 16;
}

- (void)_resolveEntityWithContext:(id)a3
{
  _fetchRequestFlags flags;
  NSEntityDescription *entity;
  NSEntityDescription *v6;
  NSEntityDescription *v7;
  NSArray *valuesToFetch;
  NSArray *v9;
  NSArray *v10;
  NSArray *groupByProperties;
  NSArray *v12;
  NSArray *v13;
  NSArray *v14;
  NSArray *v15;
  id v16;

  flags = self->_flags;
  if ((*(_WORD *)&flags & 0x200) != 0)
  {
    entity = self->_entity;
    v6 = +[NSEntityDescription entityForName:inManagedObjectContext:](NSEntityDescription, "entityForName:inManagedObjectContext:", entity, a3);
    if (!v6)
      objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99768], objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("NSFetchRequest could not locate an NSEntityDescription for entity name '%@'"), entity), 0));
    v7 = v6;

    self->_entity = v7;
    flags = (_fetchRequestFlags)(*(_DWORD *)&self->_flags & 0xFFFFFDFF);
    self->_flags = flags;
  }
  if ((*(_WORD *)&flags & 0x800) == 0)
  {
    v16 = 0;
    valuesToFetch = self->_valuesToFetch;
    if (valuesToFetch)
    {
      v9 = (NSArray *)-[NSFetchRequest _newValidatedProperties:groupBy:error:](self, valuesToFetch, 0, &v16);
      if (!v9)
        goto LABEL_19;
      v10 = v9;

      self->_valuesToFetch = v10;
    }
    groupByProperties = self->_groupByProperties;
    if (!groupByProperties)
    {
LABEL_11:
      flags = (_fetchRequestFlags)(*(_DWORD *)&self->_flags | 0x800);
      self->_flags = flags;
      goto LABEL_12;
    }
    v12 = (NSArray *)-[NSFetchRequest _newValidatedProperties:groupBy:error:](self, groupByProperties, 1, &v16);
    if (v12)
    {
      v13 = v12;

      self->_groupByProperties = v13;
      goto LABEL_11;
    }
LABEL_19:
    objc_exception_throw((id)objc_msgSend((id)objc_msgSend(v16, "userInfo"), "valueForKey:", CFSTR("NSUnderlyingException")));
  }
LABEL_12:
  if ((*(_WORD *)&flags & 0x1000) == 0)
  {
    v14 = self->_valuesToFetch;
    if (v14)
      -[NSFetchRequest _bindExpressionDescriptionProperties:]((uint64_t)self, v14);
    v15 = self->_groupByProperties;
    if (v15)
      -[NSFetchRequest _bindExpressionDescriptionProperties:]((uint64_t)self, v15);
    *(_DWORD *)&self->_flags |= 0x1000u;
  }
}

- (void)allowEvaluation
{
  NSArray *sortDescriptors;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  if ((*((_BYTE *)&self->_flags + 2) & 0x80) == 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[NSPredicate allowEvaluation](self->_predicate, "allowEvaluation");
    v11 = 0u;
    v12 = 0u;
    v9 = 0u;
    v10 = 0u;
    sortDescriptors = self->_sortDescriptors;
    v4 = -[NSArray countByEnumeratingWithState:objects:count:](sortDescriptors, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    if (v4)
    {
      v5 = v4;
      v6 = *(_QWORD *)v10;
      do
      {
        for (i = 0; i != v5; ++i)
        {
          if (*(_QWORD *)v10 != v6)
            objc_enumerationMutation(sortDescriptors);
          v8 = *(void **)(*((_QWORD *)&v9 + 1) + 8 * i);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
            objc_msgSend(v8, "allowEvaluation");
        }
        v5 = -[NSArray countByEnumeratingWithState:objects:count:](sortDescriptors, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
      }
      while (v5);
    }
    *(_DWORD *)&self->_flags |= 0x800000u;
  }
}

- (id)_newValidatedProperties:(int)a3 groupBy:(_QWORD *)a4 error:
{
  int v7;
  uint64_t v8;
  NSExpressionDescription *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  NSExpressionDescription *v13;
  NSExpressionDescription *v14;
  uint64_t v15;
  NSExpression *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  NSExpressionDescription *v20;
  char v21;
  unint64_t v22;
  void *v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  void *v31;
  uint64_t v32;
  void *v33;
  uint64_t v34;
  unint64_t v35;
  void *v36;
  void *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t i;
  void *v42;
  uint64_t v43;
  void *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  NSExpressionDescription *v49;
  uint64_t v50;
  NSExpressionDescription *v51;
  uint64_t v52;
  void *v53;
  uint64_t v54;
  void *v55;
  const __CFString *v56;
  BOOL v57;
  uint64_t v58;
  const __CFString *v59;
  const __CFString *v60;
  const __CFString *v61;
  const __CFString *v62;
  const __CFString *v63;
  const __CFString *v64;
  uint64_t v65;
  uint64_t v67;
  void *v69;
  void *v70;
  void *v71;
  int v72;
  uint64_t v73;
  uint64_t v74;
  int v75;
  id v76;
  uint64_t v77;
  NSExpressionDescription *v78;
  NSExpressionDescription *v79;
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
  _BYTE v92[128];
  _BYTE v93[128];
  _BYTE v94[128];
  uint64_t v95;

  v95 = *MEMORY[0x1E0C80C00];
  if (!a1)
    return 0;
  objc_msgSend(a1, "_throwIfNotEditable");
  v76 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v70 = a1;
  if ((a1[26] & 0x38) != 0)
    v7 = 1;
  else
    v7 = a3;
  v72 = v7;
  v88 = 0u;
  v89 = 0u;
  v90 = 0u;
  v91 = 0u;
  v73 = objc_msgSend(a2, "countByEnumeratingWithState:objects:count:", &v88, v94, 16);
  if (v73)
  {
    v74 = *(_QWORD *)v89;
    v75 = a3;
    v71 = a2;
LABEL_7:
    v8 = 0;
    while (1)
    {
      if (*(_QWORD *)v89 != v74)
        objc_enumerationMutation(a2);
      v9 = *(NSExpressionDescription **)(*((_QWORD *)&v88 + 1) + 8 * v8);
      v77 = v8;
      if (-[NSExpressionDescription isNSString](v9, "isNSString"))
      {
        v10 = (void *)-[NSExpressionDescription componentsSeparatedByString:](v9, "componentsSeparatedByString:", CFSTR("."));
        v11 = (void *)objc_msgSend(v70, "entity");
        v12 = objc_msgSend(v10, "count");
        if (v12 == 1)
        {
          v13 = (NSExpressionDescription *)objc_msgSend((id)objc_msgSend(v11, "propertiesByName"), "objectForKey:", v9);
          if (v13)
          {
            v14 = v13;
            if (v72 && -[NSPropertyDescription isTransient](v13, "isTransient"))
            {
LABEL_118:

              v53 = (void *)MEMORY[0x1E0C99DA0];
              v54 = *MEMORY[0x1E0C99778];
              v61 = CFSTR("setPropertiesToFetch:");
              if (a3)
                v61 = CFSTR("setPropertiesToGroupBy:");
              v58 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid keypath %@ passed to %@"), v9, v61);
              goto LABEL_132;
            }
            if (a3
              && -[NSExpressionDescription _propertyType](v14, "_propertyType") == 4
              && (unint64_t)-[NSExpressionDescription maxCount](v14, "maxCount") >= 2)
            {
LABEL_121:

              v53 = (void *)MEMORY[0x1E0C99DA0];
              v54 = *MEMORY[0x1E0C99778];
              v58 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid keypath %@ passed to setPropertiesToGroupBy:"), v9, v67);
LABEL_132:
              v65 = objc_msgSend(v53, "exceptionWithName:reason:userInfo:", v54, v58, 0);
              if (!a4)
                return 0;
              v76 = 0;
              *a4 = objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB28A8], 134060, objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObject:forKey:", v65, CFSTR("NSUnderlyingException")));
              return v76;
            }
          }
          else
          {
            if (!-[NSExpressionDescription isEqualToString:](v9, "isEqualToString:", CFSTR("objectID")))
              goto LABEL_118;
            v49 = objc_alloc_init(NSExpressionDescription);
            -[NSPropertyDescription setName:](v49, "setName:", CFSTR("objectID"));
            -[NSExpressionDescription setExpression:](v49, "setExpression:", objc_msgSend(MEMORY[0x1E0CB35D0], "expressionForEvaluatedObject"));
            -[NSExpressionDescription setExpressionResultType:](v49, "setExpressionResultType:", 2000);
            v14 = v49;
          }
          goto LABEL_86;
        }
        v18 = v12;
        v19 = objc_msgSend(v10, "objectAtIndex:", 0);
        if (v11)
          v20 = (NSExpressionDescription *)objc_msgSend((id)objc_msgSend(v11, "propertiesByName"), "objectForKey:", v19);
        else
          v20 = 0;
        if (-[NSExpressionDescription _propertyType](v20, "_propertyType") == 7)
        {
          if ((unint64_t)objc_msgSend(v10, "count") >= 2)
          {
            v21 = 0;
            v22 = 1;
LABEL_28:
            v78 = v9;
            do
            {
              v23 = (void *)objc_msgSend(v10, "objectAtIndex:", v22);
              v84 = 0u;
              v85 = 0u;
              v86 = 0u;
              v87 = 0u;
              v24 = (void *)-[NSExpressionDescription elements](v20, "elements");
              v25 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v84, v93, 16);
              if (v25)
              {
                v26 = v25;
                v27 = *(_QWORD *)v85;
LABEL_31:
                v28 = 0;
                while (1)
                {
                  if (*(_QWORD *)v85 != v27)
                    objc_enumerationMutation(v24);
                  v14 = *(NSExpressionDescription **)(*((_QWORD *)&v84 + 1) + 8 * v28);
                  if ((objc_msgSend(v23, "isEqualToString:", -[NSPropertyDescription name](v14, "name")) & 1) != 0)
                    break;
                  if (v26 == ++v28)
                  {
                    v26 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v84, v93, 16);
                    if (v26)
                      goto LABEL_31;
                    goto LABEL_37;
                  }
                }
                ++v22;
                v21 = 1;
                v20 = v14;
                v9 = v14;
                if (objc_msgSend(v10, "count") > v22)
                  goto LABEL_28;
                goto LABEL_86;
              }
LABEL_37:
              ++v22;
            }
            while (objc_msgSend(v10, "count") > v22);
            v9 = v78;
            v14 = v78;
            if ((v21 & 1) != 0)
              goto LABEL_86;
          }

          v53 = (void *)MEMORY[0x1E0C99DA0];
          v54 = *MEMORY[0x1E0C99778];
          v55 = (void *)MEMORY[0x1E0CB3940];
          v56 = CFSTR("setPropertiesToFetch:");
          v57 = v75 == 0;
LABEL_103:
          if (!v57)
            v56 = CFSTR("setPropertiesToGroupBy:");
          v58 = objc_msgSend(v55, "stringWithFormat:", CFSTR("Invalid keypath %@ passed to %@:"), v9, v56);
          goto LABEL_132;
        }
        if (v18)
        {
          v43 = objc_msgSend((id)objc_msgSend(v11, "propertiesByName"), "objectForKey:", objc_msgSend(v10, "objectAtIndex:", 0));
          if (v43)
          {
            v44 = (void *)v43;
            v45 = 1;
            while (1)
            {
              if (v72 && objc_msgSend(v44, "isTransient"))
                goto LABEL_102;
              if (a3 && objc_msgSend(v44, "_propertyType") == 4 && (unint64_t)objc_msgSend(v44, "maxCount") >= 2)
                goto LABEL_121;
              v46 = objc_msgSend(v44, "_propertyType");
              if ((v46 & 0xFFFFFFFFFFFFFFFBLL) == 2)
                break;
              if (v46 != 4)
              {

                v53 = (void *)MEMORY[0x1E0C99DA0];
                v54 = *MEMORY[0x1E0C99778];
                v59 = CFSTR("setPropertiesToFetch:");
                if (a3)
                  v59 = CFSTR("setPropertiesToGroupBy:");
                v58 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid keypath %@ passed to %@ (invalid property type)"), v9, v59);
                goto LABEL_132;
              }
              if ((a3 & 1) == 0 && objc_msgSend(v44, "isToMany"))
              {

                v53 = (void *)MEMORY[0x1E0C99DA0];
                v54 = *MEMORY[0x1E0C99778];
                v58 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid to many relationship in setPropertiesToFetch: (%@)"), v9, v67);
                goto LABEL_132;
              }
              if (v18 == v45)
              {
                v14 = objc_alloc_init(NSExpressionDescription);
                -[NSPropertyDescription setName:](v14, "setName:", v9);
                -[NSExpressionDescription setExpression:](v14, "setExpression:", objc_msgSend(MEMORY[0x1E0CB35D0], "expressionForKeyPath:", v9));
                v51 = v14;
                v50 = 2000;
                goto LABEL_97;
              }
              v44 = (void *)objc_msgSend((id)objc_msgSend((id)objc_msgSend(v44, "destinationEntity"), "propertiesByName"), "objectForKey:", objc_msgSend(v10, "objectAtIndex:", v45++));
              if (!v44)
                goto LABEL_102;
            }
            if (v18 == v45)
            {
              v14 = objc_alloc_init(NSExpressionDescription);
              -[NSPropertyDescription setName:](v14, "setName:", v9);
              -[NSExpressionDescription setExpression:](v14, "setExpression:", objc_msgSend(MEMORY[0x1E0CB35D0], "expressionForKeyPath:", v9));
              v50 = objc_msgSend(v44, "attributeType");
              v51 = v14;
LABEL_97:
              -[NSExpressionDescription setExpressionResultType:](v51, "setExpressionResultType:", v50);
              goto LABEL_86;
            }

            v53 = (void *)MEMORY[0x1E0C99DA0];
            v54 = *MEMORY[0x1E0C99778];
            v64 = CFSTR("setPropertiesToFetch:");
            if (a3)
              v64 = CFSTR("setPropertiesToGroupBy:");
            v58 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid keypath %@ passed to %@ (non-terminal attribute)"), v9, v64);
            goto LABEL_132;
          }
LABEL_102:

          v53 = (void *)MEMORY[0x1E0C99DA0];
          v54 = *MEMORY[0x1E0C99778];
          v55 = (void *)MEMORY[0x1E0CB3940];
          v56 = CFSTR("setPropertiesToFetch:");
          v57 = a3 == 0;
          goto LABEL_103;
        }
      }
      else
      {
        v15 = -[NSExpressionDescription _propertyType](v9, "_propertyType");
        if (v15 == 5)
        {
          if (a3)
          {
            v16 = -[NSExpressionDescription expression](v9, "expression");
            v17 = -[NSExpression expressionType](v16, "expressionType");
            if (v17 != 3)
            {
              if (v17 == 4 && sel_valueForKey_ != (char *)-[NSExpression selector](v16, "selector"))
                -[NSExpression selector](v16, "selector");

              v53 = (void *)MEMORY[0x1E0C99DA0];
              v54 = *MEMORY[0x1E0C99778];
              v58 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid keypath expression (%@) passed to setPropertiesToFetch:"), v9, v67);
              goto LABEL_132;
            }
          }
        }
        else
        {
          v29 = v15;
          if (v72 && -[NSPropertyDescription isTransient](v9, "isTransient"))
          {

            v53 = (void *)MEMORY[0x1E0C99DA0];
            v54 = *MEMORY[0x1E0C99778];
            v62 = CFSTR("setPropertiesToFetch:");
            if (a3)
              v62 = CFSTR("setPropertiesToGroupBy:");
            v58 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid property %@ passed to %@ (property is transient)"), v9, v62);
            goto LABEL_132;
          }
          v30 = (void *)objc_msgSend(v70, "entity");
          v31 = (void *)objc_msgSend(-[NSPropertyDescription _qualifiedName](v9, "_qualifiedName"), "componentsSeparatedByString:", CFSTR("."));
          v79 = v9;
          v69 = v30;
          if ((unint64_t)objc_msgSend(v31, "count") < 2)
          {
            v47 = -[NSPropertyDescription name](v9, "name");
            if (!v30)
              goto LABEL_109;
            v33 = (void *)objc_msgSend((id)objc_msgSend(v30, "propertiesByName"), "objectForKey:", v47);
          }
          else
          {
            v32 = objc_msgSend(v31, "objectAtIndex:", 0);
            if (v30)
              v33 = (void *)objc_msgSend((id)objc_msgSend(v30, "propertiesByName"), "objectForKey:", v32);
            else
              v33 = 0;
            if ((unint64_t)objc_msgSend(v31, "count") >= 2)
            {
              v35 = 1;
              do
              {
                v36 = (void *)objc_msgSend(v31, "objectAtIndex:", v35);
                v80 = 0u;
                v81 = 0u;
                v82 = 0u;
                v83 = 0u;
                v37 = (void *)objc_msgSend(v33, "elements");
                v38 = objc_msgSend(v37, "countByEnumeratingWithState:objects:count:", &v80, v92, 16);
                if (v38)
                {
                  v39 = v38;
                  v40 = *(_QWORD *)v81;
                  while (2)
                  {
                    for (i = 0; i != v39; ++i)
                    {
                      if (*(_QWORD *)v81 != v40)
                        objc_enumerationMutation(v37);
                      v42 = *(void **)(*((_QWORD *)&v80 + 1) + 8 * i);
                      if ((objc_msgSend(v36, "isEqualToString:", objc_msgSend(v42, "name")) & 1) != 0)
                      {
                        v33 = v42;
                        goto LABEL_58;
                      }
                    }
                    v39 = objc_msgSend(v37, "countByEnumeratingWithState:objects:count:", &v80, v92, 16);
                    if (v39)
                      continue;
                    break;
                  }
                }
LABEL_58:
                ++v35;
              }
              while (objc_msgSend(v31, "count") > v35);
            }
          }
          if (!v33)
          {
LABEL_109:

            v53 = (void *)MEMORY[0x1E0C99DA0];
            v54 = *MEMORY[0x1E0C99778];
            v60 = CFSTR("setPropertiesToFetch:");
            if (v75)
              v60 = CFSTR("setPropertiesToGroupBy:");
            v58 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Attribute/relationship description names passed to %@ must match name on fetch entity (%@)"), v60, v79);
            goto LABEL_132;
          }
          v9 = v79;
          if ((v75 & 1) != 0 || BYTE2(z9dsptsiQ80etb9782fsrs98bfdle88))
          {
            v48 = -[NSPropertyDescription entity](v79, "entity");
            if (v69)
            {
              v34 = v48;
              if (v69 != (void *)v48 && (objc_msgSend(v69, "_subentitiesIncludes:", v48) & 1) == 0)
              {

                v53 = (void *)MEMORY[0x1E0C99DA0];
                v54 = *MEMORY[0x1E0C99778];
                v58 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid property (%@) passed to setPropertiesToFetch: (entity mismatch)"), v79, v67);
                goto LABEL_132;
              }
            }
          }
          if (v29 == 4 && -[NSExpressionDescription isToMany](v79, "isToMany", v34))
          {

            v53 = (void *)MEMORY[0x1E0C99DA0];
            v54 = *MEMORY[0x1E0C99778];
            v63 = CFSTR("setPropertiesToFetch:");
            if (v75)
              v63 = CFSTR("setPropertiesToGroupBy:");
            v58 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid to many relationship (%@) passed to %@:"), v79, v63);
            goto LABEL_132;
          }
        }
      }
      v14 = v9;
LABEL_86:
      if (objc_msgSend(v76, "indexOfObjectIdenticalTo:", v14) == 0x7FFFFFFFFFFFFFFFLL)
        objc_msgSend(v76, "addObject:", v14);
      v8 = v77 + 1;
      a3 = v75;
      a2 = v71;
      if (v77 + 1 == v73)
      {
        v52 = objc_msgSend(v71, "countByEnumeratingWithState:objects:count:", &v88, v94, 16);
        v73 = v52;
        if (v52)
          goto LABEL_7;
        return v76;
      }
    }
  }
  return v76;
}

- (uint64_t)_bindExpressionDescriptionProperties:(uint64_t)result
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _QWORD *v7;
  void *v8;
  id v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  if (result)
  {
    v3 = (void *)result;
    v12 = 0u;
    v13 = 0u;
    v10 = 0u;
    v11 = 0u;
    result = objc_msgSend(a2, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    if (result)
    {
      v4 = result;
      v5 = *(_QWORD *)v11;
      do
      {
        v6 = 0;
        do
        {
          if (*(_QWORD *)v11 != v5)
            objc_enumerationMutation(a2);
          v7 = *(_QWORD **)(*((_QWORD *)&v10 + 1) + 8 * v6);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v8 = (void *)objc_msgSend(v7, "expression");
            if (objc_msgSend(v8, "expressionType") == 3)
              v9 = -[NSEntityDescription _attributeNamed:](objc_msgSend(v3, "entity"), objc_msgSend(v8, "keyPath"));
            else
              v9 = 0;
            -[NSExpressionDescription setUnderlyingAttribute:](v7, v9);
          }
          ++v6;
        }
        while (v4 != v6);
        result = objc_msgSend(a2, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
        v4 = result;
      }
      while (result);
    }
  }
  return result;
}

- (NSFetchRequest)init
{
  NSFetchRequest *v2;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)NSFetchRequest;
  v2 = -[NSFetchRequest init](&v4, sel_init);
  if (v2)
  {
    v2->_additionalPrivateIvars = (id *)PF_CALLOC_OBJECT_ARRAY(3);
    v2->_flags = (_fetchRequestFlags)(*(_DWORD *)&v2->_flags & 0xFFBE1B00 | 0x46);
  }
  return v2;
}

- (void)setIncludesSubentities:(BOOL)includesSubentities
{
  _BOOL4 v3;
  int v5;

  v3 = includesSubentities;
  -[NSFetchRequest _throwIfNotEditable](self, "_throwIfNotEditable");
  if (v3)
    v5 = 2;
  else
    v5 = 0;
  self->_flags = (_fetchRequestFlags)(*(_DWORD *)&self->_flags & 0xFFFFFFFD | v5);
}

- (NSFetchRequest)initWithEntityName:(NSString *)entityName
{
  NSFetchRequest *v4;
  NSFetchRequest *v5;

  v4 = -[NSFetchRequest init](self, "init");
  v5 = v4;
  if (v4)
  {
    *(_DWORD *)&v4->_flags |= 0x200u;
    v4->_entity = (NSEntityDescription *)-[NSString copy](entityName, "copy");
  }
  return v5;
}

- (id)_newNormalizedFetchProperties:(uint64_t)a1
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  unint64_t v11;
  void *v12;
  uint64_t v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  if (!a1)
    return 0;
  if (a2)
  {
    v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(a2, "count"));
    v15 = 0u;
    v16 = 0u;
    v17 = 0u;
    v18 = 0u;
    v4 = objc_msgSend(a2, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    if (!v4)
      return v3;
    v5 = v4;
    v6 = *(_QWORD *)v16;
    while (1)
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v16 != v6)
          objc_enumerationMutation(a2);
        v8 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * v7);
        if (objc_msgSend(v8, "isNSString"))
        {
          v9 = v3;
          v10 = (uint64_t)v8;
LABEL_13:
          objc_msgSend(v9, "addObject:", v10);
          goto LABEL_14;
        }
        v11 = objc_msgSend(v8, "_propertyType");
        if (v11 > 7)
          goto LABEL_14;
        if (((1 << v11) & 0xD4) != 0)
        {
          v10 = objc_msgSend(v8, "name");
          v9 = v3;
          goto LABEL_13;
        }
        if (v11 == 5)
        {
          v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", 3);
          objc_msgSend(v12, "addObject:", objc_msgSend(v8, "name"));
          objc_msgSend(v12, "addObject:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v8, "expressionResultType")));
          objc_msgSend(v12, "addObject:", objc_msgSend(v8, "expression"));
          objc_msgSend(v3, "addObject:", v12);

        }
LABEL_14:
        ++v7;
      }
      while (v5 != v7);
      v13 = objc_msgSend(a2, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      v5 = v13;
      if (!v13)
        return v3;
    }
  }
  return (id)objc_msgSend(MEMORY[0x1E0C99E38], "null");
}

- (BOOL)returnsDistinctResults
{
  return *(_DWORD *)&self->_flags & 1;
}

- (void)setIncludesPropertyValues:(BOOL)includesPropertyValues
{
  _BOOL4 v3;
  int v5;

  v3 = includesPropertyValues;
  -[NSFetchRequest _throwIfNotEditable](self, "_throwIfNotEditable");
  if (v3)
    v5 = 4;
  else
    v5 = 0;
  self->_flags = (_fetchRequestFlags)(*(_DWORD *)&self->_flags & 0xFFFFFFFB | v5);
}

- (BOOL)_isCachingFetchRequest
{
  return 0;
}

- (unint64_t)allocationType
{
  return ((unint64_t)self->_flags >> 14) & 7;
}

- (NSArray)affectedStores
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)NSFetchRequest;
  return -[NSPersistentStoreRequest affectedStores](&v3, sel_affectedStores);
}

- (void)_incrementInUseCounter
{
  *(_DWORD *)&self->_flags |= 0x100u;
}

- (NSArray)execute:(NSError *)error
{
  void *v4;
  char isKindOfClass;
  NSArray *v7;
  char v8;

  v4 = *(void **)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 712);
  if (!v4)
  {
    v7 = 0;
    v8 = 1;
    if (!error)
      return v7;
    goto LABEL_8;
  }
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();
  if ((isKindOfClass & 1) != 0)
    v7 = (NSArray *)objc_msgSend(v4, "executeFetchRequest:error:", self, error);
  else
    v7 = 0;
  v8 = isKindOfClass ^ 1;
  if (error)
  {
LABEL_8:
    if ((v8 & 1) != 0)
      *error = (NSError *)objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB28A8], 134060, &unk_1E1F4A818);
  }
  return v7;
}

- (void)setAllocationType:(unint64_t)a3
{
  int v5;

  -[NSFetchRequest _throwIfNotEditable](self, "_throwIfNotEditable");
  if (((a3 - 1 < 2) & _PF_XPCStore_DisableExplicitBufferedAllocations_91407470) != 0)
    v5 = 49152;
  else
    v5 = (a3 & 7) << 14;
  self->_flags = (_fetchRequestFlags)(*(_DWORD *)&self->_flags & 0xFFFE3FFF | v5);
}

+ (id)_newDenormalizedFetchProperties:(id)a3
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  NSExpressionDescription *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  if ((id)objc_msgSend(MEMORY[0x1E0C99E38], "null") == a3)
    return 0;
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(a3, "count"));
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v5 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v13;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v13 != v7)
          objc_enumerationMutation(a3);
        v9 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * i);
        if (objc_msgSend(v9, "isNSString"))
        {
          objc_msgSend(v4, "addObject:", v9);
        }
        else
        {
          v10 = objc_alloc_init(NSExpressionDescription);
          -[NSPropertyDescription setName:](v10, "setName:", objc_msgSend(v9, "objectAtIndex:", 0));
          -[NSExpressionDescription setExpressionResultType:](v10, "setExpressionResultType:", objc_msgSend((id)objc_msgSend(v9, "objectAtIndex:", 1), "unsignedIntegerValue"));
          -[NSExpressionDescription setExpression:](v10, "setExpression:", objc_msgSend(v9, "objectAtIndex:", 2));
          objc_msgSend(v4, "addObject:", v10);

        }
      }
      v6 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v6);
  }
  return v4;
}

- (NSString)entityName
{
  _fetchRequestFlags *p_flags;
  NSString *result;

  p_flags = &self->_flags;
  result = (NSString *)self->_entity;
  if ((*((_BYTE *)p_flags + 1) & 2) == 0)
    return (NSString *)-[NSString name](result, "name");
  return result;
}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v4;
  NSEntityDescription *entity;
  unsigned int v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)NSFetchRequest;
  v4 = -[NSPersistentStoreRequest copyWithZone:](&v8, sel_copyWithZone_, a3);
  if (v4)
  {
    entity = self->_entity;
    if ((*((_BYTE *)&self->_flags + 1) & 2) != 0)
      entity = entity;
    v4[6] = entity;
    v4[7] = self->_predicate;
    v4[8] = -[NSArray copy](self->_sortDescriptors, "copy");
    v4[10] = self->_fetchLimit;
    v4[11] = self->_allocationSize;
    v4[9] = self->_batchSize;
    *((_DWORD *)v4 + 26) = v4[13] & 0xFFE1FFFF | (((*(_DWORD *)&self->_flags >> 17) & 0xF) << 17);
    *(_QWORD *)v4[4] = *self->_additionalPrivateIvars;
    *((_DWORD *)v4 + 26) = *(_DWORD *)&self->_flags & 0xFFFFF6FF;
    v4[12] = -[NSArray copy](self->_relationshipKeyPathsForPrefetching, "copy");
    v4[5] = -[NSArray copy](self->_valuesToFetch, "copy");
    v4[3] = -[NSPredicate copy](self->_havingPredicate, "copy");
    v4[2] = -[NSArray copy](self->_groupByProperties, "copy");
    v6 = v4[13] & 0xFFFE3FFF | (((*(_DWORD *)&self->_flags >> 14) & 7) << 14);
    *((_DWORD *)v4 + 26) = v6;
    *((_DWORD *)v4 + 26) = v6 & 0xFFBFFFFF | (((*(_DWORD *)&self->_flags >> 22) & 1) << 22);
  }
  return v4;
}

+ (id)decodeFromXPCArchive:(id)a3 withContext:(id)a4 andPolicy:(id)a5
{
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  NSFetchRequest *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  void *v20;

  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3710]), "initForReadingFromData:error:", a3, 0);
  objc_msgSend(v8, "setDelegate:", a4);
  v9 = objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v10 = (void *)+[_NSXPCStoreUtilities classesForFetchArchive]();
  if (a5)
    v10 = (void *)objc_msgSend(v10, "setByAddingObjectsFromSet:", objc_msgSend(a5, "allowableClassesForClientWithContext:", a4));
  v11 = (void *)objc_msgSend(v8, "decodeObjectOfClasses:forKey:", v10, CFSTR("root"));

  v12 = +[NSFetchRequest fetchRequestWithEntityName:](NSFetchRequest, "fetchRequestWithEntityName:", objc_msgSend(v11, "objectAtIndex:", 0));
  -[NSFetchRequest _setFlagsFromXPCEncoding:](v12, "_setFlagsFromXPCEncoding:", objc_msgSend(v11, "objectAtIndex:", 1));
  v13 = objc_msgSend(v11, "objectAtIndex:", 2);
  if (v9 != v13)
    -[NSFetchRequest setSortDescriptors:](v12, "setSortDescriptors:", v13);
  v14 = objc_msgSend(v11, "objectAtIndex:", 3);
  if (v9 != v14)
    -[NSFetchRequest setPredicate:](v12, "setPredicate:", v14);
  v15 = objc_msgSend(v11, "objectAtIndex:", 4);
  if (v9 != v15)
    -[NSFetchRequest setHavingPredicate:](v12, "setHavingPredicate:", v15);
  v16 = objc_msgSend(v11, "objectAtIndex:", 5);
  if (v9 != v16)
    -[NSFetchRequest setRelationshipKeyPathsForPrefetching:](v12, "setRelationshipKeyPathsForPrefetching:", v16);
  -[NSFetchRequest setFetchOffset:](v12, "setFetchOffset:", objc_msgSend((id)objc_msgSend(v11, "objectAtIndex:", 6), "unsignedIntegerValue"));
  -[NSFetchRequest setFetchLimit:](v12, "setFetchLimit:", objc_msgSend((id)objc_msgSend(v11, "objectAtIndex:", 7), "unsignedLongValue"));
  -[NSFetchRequest setFetchBatchSize:](v12, "setFetchBatchSize:", objc_msgSend((id)objc_msgSend(v11, "objectAtIndex:", 8), "unsignedIntegerValue"));
  v17 = objc_msgSend(v11, "objectAtIndex:", 9);
  if (v9 != v17)
  {
    v18 = (void *)objc_msgSend(a1, "_newDenormalizedFetchProperties:", v17);
    -[NSFetchRequest setPropertiesToFetch:](v12, "setPropertiesToFetch:", v18);

  }
  v19 = objc_msgSend(v11, "objectAtIndex:", 10);
  if (v9 != v19)
  {
    v20 = (void *)objc_msgSend(a1, "_newDenormalizedFetchProperties:", v19);
    -[NSFetchRequest setPropertiesToGroupBy:](v12, "setPropertiesToGroupBy:", v20);

  }
  return v12;
}

+ (NSFetchRequest)fetchRequestWithEntityName:(NSString *)entityName
{
  return (NSFetchRequest *)(id)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithEntityName:", entityName);
}

- (void)_setFlagsFromXPCEncoding:(id)a3
{
  self->_flags = (_fetchRequestFlags)objc_msgSend(a3, "integerValue");
}

- (id)encodeForXPC
{
  id v3;
  char isKindOfClass;
  id v5;
  NSArray *v6;
  NSPredicate *v7;
  id v8;
  NSPredicate *v9;
  NSArray *v10;
  id v11;
  id v12;
  id v13;
  id v14;

  v3 = objc_alloc_init(MEMORY[0x1E0CB34A8]);
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();
  v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  objc_msgSend(v5, "addObject:", -[NSFetchRequest entityName](self, "entityName"));
  objc_msgSend(v5, "addObject:", -[NSFetchRequest _XPCEncodedFlags](self, "_XPCEncodedFlags"));
  v6 = -[NSFetchRequest sortDescriptors](self, "sortDescriptors");
  if (v6)
    objc_msgSend(v5, "addObject:", v6);
  else
    objc_msgSend(v5, "addObject:", objc_msgSend(MEMORY[0x1E0C99E38], "null"));
  v7 = -[NSFetchRequest predicate](self, "predicate");
  if (v7)
  {
    if ((isKindOfClass & 1) != 0)
      v7 = -[NSPredicate predicateWithSubstitutionVariables:](v7, "predicateWithSubstitutionVariables:", -[NSFetchRequest substitutionVariables](self, "substitutionVariables"));
    v8 = -[_NSXPCStorePredicateRemapper createPredicateForFetchFromPredicate:](+[_NSXPCStorePredicateRemapper defaultInstance](_NSXPCStorePredicateRemapper, "defaultInstance"), "createPredicateForFetchFromPredicate:", v7);
    objc_msgSend(v5, "addObject:", v8);

  }
  else
  {
    objc_msgSend(v5, "addObject:", objc_msgSend(MEMORY[0x1E0C99E38], "null"));
  }
  v9 = -[NSFetchRequest havingPredicate](self, "havingPredicate");
  if (v9)
  {
    if ((isKindOfClass & 1) != 0)
      v9 = -[NSPredicate predicateWithSubstitutionVariables:](v9, "predicateWithSubstitutionVariables:", -[NSFetchRequest substitutionVariables](self, "substitutionVariables"));
    objc_msgSend(v5, "addObject:", v9);
  }
  else
  {
    objc_msgSend(v5, "addObject:", objc_msgSend(MEMORY[0x1E0C99E38], "null"));
  }
  v10 = -[NSFetchRequest relationshipKeyPathsForPrefetching](self, "relationshipKeyPathsForPrefetching");
  if (v10)
    objc_msgSend(v5, "addObject:", v10);
  else
    objc_msgSend(v5, "addObject:", objc_msgSend(MEMORY[0x1E0C99E38], "null"));
  objc_msgSend(v5, "addObject:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[NSFetchRequest fetchOffset](self, "fetchOffset")));
  objc_msgSend(v5, "addObject:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[NSFetchRequest fetchLimit](self, "fetchLimit")));
  objc_msgSend(v5, "addObject:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[NSFetchRequest fetchBatchSize](self, "fetchBatchSize")));
  if (-[NSFetchRequest resultType](self, "resultType") == 2 || !-[NSFetchRequest resultType](self, "resultType"))
  {
    v11 = -[NSFetchRequest _newNormalizedFetchProperties:]((uint64_t)self, -[NSFetchRequest propertiesToFetch](self, "propertiesToFetch"));
    objc_msgSend(v5, "addObject:", v11);

  }
  else
  {
    objc_msgSend(v5, "addObject:", objc_msgSend(MEMORY[0x1E0C99E38], "null"));
  }
  v12 = -[NSFetchRequest _newNormalizedFetchProperties:]((uint64_t)self, -[NSFetchRequest propertiesToGroupBy](self, "propertiesToGroupBy"));
  objc_msgSend(v5, "addObject:", v12);

  v13 = +[_NSXPCStoreUtilities newSecureArchivedDataWithRootObject:]((uint64_t)_NSXPCStoreUtilities, (uint64_t)v5);
  objc_msgSend(v3, "drain");
  v14 = 0;
  return v13;
}

- (id)_XPCEncodedFlags
{
  return (id)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", *(_DWORD *)&self->_flags & 0xFFFFFCFF | 0x200);
}

+ (void)initialize
{
  const char *v3;

  objc_opt_self();
  objc_opt_class();
  if ((id)objc_opt_class() == a1)
  {

    v3 = getprogname();
    if (v3)
    {
      if (*v3)
      {
        if (!strncmp("PhotosReliveWidget", v3, 0x12uLL))
          _PF_XPCStore_DisableExplicitBufferedAllocations_91407470 = 1;
      }
    }
  }
}

- (void)setReturnsObjectsAsFaults:(BOOL)returnsObjectsAsFaults
{
  _BOOL4 v3;
  int v5;

  v3 = returnsObjectsAsFaults;
  -[NSFetchRequest _throwIfNotEditable](self, "_throwIfNotEditable");
  if (v3)
    v5 = 64;
  else
    v5 = 0;
  self->_flags = (_fetchRequestFlags)(*(_DWORD *)&self->_flags & 0xFFFFFFBF | v5);
}

- (id)description
{
  NSString *v3;
  void *v4;
  NSUInteger v5;
  NSUInteger v6;
  NSUInteger v7;
  __CFString *v8;
  uint64_t v9;
  const __CFString *v10;
  id v11;
  _fetchRequestFlags flags;
  int v13;
  const __CFString *v14;
  unint64_t v15;
  NSArray *v16;
  NSArray *v17;
  NSPredicate *v18;
  NSArray *v19;
  objc_super v21;

  v3 = -[NSFetchRequest entityName](self, "entityName");
  v21.receiver = self;
  v21.super_class = (Class)NSFetchRequest;
  v4 = (void *)objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("%@ (entity: %@; predicate: (%@); sortDescriptors: (%@); "),
                 -[NSFetchRequest description](&v21, sel_description),
                 v3,
                 -[NSFetchRequest predicate](self, "predicate"),
                 -[NSFetchRequest sortDescriptors](self, "sortDescriptors"));
  v5 = -[NSFetchRequest fetchLimit](self, "fetchLimit");
  if (v5)
    objc_msgSend(v4, "appendFormat:", CFSTR("limit: %u; "), v5);
  v6 = -[NSFetchRequest fetchOffset](self, "fetchOffset");
  if (v6)
    objc_msgSend(v4, "appendFormat:", CFSTR("offset: %u; "), v6);
  v7 = -[NSFetchRequest fetchBatchSize](self, "fetchBatchSize");
  if (v7)
    objc_msgSend(v4, "appendFormat:", CFSTR("batch size: %u; "), v7);
  v8 = +[NSFetchRequest _stringForFetchRequestResultType:](NSFetchRequest, "_stringForFetchRequestResultType:", ((unint64_t)self->_flags >> 3) & 7);
  v9 = -[__CFString length](v8, "length");
  v10 = CFSTR("unknown request type");
  if (v9)
    v10 = v8;
  objc_msgSend(v4, "appendFormat:", CFSTR("type: %@; "), v10);
  v11 = -[NSArray valueForKey:](-[NSFetchRequest affectedStores](self, "affectedStores"), "valueForKey:", CFSTR("identifier"));
  if (v11)
    objc_msgSend(v4, "appendFormat:", CFSTR("affected stores: (%@); "), v11);
  if (!-[NSFetchRequest includesSubentities](self, "includesSubentities"))
    objc_msgSend(v4, "appendString:", CFSTR("includesSubentities: NO; "));
  if (!-[NSFetchRequest includesPropertyValues](self, "includesPropertyValues"))
    objc_msgSend(v4, "appendString:", CFSTR("includesPropertyValues: NO; "));
  if (!-[NSFetchRequest returnsObjectsAsFaults](self, "returnsObjectsAsFaults"))
    objc_msgSend(v4, "appendString:", CFSTR("returnsObjectsAsFaults: NO; "));
  if (!-[NSFetchRequest includesPendingChanges](self, "includesPendingChanges"))
    objc_msgSend(v4, "appendString:", CFSTR("includesPendingChanges: NO; "));
  if (-[NSFetchRequest returnsDistinctResults](self, "returnsDistinctResults"))
    objc_msgSend(v4, "appendString:", CFSTR("returnsDistinctResults: YES; "));
  flags = self->_flags;
  if ((*(_WORD *)&flags & 0x400) != 0)
  {
    objc_msgSend(v4, "appendString:", CFSTR("shouldRefreshRefetchedObjects: YES; "));
    flags = self->_flags;
  }
  v13 = (*(unsigned int *)&flags >> 14) & 7;
  if (v13 == 1)
  {
    v14 = CFSTR("NSFetchRequestBufferAllocationType");
  }
  else
  {
    if (v13 != 2)
      goto LABEL_28;
    v14 = CFSTR("NSFetchRequestVMBufferAllocationType");
  }
  objc_msgSend(v4, "appendFormat:", CFSTR("allocation type: %@; "), v14);
LABEL_28:
  v15 = -[NSFetchRequest allocationSize](self, "allocationSize");
  if (v15)
    objc_msgSend(v4, "appendFormat:", CFSTR("allocation size: %u; "), v15);
  v16 = -[NSFetchRequest relationshipKeyPathsForPrefetching](self, "relationshipKeyPathsForPrefetching");
  if (-[NSArray count](v16, "count"))
    objc_msgSend(v4, "appendFormat:", CFSTR("relationshipKeyPathsForPrefetching: (%@); "), v16);
  v17 = -[NSFetchRequest propertiesToFetch](self, "propertiesToFetch");
  if (-[NSArray count](v17, "count"))
    objc_msgSend(v4, "appendFormat:", CFSTR("propertiesToFetch: (%@); "), v17);
  v18 = -[NSFetchRequest havingPredicate](self, "havingPredicate");
  if (v18)
    objc_msgSend(v4, "appendFormat:", CFSTR("havingPredicate: (%@); "), v18);
  v19 = -[NSFetchRequest propertiesToGroupBy](self, "propertiesToGroupBy");
  if (-[NSArray count](v19, "count"))
    objc_msgSend(v4, "appendFormat:", CFSTR("propertiesToGroupBy: (%@); "), v19);
  objc_msgSend(v4, "appendString:", CFSTR(")"));
  return v4;
}

- (unint64_t)allocationSize
{
  return self->_allocationSize;
}

+ (id)_stringForFetchRequestResultType:(unint64_t)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  NSObject *v11;
  uint8_t buf[4];
  unint64_t v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  if (a3 < 5 && ((0x17u >> a3) & 1) != 0)
    return off_1E1EDDDC8[a3];
  v4 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Unknown fetch request result type: %ld");
  _NSCoreDataLog(17, v4, v5, v6, v7, v8, v9, v10, a3);
  v11 = __pflogFaultLog;
  if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
  {
    *(_DWORD *)buf = 134217984;
    v14 = a3;
    _os_log_fault_impl(&dword_18A253000, v11, OS_LOG_TYPE_FAULT, "CoreData: Unknown fetch request result type: %ld", buf, 0xCu);
  }
  return 0;
}

+ (BOOL)accessInstanceVariablesDirectly
{
  return 0;
}

- (unint64_t)_encodedFetchRequestFlagsForFlags:(unint64_t)a3
{
  return a3;
}

- (void)encodeWithCoder:(id)a3
{
  uint64_t v5;

  objc_msgSend(a3, "encodeObject:forKey:", -[NSFetchRequest propertiesToGroupBy](self, "propertiesToGroupBy"), CFSTR("NSValuesToGroupBy"));
  objc_msgSend(a3, "encodeObject:forKey:", -[NSFetchRequest havingPredicate](self, "havingPredicate"), CFSTR("NSHavingPredicate"));
  objc_msgSend(a3, "encodeInt:forKey:", -[NSFetchRequest fetchOffset](self, "fetchOffset"), CFSTR("NSFetchOffset"));
  objc_msgSend(a3, "encodeObject:forKey:", -[NSFetchRequest propertiesToFetch](self, "propertiesToFetch"), CFSTR("NSValuesToFetch"));
  if ((*((_BYTE *)&self->_flags + 1) & 2) != 0)
    objc_msgSend(a3, "encodeObject:forKey:", self->_entity, CFSTR("NSEntity"));
  else
    objc_msgSend(a3, "encodeConditionalObject:forKey:", -[NSFetchRequest entity](self, "entity"), CFSTR("NSEntity"));
  objc_msgSend(a3, "encodeObject:forKey:", -[NSFetchRequest predicate](self, "predicate"), CFSTR("NSPredicate"));
  objc_msgSend(a3, "encodeObject:forKey:", -[NSFetchRequest sortDescriptors](self, "sortDescriptors"), CFSTR("NSSortDescriptors"));
  objc_msgSend(a3, "encodeInt:forKey:", -[NSFetchRequest fetchLimit](self, "fetchLimit"), CFSTR("NSFetchLimit"));
  objc_msgSend(a3, "encodeInt:forKey:", -[NSFetchRequest fetchBatchSize](self, "fetchBatchSize"), CFSTR("NSBatchSize"));
  objc_msgSend(a3, "encodeObject:forKey:", -[NSFetchRequest relationshipKeyPathsForPrefetching](self, "relationshipKeyPathsForPrefetching"), CFSTR("NSRelationshipKeyPathsForPrefetching"));
  objc_msgSend(a3, "encodeInteger:forKey:", -[NSFetchRequest resultType](self, "resultType"), CFSTR("NSResultType"));
  objc_msgSend(a3, "encodeInteger:forKey:", -[NSFetchRequest allocationType](self, "allocationType"), CFSTR("NSAllocationType"));
  if (-[NSFetchRequest allocationSize](self, "allocationSize"))
    objc_msgSend(a3, "encodeInteger:forKey:", -[NSFetchRequest allocationSize](self, "allocationSize"), CFSTR("NSAllocationSize"));
  v5 = -[NSFetchRequest returnsDistinctResults](self, "returnsDistinctResults");
  if (-[NSFetchRequest includesSubentities](self, "includesSubentities"))
    v5 |= 2uLL;
  if (-[NSFetchRequest includesPropertyValues](self, "includesPropertyValues"))
    v5 |= 4uLL;
  if (-[NSFetchRequest returnsObjectsAsFaults](self, "returnsObjectsAsFaults"))
    v5 |= 8uLL;
  if (-[NSFetchRequest includesPendingChanges](self, "includesPendingChanges"))
    v5 |= 0x10uLL;
  if (-[NSFetchRequest shouldRefreshRefetchedObjects](self, "shouldRefreshRefetchedObjects"))
    v5 |= 0x20uLL;
  if (-[NSFetchRequest _disablePersistentStoreResultCaching](self, "_disablePersistentStoreResultCaching"))
    v5 |= 0x40uLL;
  if (-[NSFetchRequest purgeableResult](self, "purgeableResult"))
    v5 |= 0x80uLL;
  objc_msgSend(a3, "encodeBool:forKey:", 1, CFSTR("NSHasFetchRequestFlags"));
  objc_msgSend(a3, "encodeInteger:forKey:", -[NSFetchRequest _encodedFetchRequestFlagsForFlags:](self, "_encodedFetchRequestFlagsForFlags:", v5), CFSTR("NSFetchRequestFlags"));
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSFetchRequest)initWithCoder:(id)a3
{
  NSFetchRequest *v4;
  _QWORD *v5;
  unint64_t v6;
  void *v7;
  uint64_t v8;
  NSEntityDescription *v9;
  NSEntityDescription *v10;
  void *v11;
  char isKindOfClass;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  NSArray *sortDescriptors;
  uint64_t v19;
  uint64_t v20;
  uint64_t i;
  void *v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  NSArray *v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  _QWORD v36[2];
  void (*v37)(uint64_t);
  void *v38;
  _QWORD *v39;
  objc_super v40;
  _BYTE v41[128];
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  v40.receiver = self;
  v40.super_class = (Class)NSFetchRequest;
  v4 = -[NSFetchRequest init](&v40, sel_init);
  if (v4)
  {
    v5 = +[PFModelDecoderContext retainedContext](PFModelDecoderContext, "retainedContext");
    v36[0] = MEMORY[0x1E0C809B0];
    v36[1] = 3221225472;
    v37 = __32__NSFetchRequest_initWithCoder___block_invoke;
    v38 = &unk_1E1EDD520;
    v39 = v5;
    v4->_additionalPrivateIvars = (id *)PF_CALLOC_OBJECT_ARRAY(3);
    if (objc_msgSend(a3, "decodeBoolForKey:", CFSTR("NSHasFetchRequestFlags")))
    {
      v6 = objc_msgSend(a3, "decodeIntegerForKey:", CFSTR("NSFetchRequestFlags"));
      -[NSFetchRequest setReturnsDistinctResults:](v4, "setReturnsDistinctResults:", v6 & 1);
      -[NSFetchRequest setIncludesSubentities:](v4, "setIncludesSubentities:", (v6 >> 1) & 1);
      -[NSFetchRequest setIncludesPropertyValues:](v4, "setIncludesPropertyValues:", (v6 >> 2) & 1);
      -[NSFetchRequest setReturnsObjectsAsFaults:](v4, "setReturnsObjectsAsFaults:", (v6 >> 3) & 1);
      -[NSFetchRequest setIncludesPendingChanges:](v4, "setIncludesPendingChanges:", (v6 >> 4) & 1);
      -[NSFetchRequest setShouldRefreshRefetchedObjects:](v4, "setShouldRefreshRefetchedObjects:", (v6 >> 5) & 1);
      -[NSFetchRequest _setDisablePersistentStoreResultCaching:](v4, "_setDisablePersistentStoreResultCaching:", (v6 >> 6) & 1);
      -[NSFetchRequest setResultType:](v4, "setResultType:", objc_msgSend(a3, "decodeIntegerForKey:", CFSTR("NSResultType")));
      -[NSFetchRequest setAllocationType:](v4, "setAllocationType:", objc_msgSend(a3, "decodeIntegerForKey:", CFSTR("NSAllocationType")));
      -[NSFetchRequest setPurgeableResult:](v4, "setPurgeableResult:", (v6 >> 7) & 1);
    }
    else
    {
      v4->_flags = (_fetchRequestFlags)(*(_DWORD *)&v4->_flags & 0xFFBE1B00 | 0x46);
    }
    v7 = (void *)MEMORY[0x1E0C99E60];
    v8 = objc_opt_class();
    v9 = (NSEntityDescription *)objc_msgSend(a3, "decodeObjectOfClasses:forKey:", objc_msgSend(v7, "setWithObjects:", v8, objc_opt_class(), 0), CFSTR("NSEntity"));
    v4->_entity = v9;
    if (-[NSEntityDescription isNSString](v9, "isNSString"))
    {
      *(_DWORD *)&v4->_flags |= 0x200u;
      v10 = v4->_entity;
    }
    else if (v4->_entity)
    {
      if (v5)
        v11 = (void *)v5[3];
      else
        v11 = 0;
      objc_msgSend(v11, "addObject:");
      objc_opt_class();
      isKindOfClass = objc_opt_isKindOfClass();
      if ((isKindOfClass & 1) != 0)
        v13 = &unk_1E1F4A7C8;
      else
        v13 = &unk_1E1F4A7A0;
      if (v5 == 0 || (isKindOfClass & 1) == 0)
        goto LABEL_31;
      if (!v5[1])
      {
        v13 = &unk_1E1F4A7C8;
        goto LABEL_31;
      }
    }
    v14 = (void *)MEMORY[0x1E0C99E60];
    v15 = objc_opt_class();
    v4->_predicate = (NSPredicate *)(id)objc_msgSend(a3, "decodeObjectOfClasses:forKey:", objc_msgSend(v14, "setWithObjects:", v15, objc_opt_class(), 0), CFSTR("NSPredicate"));
    v16 = (void *)MEMORY[0x1E0C99E60];
    v17 = objc_opt_class();
    v4->_sortDescriptors = (NSArray *)(id)objc_msgSend(a3, "decodeObjectOfClasses:forKey:", objc_msgSend(v16, "setWithObjects:", v17, objc_opt_class(), 0), CFSTR("NSSortDescriptors"));
    if (!byte_1ECD8DE26)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        -[NSPredicate allowEvaluation](v4->_predicate, "allowEvaluation");
      v34 = 0u;
      v35 = 0u;
      v32 = 0u;
      v33 = 0u;
      sortDescriptors = v4->_sortDescriptors;
      v19 = -[NSArray countByEnumeratingWithState:objects:count:](sortDescriptors, "countByEnumeratingWithState:objects:count:", &v32, v41, 16);
      if (v19)
      {
        v20 = *(_QWORD *)v33;
        do
        {
          for (i = 0; i != v19; ++i)
          {
            if (*(_QWORD *)v33 != v20)
              objc_enumerationMutation(sortDescriptors);
            v22 = *(void **)(*((_QWORD *)&v32 + 1) + 8 * i);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
              objc_msgSend(v22, "allowEvaluation");
          }
          v19 = -[NSArray countByEnumeratingWithState:objects:count:](sortDescriptors, "countByEnumeratingWithState:objects:count:", &v32, v41, 16);
        }
        while (v19);
      }
    }
    v4->_fetchLimit = (int)objc_msgSend(a3, "decodeIntForKey:", CFSTR("NSFetchLimit"));
    *v4->_additionalPrivateIvars = (id)(int)objc_msgSend(a3, "decodeIntForKey:", CFSTR("NSFetchOffset"));
    v4->_batchSize = objc_msgSend(a3, "decodeIntegerForKey:", CFSTR("NSBatchSize"));
    v4->_allocationSize = objc_msgSend(a3, "decodeIntegerForKey:", CFSTR("NSAllocationSize"));
    v23 = (void *)MEMORY[0x1E0C99E60];
    v24 = objc_opt_class();
    v25 = objc_opt_class();
    v26 = objc_opt_class();
    v27 = (NSArray *)(id)objc_msgSend(a3, "decodeObjectOfClasses:forKey:", objc_msgSend(v23, "setWithObjects:", v24, v25, v26, objc_opt_class(), 0), CFSTR("NSValuesToFetch"));
    v4->_valuesToFetch = v27;
    if (!v27 || (-[NSArray isNSArray](v27, "isNSArray") & 1) != 0)
    {
      v4->_havingPredicate = (NSPredicate *)(id)objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("NSHavingPredicate"));
      v28 = (void *)MEMORY[0x1E0C99E60];
      v29 = objc_opt_class();
      v30 = objc_opt_class();
      v4->_groupByProperties = (NSArray *)(id)objc_msgSend(a3, "decodeObjectOfClasses:forKey:", objc_msgSend(v28, "setWithObjects:", v29, v30, objc_opt_class(), 0), CFSTR("NSValuesToGroupBy"));
LABEL_32:
      v37((uint64_t)v36);
      return v4;
    }
    v13 = &unk_1E1F4A7F0;
LABEL_31:
    objc_msgSend(a3, "failWithError:", objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB28A8], 4866, v13));

    v4 = 0;
    goto LABEL_32;
  }
  return v4;
}

void __32__NSFetchRequest_initWithCoder___block_invoke(uint64_t a1)
{

}

- (unint64_t)hash
{
  unint64_t v3;
  NSArray *v4;
  void *v5;
  NSArray *v6;
  id v7;

  v3 = -[NSEntityDescription hash](-[NSFetchRequest entity](self, "entity"), "hash") ^ __rbit32(-[NSFetchRequest resultType](self, "resultType"));
  -[NSFetchRequest predicate](self, "predicate");
  v4 = -[NSFetchRequest sortDescriptors](self, "sortDescriptors");
  if (-[NSArray count](v4, "count"))
  {
    v5 = (void *)objc_msgSend(-[NSArray objectAtIndex:](v4, "objectAtIndex:", 0), "key");
    if (v5)
      v3 ^= objc_msgSend(v5, "hash");
  }
  v6 = -[NSFetchRequest propertiesToFetch](self, "propertiesToFetch");
  if (-[NSArray count](v6, "count"))
  {
    v7 = -[NSArray objectAtIndex:](v6, "objectAtIndex:", 0);
    if ((objc_msgSend(v7, "isNSString") & 1) == 0)
      v7 = (id)objc_msgSend(v7, "name");
    v3 ^= objc_msgSend(v7, "hash");
  }
  return v3;
}

- (BOOL)isEqual:(id)a3
{
  NSString *v5;
  uint64_t v6;
  uint64_t v7;
  NSUInteger v8;
  NSUInteger v9;
  NSUInteger v10;
  NSPredicate *v11;
  uint64_t v12;
  NSArray *v13;
  uint64_t v14;
  NSArray *v15;
  uint64_t v16;
  NSPredicate *v17;
  uint64_t v18;
  NSArray *v19;
  uint64_t v20;

  if (a3 == self)
    goto LABEL_33;
  if (!a3)
    goto LABEL_32;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    goto LABEL_32;
  v5 = -[NSFetchRequest entityName](self, "entityName");
  v6 = objc_msgSend(a3, "entityName");
  if (v5 != (NSString *)v6)
  {
    v7 = v6;
    LOBYTE(v6) = 0;
    if (!v5)
      return v6;
    if (!v7)
      return v6;
    LODWORD(v6) = -[NSString isEqual:](v5, "isEqual:");
    if (!(_DWORD)v6)
      return v6;
  }
  if (((*((_DWORD *)a3 + 26) ^ *(_DWORD *)&self->_flags) & 0x7FE4FF) != 0
    || (v8 = -[NSFetchRequest fetchLimit](self, "fetchLimit"), v8 != objc_msgSend(a3, "fetchLimit"))
    || (v9 = -[NSFetchRequest fetchBatchSize](self, "fetchBatchSize"), v9 != objc_msgSend(a3, "fetchBatchSize"))
    || (v10 = -[NSFetchRequest fetchOffset](self, "fetchOffset"), v10 != objc_msgSend(a3, "fetchOffset")))
  {
LABEL_32:
    LOBYTE(v6) = 0;
    return v6;
  }
  v11 = -[NSFetchRequest predicate](self, "predicate");
  v6 = objc_msgSend(a3, "predicate");
  if (v11 == (NSPredicate *)v6
    || (v12 = v6, LOBYTE(v6) = 0, v11) && v12 && (LODWORD(v6) = -[NSPredicate isEqual:](v11, "isEqual:"), (_DWORD)v6))
  {
    v13 = -[NSFetchRequest sortDescriptors](self, "sortDescriptors");
    v6 = objc_msgSend(a3, "sortDescriptors");
    if (v13 == (NSArray *)v6
      || (v14 = v6, LOBYTE(v6) = 0, v13) && v14 && (LODWORD(v6) = -[NSArray isEqual:](v13, "isEqual:"), (_DWORD)v6))
    {
      v15 = -[NSFetchRequest propertiesToFetch](self, "propertiesToFetch");
      v6 = objc_msgSend(a3, "propertiesToFetch");
      if (v15 == (NSArray *)v6
        || (v16 = v6, LOBYTE(v6) = 0, v15) && v16 && (LODWORD(v6) = -[NSArray isEqual:](v15, "isEqual:"), (_DWORD)v6))
      {
        v17 = -[NSFetchRequest havingPredicate](self, "havingPredicate");
        v6 = objc_msgSend(a3, "havingPredicate");
        if (v17 == (NSPredicate *)v6
          || (v18 = v6, LOBYTE(v6) = 0, v17)
          && v18
          && (LODWORD(v6) = -[NSPredicate isEqual:](v17, "isEqual:"), (_DWORD)v6))
        {
          v19 = -[NSFetchRequest propertiesToGroupBy](self, "propertiesToGroupBy");
          v6 = objc_msgSend(a3, "propertiesToGroupBy");
          if (v19 != (NSArray *)v6)
          {
            v20 = v6;
            LOBYTE(v6) = 0;
            if (v19 && v20)
              LOBYTE(v6) = -[NSArray isEqual:](v19, "isEqual:");
            return v6;
          }
LABEL_33:
          LOBYTE(v6) = 1;
        }
      }
    }
  }
  return v6;
}

- (void)setAllocationSize:(unint64_t)a3
{
  unsigned int v3;

  v3 = a3;
  -[NSFetchRequest _throwIfNotEditable](self, "_throwIfNotEditable");
  self->_allocationSize = v3;
}

- (BOOL)purgeableResult
{
  return (*((unsigned __int8 *)&self->_flags + 2) >> 6) & 1;
}

- (void)setPurgeableResult:(BOOL)a3
{
  _BOOL4 v3;
  int v5;

  v3 = a3;
  -[NSFetchRequest _throwIfNotEditable](self, "_throwIfNotEditable");
  if (v3)
    v5 = 0x400000;
  else
    v5 = 0;
  self->_flags = (_fetchRequestFlags)(*(_DWORD *)&self->_flags & 0xFFBFFFFF | v5);
}

- (void)_setDisablePersistentStoreResultCaching:(BOOL)a3
{
  _BOOL4 v3;
  int v5;

  v3 = a3;
  -[NSFetchRequest _throwIfNotEditable](self, "_throwIfNotEditable");
  if (v3)
    v5 = 0x2000;
  else
    v5 = 0;
  self->_flags = (_fetchRequestFlags)(*(_DWORD *)&self->_flags & 0xFFFFDFFF | v5);
}

- (void)_setFetchBatchLRUEntriesLimit:(unint64_t)a3
{
  unsigned int v3;

  if (a3)
  {
    v3 = 1024;
    if (a3 < 0x400)
      v3 = a3;
    self->_flags = (_fetchRequestFlags)(*(_DWORD *)&self->_flags & 0xFFE1FFFF | (((((__clz(__rbit32(v3)) << 17) + 0x20000) >> 17) & 0xF) << 17));
  }
  else
  {
    *(_DWORD *)&self->_flags &= 0xFFE1FFFF;
  }
}

- (void)_writeIntoData:(id)a3 propertiesDict:(id)a4 uniquedPropertyNames:(id)a5 uniquedStrings:(id)a6 uniquedData:(id)a7 uniquedMappings:(id)a8 entities:(id)a9
{
  void *v12;
  unsigned int v13;
  unsigned int v14;
  uint64_t v15;
  uint64_t v16;
  id v17;
  uint64_t v18;
  id v19;
  unsigned int v20;
  unsigned int v21;
  unsigned int v22;
  uint64_t v23;
  uint64_t v24;
  id v25;
  uint64_t v26;
  id v27;
  unsigned int v28;
  unsigned int v29;
  NSArray *sortDescriptors;
  unsigned int v31;
  uint64_t v32;
  unsigned int v33;
  unsigned int v36;

  if (!_writeIntoData_propertiesDict_uniquedPropertyNames_uniquedStrings_uniquedData_uniquedMappings_entities__PropertyProxyClass_0)
    _writeIntoData_propertiesDict_uniquedPropertyNames_uniquedStrings_uniquedData_uniquedMappings_entities__PropertyProxyClass_0 = objc_opt_class();
  v12 = (void *)objc_msgSend(a9, "mapping", a3, a4, a5, a6, a7, a8);
  _writeInt32IntoData(a3, 0xBEEFCAFE);
  v32 = objc_msgSend(a3, "length");
  _writeInt32IntoData(a3, 0);
  v13 = -[NSArray count](self->_groupByProperties, "count");
  _writeInt32IntoData(a3, v13);
  if (v13)
  {
    v14 = v13;
    do
    {
      _writeInt64IntoData(a3, 0);
      --v14;
    }
    while (v14);
    v15 = 0;
    v16 = v13;
    do
    {
      v17 = -[NSArray objectAtIndex:](self->_groupByProperties, "objectAtIndex:", v15, v32);
      v18 = _writeIntoData_propertiesDict_uniquedPropertyNames_uniquedStrings_uniquedData_uniquedMappings_entities__PropertyProxyClass_0;
      if (v18 == objc_opt_class())
      {
        _writeInt32IntoData(a3, 0);
        _writeInt32IntoData(a3, objc_msgSend(v12, "indexForKey:", objc_msgSend((id)objc_msgSend(v17, "entity"), "name")));
        _writeNSPropertyProxyIntoData(a3, v17, a4);
      }
      else
      {
        if (objc_msgSend(v17, "isNSString"))
        {
          _writeInt32IntoData(a3, 1u);
          v19 = a5;
        }
        else
        {
          _writeInt32IntoData(a3, 2u);
          v19 = a4;
        }
        _writeInt32IntoData(a3, objc_msgSend((id)objc_msgSend(v19, "objectForKey:", v17), "unsignedIntegerValue"));
      }
      ++v15;
    }
    while (v16 != v15);
  }
  if (self->_havingPredicate)
    v20 = objc_msgSend((id)objc_msgSend(a7, "objectForKey:"), "unsignedIntegerValue");
  else
    v20 = 0;
  _writeInt32IntoData(a3, v20);
  _writeInt64IntoData(a3, -[NSFetchRequest fetchOffset](self, "fetchOffset"));
  v21 = -[NSArray count](self->_valuesToFetch, "count");
  _writeInt32IntoData(a3, v21);
  if (v21)
  {
    v22 = v21;
    do
    {
      _writeInt64IntoData(a3, 0);
      --v22;
    }
    while (v22);
    v23 = 0;
    v24 = v21;
    do
    {
      v25 = -[NSArray objectAtIndex:](self->_valuesToFetch, "objectAtIndex:", v23, v32);
      v26 = _writeIntoData_propertiesDict_uniquedPropertyNames_uniquedStrings_uniquedData_uniquedMappings_entities__PropertyProxyClass_0;
      if (v26 == objc_opt_class())
      {
        _writeInt32IntoData(a3, 0);
        _writeInt32IntoData(a3, objc_msgSend(v12, "indexForKey:", objc_msgSend((id)objc_msgSend(v25, "entity"), "name")));
        _writeNSPropertyProxyIntoData(a3, v25, a4);
      }
      else
      {
        if (objc_msgSend(v25, "isNSString"))
        {
          _writeInt32IntoData(a3, 1u);
          v27 = a5;
        }
        else
        {
          _writeInt32IntoData(a3, 2u);
          v27 = a4;
        }
        _writeInt32IntoData(a3, objc_msgSend((id)objc_msgSend(v27, "objectForKey:", v25), "unsignedIntegerValue"));
      }
      ++v23;
    }
    while (v24 != v23);
  }
  if (-[NSEntityDescription isNSString](self->_entity, "isNSString", v32))
  {
    _writeInt32IntoData(a3, 0);
    v28 = objc_msgSend((id)objc_msgSend(a5, "objectForKey:", self->_entity), "unsignedIntegerValue");
  }
  else
  {
    _writeInt32IntoData(a3, 1u);
    v28 = objc_msgSend(v12, "indexForKey:", -[NSEntityDescription name](self->_entity, "name"));
  }
  _writeInt32IntoData(a3, v28);
  if (self->_predicate)
    v29 = objc_msgSend((id)objc_msgSend(a7, "objectForKey:"), "unsignedIntegerValue");
  else
    v29 = 0;
  _writeInt32IntoData(a3, v29);
  sortDescriptors = self->_sortDescriptors;
  if (sortDescriptors && -[NSArray count](sortDescriptors, "count"))
  {
    _writeInt32IntoData(a3, -[NSArray count](self->_sortDescriptors, "count"));
    _writePFEncodedArrayShapeIntoData(a3, self->_sortDescriptors, a7, 0);
  }
  else
  {
    _writeInt32IntoData(a3, 0);
  }
  _writeInt64IntoData(a3, self->_batchSize);
  _writeInt64IntoData(a3, self->_fetchLimit);
  v31 = -[NSArray count](self->_relationshipKeyPathsForPrefetching, "count");
  _writeInt32IntoData(a3, v31);
  if (v31)
    _writePFEncodedArrayShapeIntoData(a3, self->_relationshipKeyPathsForPrefetching, a5, 0);
  _writeInt32IntoData(a3, *(_DWORD *)&self->_flags);
  _writeInt32IntoData(a3, 0xBEEFCAFE);
  v36 = bswap32(objc_msgSend(a3, "length") - v33);
  objc_msgSend(a3, "replaceBytesInRange:withBytes:", v33, 4, &v36);
}

@end
