@implementation NSMappingModel

+ (void)initialize
{
  const char *v3;
  const char *v4;

  objc_opt_self();
  if ((id)objc_opt_class() == a1)
  {
    objc_opt_self();
    _CoreData_MigrationDebug = +[_PFRoutines integerValueForOverride:]((uint64_t)_PFRoutines, (uint64_t)CFSTR("com.apple.CoreData.MigrationDebug"));
    if (!_CoreData_MigrationDebug)
    {
      v3 = getprogname();
      if (v3)
      {
        v4 = v3;
        if (*v3)
        {
          if (!strncmp("assetsd", v3, 7uLL) || !strncmp("photolibraryd", v4, 0xDuLL))
            _CoreData_MigrationDebug = 1;
        }
      }
    }
  }
}

+ (id)_newMappingModelFromBundles:(id)a3 forSourceHashes:(id)a4 destinationHashes:(id)a5
{
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t i;
  void *v11;
  NSMappingModel *v12;
  NSMappingModel *v13;
  id v14;
  id v15;
  NSArray *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t j;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  int v30;
  int v31;
  int v32;
  const __CFString *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  void *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  void *v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v65;
  id v66;
  uint64_t v67;
  uint64_t v68;
  void *context;
  id obj;
  uint64_t v71;
  uint64_t v74;
  int v75;
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
  _BYTE v88[128];
  _BYTE v89[128];
  _BYTE v90[128];
  uint64_t v91;

  v91 = *MEMORY[0x1E0C80C00];
  v75 = +[NSMappingModel migrationDebugLevel](NSMappingModel, "migrationDebugLevel");
  v84 = 0u;
  v85 = 0u;
  v86 = 0u;
  v87 = 0u;
  v67 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v84, v90, 16);
  if (!v67)
    return 0;
  v6 = *(_QWORD *)v85;
  v65 = *(_QWORD *)v85;
  v66 = a3;
  do
  {
    v7 = 0;
    do
    {
      if (*(_QWORD *)v85 != v6)
        objc_enumerationMutation(a3);
      v68 = v7;
      v8 = *(void **)(*((_QWORD *)&v84 + 1) + 8 * v7);
      context = (void *)MEMORY[0x18D76B4E4]();
      v9 = (void *)objc_msgSend(v8, "pathsForResourcesOfType:inDirectory:", CFSTR("cdm"), 0);
      v80 = 0u;
      v81 = 0u;
      v82 = 0u;
      v83 = 0u;
      obj = v9;
      v74 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v80, v89, 16);
      if (v74)
      {
        v71 = *(_QWORD *)v81;
        while (2)
        {
          for (i = 0; i != v74; ++i)
          {
            if (*(_QWORD *)v81 != v71)
              objc_enumerationMutation(obj);
            v11 = *(void **)(*((_QWORD *)&v80 + 1) + 8 * i);
            v12 = [NSMappingModel alloc];
            v13 = -[NSMappingModel initWithContentsOfURL:](v12, "initWithContentsOfURL:", objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:", v11));
            v14 = objc_alloc_init(MEMORY[0x1E0C99E20]);
            v15 = objc_alloc_init(MEMORY[0x1E0C99E20]);
            v76 = 0u;
            v77 = 0u;
            v78 = 0u;
            v79 = 0u;
            v16 = -[NSMappingModel entityMappings](v13, "entityMappings");
            v17 = -[NSArray countByEnumeratingWithState:objects:count:](v16, "countByEnumeratingWithState:objects:count:", &v76, v88, 16);
            if (v17)
            {
              v24 = v17;
              v25 = *(_QWORD *)v77;
              do
              {
                for (j = 0; j != v24; ++j)
                {
                  if (*(_QWORD *)v77 != v25)
                    objc_enumerationMutation(v16);
                  v27 = *(void **)(*((_QWORD *)&v76 + 1) + 8 * j);
                  v28 = objc_msgSend(v27, "sourceEntityVersionHash");
                  if (v28)
                    objc_msgSend(v14, "addObject:", v28);
                  v29 = objc_msgSend(v27, "destinationEntityVersionHash");
                  if (v29)
                    objc_msgSend(v15, "addObject:", v29);
                }
                v24 = -[NSArray countByEnumeratingWithState:objects:count:](v16, "countByEnumeratingWithState:objects:count:", &v76, v88, 16);
              }
              while (v24);
            }
            if (v75 >= 2)
              _NSCoreDataLog(4, (uint64_t)CFSTR("(migration) checking mapping model %@\n source hashes: \n%@\n destination hashes: %@\n"), v18, v19, v20, v21, v22, v23, (uint64_t)v11);
            if (objc_msgSend(v14, "count"))
              v30 = objc_msgSend(v14, "isSubsetOfSet:", a4);
            else
              v30 = 0;
            if (objc_msgSend(v15, "count"))
              v31 = objc_msgSend(v15, "isSubsetOfSet:", a5);
            else
              v31 = 0;
            v32 = v30 & v31;
            if (v75 >= 2 && (v32 & 1) == 0)
            {
              if (v30)
                v33 = &stru_1E1EE23F0;
              else
                v33 = CFSTR("source");
              objc_msgSend(v11, "lastPathComponent");
              _NSCoreDataLog(4, (uint64_t)CFSTR("(migration) mismatched %@%@%@ hashes for mapping model %@\n"), v34, v35, v36, v37, v38, v39, (uint64_t)v33);
              if ((v30 & 1) == 0 && objc_msgSend(v14, "intersectsSet:", a4))
              {
                v40 = (void *)objc_msgSend(v14, "mutableCopy");
                objc_msgSend(v40, "intersectSet:", a4);
                v41 = objc_msgSend(a4, "count");
                v42 = objc_msgSend(v40, "count");
                _NSCoreDataLog(4, (uint64_t)CFSTR("(migration) no match found for %d of %d mapping model source hashes"), v43, v44, v45, v46, v47, v48, v41 - v42);

              }
              if ((v31 & 1) == 0 && objc_msgSend(v15, "intersectsSet:", a5))
              {
                v49 = (void *)objc_msgSend(v15, "mutableCopy");
                objc_msgSend(v49, "intersectSet:", a5);
                v50 = objc_msgSend(a5, "count");
                v51 = objc_msgSend(v49, "count");
                _NSCoreDataLog(4, (uint64_t)CFSTR("(migration) no match found for %d of %d mapping model destination hashes"), v52, v53, v54, v55, v56, v57, v50 - v51);

              }
            }

            if (v32)
            {
              if (v75 >= 1)
                _NSCoreDataLog(4, (uint64_t)CFSTR("(migration) found compatible mapping model %@"), v58, v59, v60, v61, v62, v63, (uint64_t)v11);
              objc_autoreleasePoolPop(context);
              return v13;
            }

          }
          v74 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v80, v89, 16);
          if (v74)
            continue;
          break;
        }
      }
      objc_autoreleasePoolPop(context);
      v7 = v68 + 1;
      v6 = v65;
      a3 = v66;
    }
    while (v68 + 1 != v67);
    v13 = 0;
    v67 = objc_msgSend(v66, "countByEnumeratingWithState:objects:count:", &v84, v90, 16);
  }
  while (v67);
  return v13;
}

+ (NSMappingModel)mappingModelFromBundles:(NSArray *)bundles forSourceModel:(NSManagedObjectModel *)sourceModel destinationModel:(NSManagedObjectModel *)destinationModel
{
  NSMappingModel *result;

  result = (NSMappingModel *)+[NSMappingModel _mappingModelFromBundles:forSourceModel:destinationModel:]((uint64_t)NSMappingModel, bundles, sourceModel, destinationModel);
  if (!result)
    return (NSMappingModel *)+[NSMappingModel _mappingModelFromBundles:forSourceModel:destinationModel:]((uint64_t)NSMappingModel, 0, sourceModel, destinationModel);
  return result;
}

+ (id)_mappingModelFromBundles:(void *)a3 forSourceModel:(void *)a4 destinationModel:
{
  void *v7;
  int v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  uint64_t v21;
  char v22;
  uint64_t v23;
  int v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  char v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  int v37;

  v7 = (void *)objc_opt_self();
  v8 = +[NSMappingModel migrationDebugLevel](NSMappingModel, "migrationDebugLevel");
  v9 = objc_alloc_init(MEMORY[0x1E0CB34A8]);
  if (v8 >= 2)
  {
    v10 = objc_msgSend(a3, "entityVersionHashesByName");
    objc_msgSend(a4, "entityVersionHashesByName");
    _NSCoreDataLog(4, (uint64_t)CFSTR("(migration) looking for mapping model with \n source hashes: \n%@\n destination hashes: %@\n"), v11, v12, v13, v14, v15, v16, v10);
  }
  v17 = (void *)objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", objc_msgSend((id)objc_msgSend(a3, "entityVersionHashesByName"), "allValues"));
  v18 = (void *)objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", objc_msgSend((id)objc_msgSend(a4, "entityVersionHashesByName"), "allValues"));
  v37 = v8;
  if (objc_msgSend(a2, "count"))
  {
    v19 = (id)objc_msgSend(a2, "mutableCopy");
    v20 = (void *)objc_msgSend(v7, "_newMappingModelFromBundles:forSourceHashes:destinationHashes:", v19, v17, v18);
    if (v20)
    {
LABEL_14:
      objc_msgSend(v9, "drain");
      return v20;
    }
  }
  else
  {
    v19 = (id)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v25 = objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
    if (v25)
      objc_msgSend(v19, "addObject:", v25);
    v20 = (void *)objc_msgSend(v7, "_newMappingModelFromBundles:forSourceHashes:destinationHashes:", v19, v17, v18);
    if (v20)
      goto LABEL_14;
    v26 = objc_msgSend(MEMORY[0x1E0CB34D0], "allBundles");
    v20 = (void *)objc_msgSend(v7, "_newMappingModelFromBundles:forSourceHashes:destinationHashes:", v26, v17, v18);
    objc_msgSend(v19, "addObjectsFromArray:", v26);
    if (v20)
      goto LABEL_14;
    v27 = objc_msgSend(MEMORY[0x1E0CB34D0], "allFrameworks");
    v20 = (void *)objc_msgSend(v7, "_newMappingModelFromBundles:forSourceHashes:destinationHashes:", v27, v17, v18);
    objc_msgSend(v19, "addObjectsFromArray:", v27);
    if (v20)
      goto LABEL_14;
  }
  v21 = objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", objc_msgSend(-[NSManagedObjectModel _entityVersionHashesByNameInStyle:](a3, 1), "allValues"));
  v22 = objc_msgSend(v17, "isEqual:", v21);
  if ((v22 & 1) == 0)
  {
    v20 = (void *)objc_msgSend(v7, "_newMappingModelFromBundles:forSourceHashes:destinationHashes:", v19, v21, v18);
    if (v20)
      goto LABEL_14;
  }
  v23 = objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", objc_msgSend((id)objc_msgSend(a4, "entityVersionHashesByName"), "allValues"));
  if ((objc_msgSend(v18, "isEqual:", v23) & 1) != 0)
  {
    v20 = 0;
    v24 = v37;
  }
  else
  {
    v20 = (void *)objc_msgSend(v7, "_newMappingModelFromBundles:forSourceHashes:destinationHashes:", v19, v21, v23);
    if (v20)
      v29 = 1;
    else
      v29 = v22;
    v24 = v37;
    if ((v29 & 1) == 0)
      v20 = (void *)objc_msgSend(v7, "_newMappingModelFromBundles:forSourceHashes:destinationHashes:", v19, v17, v23);
  }
  objc_msgSend(v9, "drain");
  if (v24 >= 2 && !v20)
    _NSCoreDataLog(4, (uint64_t)CFSTR("(migration) no suitable mapping model found"), v30, v31, v32, v33, v34, v35, v36);
  return v20;
}

+ (NSMappingModel)inferredMappingModelForSourceModel:(NSManagedObjectModel *)sourceModel destinationModel:(NSManagedObjectModel *)destinationModel error:(NSError *)error
{
  int v8;
  id v9;
  NSDictionary *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  _NSMappingModelBuilder *v17;
  NSMappingModel *v18;
  id v19;
  NSMappingModel *v20;
  id v21;
  id v22;
  id v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  void *v31;
  uint64_t v32;
  const __CFString *v33;
  id v34;

  if (!sourceModel)
  {
    v31 = (void *)MEMORY[0x1E0C99DA0];
    v32 = *MEMORY[0x1E0C99778];
    v33 = CFSTR("Cannot create an inferred NSMappingModel with a nil source model");
    goto LABEL_14;
  }
  if (!destinationModel)
  {
    v31 = (void *)MEMORY[0x1E0C99DA0];
    v32 = *MEMORY[0x1E0C99778];
    v33 = CFSTR("Cannot create an inferred NSMappingModel with a nil destination model");
LABEL_14:
    objc_exception_throw((id)objc_msgSend(v31, "exceptionWithName:reason:userInfo:", v32, v33, 0));
  }
  v8 = +[NSMappingModel migrationDebugLevel](NSMappingModel, "migrationDebugLevel");
  v9 = objc_alloc_init(MEMORY[0x1E0CB34A8]);
  if (v8 >= 1)
  {
    v10 = -[NSManagedObjectModel entityVersionHashesByName](sourceModel, "entityVersionHashesByName");
    -[NSManagedObjectModel entityVersionHashesByName](destinationModel, "entityVersionHashesByName");
    _NSCoreDataLog(4, (uint64_t)CFSTR("(migration) inferring a mapping model between data models with \n source hashes: \n%@\n destination hashes: %@\n"), v11, v12, v13, v14, v15, v16, (uint64_t)v10);
  }
  v34 = 0;
  v17 = -[_NSMappingModelBuilder initWithSourceModel:destinationModel:]([_NSMappingModelBuilder alloc], "initWithSourceModel:destinationModel:", sourceModel, destinationModel);
  v18 = -[_NSMappingModelBuilder newInferredMappingModel:]((NSMappingModel *)v17, (uint64_t *)&v34);
  v19 = v34;

  objc_msgSend(v9, "drain");
  v20 = v18;
  v21 = v34;
  v22 = 0;
  v23 = v34;
  if (error && v34)
    *error = (NSError *)v34;
  if (v8 >= 1 && !v18)
  {
    objc_msgSend(v23, "userInfo");
    _NSCoreDataLog(4, (uint64_t)CFSTR("(migration) inferring mapping model failed with error: %@ userInfo: %@\n"), v24, v25, v26, v27, v28, v29, (uint64_t)v23);
  }
  return v18;
}

- (NSMappingModel)init
{
  return (NSMappingModel *)-[NSMappingModel _initWithEntityMappings:](self, "_initWithEntityMappings:", 0);
}

- (NSMappingModel)initWithContentsOfURL:(NSURL *)url
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  NSMappingModel *v7;
  uint64_t v9;

  v4 = objc_alloc_init(MEMORY[0x1E0CB34A8]);
  v5 = objc_msgSend(MEMORY[0x1E0C99D50], "dataWithContentsOfURL:", url);
  v9 = 0;
  v6 = objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", objc_opt_class());
  v7 = (NSMappingModel *)(id)+[_PFRoutines unarchiveCylicGraphObjectOfClasses:fromData:error:]((uint64_t)_PFRoutines, v6, v5, (uint64_t)&v9);
  objc_msgSend(v4, "drain");
  return v7;
}

- (void)dealloc
{
  objc_super v3;

  self->_entityMappings = 0;
  self->_entityMappingsByName = 0;
  v3.receiver = self;
  v3.super_class = (Class)NSMappingModel;
  -[NSMappingModel dealloc](&v3, sel_dealloc);
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v5;
  NSArray *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;

  v5 = (void *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  if (v5)
  {
    v6 = -[NSMappingModel entityMappings](self, "entityMappings");
    v7 = (void *)objc_msgSend((id)objc_msgSend(MEMORY[0x1E0C99DE8], "allocWithZone:", a3), "init");
    v8 = -[NSArray count](v6, "count");
    if (v8)
    {
      v9 = v8;
      for (i = 0; i != v9; ++i)
      {
        v11 = (void *)objc_msgSend(-[NSArray objectAtIndex:](v6, "objectAtIndex:", i), "copy");
        objc_msgSend(v7, "addObject:", v11);

      }
    }
    objc_msgSend(v5, "setEntityMappings:", v7);

  }
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  NSArray *v5;
  uint64_t v6;
  uint64_t v7;
  BOOL result;

  if (a3 == self)
    return 1;
  if (!a3)
    return 0;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    return 0;
  v5 = -[NSMappingModel entityMappings](self, "entityMappings");
  v6 = objc_msgSend(a3, "entityMappings");
  if (v5 == (NSArray *)v6)
    return 1;
  v7 = v6;
  result = 0;
  if (v5)
  {
    if (v7)
      return -[NSArray isEqual:](v5, "isEqual:");
  }
  return result;
}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(%@), entityMappings %@"), objc_opt_class(), -[NSMappingModel entityMappings](self, "entityMappings"));
}

- (NSArray)entityMappings
{
  if (self->_entityMappings)
    return &self->_entityMappings->super;
  else
    return (NSArray *)NSArray_EmptyArray;
}

- (void)setEntityMappings:(NSArray *)entityMappings
{
  NSMutableArray *v5;
  NSUInteger v6;
  NSUInteger v7;
  uint64_t i;
  id v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  const __CFString *v14;
  void *v15;
  uint64_t v16;

  -[NSMappingModel _throwIfNotEditable](self, "_throwIfNotEditable");
  v5 = self->_entityMappings;
  if (v5 != (NSMutableArray *)entityMappings)
  {

    self->_entityMappings = (NSMutableArray *)-[NSArray copy](entityMappings, "copy");
    self->_entityMappingsByName = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    v6 = -[NSArray count](entityMappings, "count");
    if (v6)
    {
      v7 = v6;
      for (i = 0; v7 != i; ++i)
      {
        v9 = -[NSArray objectAtIndex:](entityMappings, "objectAtIndex:", i);
        -[NSMappingModel _throwIfNotEditable](self, "_throwIfNotEditable");
        if (v9)
        {
          v10 = objc_msgSend(v9, "name");
          if (!v10)
          {
            v12 = (void *)MEMORY[0x1E0C99DA0];
            v13 = *MEMORY[0x1E0C99778];
            v14 = CFSTR("Can't add unnamed entity mapping to model.");
            goto LABEL_12;
          }
          v11 = v10;
          if (-[NSMutableDictionary objectForKey:](self->_entityMappingsByName, "objectForKey:", v10))
          {
            v15 = (void *)MEMORY[0x1E0C99DA0];
            v16 = *MEMORY[0x1E0C99768];
            v14 = (const __CFString *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Model already contains an entity mapping named %@."), v11);
            v12 = v15;
            v13 = v16;
LABEL_12:
            objc_exception_throw((id)objc_msgSend(v12, "exceptionWithName:reason:userInfo:", v13, v14, 0));
          }
          -[NSMutableDictionary setObject:forKey:](self->_entityMappingsByName, "setObject:forKey:", v9, v11);
        }
      }
    }
  }
}

- (NSDictionary)entityMappingsByName
{
  return &self->_entityMappingsByName->super;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  objc_msgSend(a3, "encodeObject:forKey:", -[NSMappingModel entityMappings](self, "entityMappings"), CFSTR("NSEntityMappings"));
  objc_msgSend(a3, "encodeObject:forKey:", -[NSMappingModel entityMappingsByName](self, "entityMappingsByName"), CFSTR("NSEntityMappingsByName"));
}

- (NSMappingModel)initWithCoder:(id)a3
{
  NSMappingModel *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)NSMappingModel;
  v4 = -[NSMappingModel init](&v12, sel_init);
  if (v4)
  {
    v5 = (void *)MEMORY[0x1E0C99E60];
    v6 = objc_opt_class();
    v7 = objc_opt_class();
    v4->_entityMappings = (NSMutableArray *)(id)objc_msgSend(a3, "decodeObjectOfClasses:forKey:", objc_msgSend(v5, "setWithObjects:", v6, v7, objc_opt_class(), 0), CFSTR("NSEntityMappings"));
    v8 = (void *)MEMORY[0x1E0C99E60];
    v9 = objc_opt_class();
    v10 = objc_opt_class();
    v4->_entityMappingsByName = (NSMutableDictionary *)(id)objc_msgSend(a3, "decodeObjectOfClasses:forKey:", objc_msgSend(v8, "setWithObjects:", v9, v10, objc_opt_class(), 0), CFSTR("NSEntityMappingsByName"));
  }
  return v4;
}

+ (int)migrationDebugLevel
{
  return _CoreData_MigrationDebug;
}

+ (void)setMigrationDebugLevel:(int)a3
{
  _CoreData_MigrationDebug = a3;
}

- (uint64_t)_isInferredMappingModel
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _BYTE v11[128];
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  if (result)
  {
    v9 = 0u;
    v10 = 0u;
    v7 = 0u;
    v8 = 0u;
    v1 = (void *)objc_msgSend((id)result, "entityMappings", 0);
    v2 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
    if (v2)
    {
      v3 = v2;
      v4 = *(_QWORD *)v8;
LABEL_4:
      v5 = 0;
      while (1)
      {
        if (*(_QWORD *)v8 != v4)
          objc_enumerationMutation(v1);
        v6 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v7 + 1) + 8 * v5), "name");
        result = objc_msgSend(v6, "hasPrefix:", _NSInferredMappingPrefix);
        if (!(_DWORD)result)
          break;
        if (v3 == ++v5)
        {
          v3 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
          if (v3)
            goto LABEL_4;
          return 1;
        }
      }
    }
    else
    {
      return 1;
    }
  }
  return result;
}

- (uint64_t)_hasInferredMappingNeedingValidation
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  _BYTE v10[128];
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  if (result)
  {
    v8 = 0u;
    v9 = 0u;
    v6 = 0u;
    v7 = 0u;
    v1 = (void *)objc_msgSend((id)result, "entityMappings", 0);
    result = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v6, v10, 16);
    if (result)
    {
      v2 = result;
      v3 = *(_QWORD *)v7;
      while (2)
      {
        v4 = 0;
        do
        {
          if (*(_QWORD *)v7 != v3)
            objc_enumerationMutation(v1);
          v5 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v6 + 1) + 8 * v4), "userInfo");
          if ((objc_msgSend((id)objc_msgSend(v5, "objectForKey:", _NSInferredMappingCouldFailValidation), "BOOLValue") & 1) != 0)
            return 1;
          ++v4;
        }
        while (v2 != v4);
        result = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v6, v10, 16);
        v2 = result;
        if (result)
          continue;
        break;
      }
    }
  }
  return result;
}

- (id)_initWithEntityMappings:(id)a3
{
  NSMappingModel *v4;
  NSMappingModel *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)NSMappingModel;
  v4 = -[NSMappingModel init](&v7, sel_init);
  v5 = v4;
  if (v4)
  {
    *(_DWORD *)&v4->_modelMappingFlags &= ~1u;
    v4->_entityMappings = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v5->_entityMappingsByName = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    if (a3)
      -[NSMappingModel setEntityMappings:](v5, "setEntityMappings:", a3);
  }
  return v5;
}

- (void)_throwIfNotEditable
{
  if (!self || (*(_BYTE *)&self->_modelMappingFlags & 1) != 0)
    objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99768], CFSTR("Can't modify an immutable mapping model."), 0));
}

@end
