@implementation NSEntityMigrationPolicy

- (BOOL)beginEntityMapping:(NSEntityMapping *)mapping manager:(NSMigrationManager *)manager error:(NSError *)error
{
  return 1;
}

- (BOOL)createDestinationInstancesForSourceInstance:(NSManagedObject *)sInstance entityMapping:(NSEntityMapping *)mapping manager:(NSMigrationManager *)manager error:(NSError *)error
{
  NSString *v10;
  NSString *v11;
  void *v12;
  NSArray *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  NSMigrationContext *migrationContext;
  void *v20;
  uint64_t v21;
  NSEntityMapping *v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v10 = -[NSEntityMapping destinationEntityName](mapping, "destinationEntityName");
  if (v10)
  {
    v10 = +[NSEntityDescription insertNewObjectForEntityForName:inManagedObjectContext:](NSEntityDescription, "insertNewObjectForEntityForName:inManagedObjectContext:", v10, -[NSMigrationManager destinationContext](manager, "destinationContext"));
    if (v10)
    {
      v11 = v10;
      v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D80]), "initWithObjectsAndKeys:", manager, CFSTR("manager"), sInstance, CFSTR("source"), v10, CFSTR("destination"), mapping, CFSTR("entityMapping"), self, CFSTR("entityPolicy"), 0);
      v24 = 0u;
      v25 = 0u;
      v26 = 0u;
      v27 = 0u;
      v23 = mapping;
      v13 = -[NSEntityMapping attributeMappings](mapping, "attributeMappings");
      v14 = -[NSArray countByEnumeratingWithState:objects:count:](v13, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
      if (v14)
      {
        v15 = v14;
        v16 = *(_QWORD *)v25;
        do
        {
          v17 = 0;
          do
          {
            if (*(_QWORD *)v25 != v16)
              objc_enumerationMutation(v13);
            v18 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * v17);
            if (manager)
              migrationContext = manager->_migrationContext;
            else
              migrationContext = 0;
            -[NSMigrationContext setCurrentPropertyMapping:]((uint64_t)migrationContext, *(void **)(*((_QWORD *)&v24 + 1) + 8 * v17));
            if (objc_msgSend(v18, "valueExpression"))
            {
              v20 = (void *)objc_msgSend(v12, "mutableCopy");
              objc_msgSend(v20, "setValue:forKey:", v18, CFSTR("propertyMapping"));
              -[NSString setValue:forKey:](v11, "setValue:forKey:", objc_msgSend((id)objc_msgSend(v18, "valueExpression"), "expressionValueWithObject:context:", 0, v20), objc_msgSend(v18, "name"));

            }
            ++v17;
          }
          while (v15 != v17);
          v21 = -[NSArray countByEnumeratingWithState:objects:count:](v13, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
          v15 = v21;
        }
        while (v21);
      }

      -[NSMigrationManager associateSourceInstance:withDestinationInstance:forEntityMapping:](manager, "associateSourceInstance:withDestinationInstance:forEntityMapping:", sInstance, v11, v23);
      LOBYTE(v10) = 1;
    }
  }
  return (char)v10;
}

- (BOOL)endInstanceCreationForEntityMapping:(NSEntityMapping *)mapping manager:(NSMigrationManager *)manager error:(NSError *)error
{
  return 1;
}

- (BOOL)createRelationshipsForDestinationInstance:(NSManagedObject *)dInstance entityMapping:(NSEntityMapping *)mapping manager:(NSMigrationManager *)manager error:(NSError *)error
{
  NSString *v10;
  NSArray *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  NSError *v18;
  BOOL result;
  id v20;
  NSArray *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  NSMigrationContext *migrationContext;
  NSEntityDescription *v28;
  uint64_t v29;
  id v30;
  id v31;
  void *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  id v38;
  uint64_t v39;
  void *v40;
  uint64_t v41;
  void *v42;
  const __CFString *v43;
  void *v44;
  void *v45;
  NSManagedObject *v46;
  NSError **v47;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  _BYTE v53[128];
  uint64_t v54;

  v54 = *MEMORY[0x1E0C80C00];
  v10 = -[NSEntityMapping name](mapping, "name");
  v11 = -[NSMigrationManager sourceInstancesForEntityMappingNamed:destinationInstances:](manager, "sourceInstancesForEntityMappingNamed:destinationInstances:", v10, objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObject:", dInstance));
  if (-[NSArray count](v11, "count"))
  {
    if (-[NSArray count](v11, "count") >= 2)
    {
      if (error)
      {
        v12 = (void *)MEMORY[0x1E0CB35C8];
        v13 = *MEMORY[0x1E0CB28A8];
        v14 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjectsAndKeys:", CFSTR("More than one source for destination in default mapping policy"), CFSTR("reason"), v11, CFSTR("source"), dInstance, CFSTR("destination"), 0);
        goto LABEL_7;
      }
      return 0;
    }
    v47 = error;
    v20 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D80]), "initWithObjectsAndKeys:", manager, CFSTR("manager"), -[NSArray objectAtIndex:](v11, "objectAtIndex:", 0), CFSTR("source"), dInstance, CFSTR("destination"), mapping, CFSTR("entityMapping"), self, CFSTR("entityPolicy"), 0);
    v49 = 0u;
    v50 = 0u;
    v51 = 0u;
    v52 = 0u;
    v21 = -[NSEntityMapping relationshipMappings](mapping, "relationshipMappings");
    v22 = -[NSArray countByEnumeratingWithState:objects:count:](v21, "countByEnumeratingWithState:objects:count:", &v49, v53, 16);
    if (!v22)
      return 1;
    v23 = v22;
    v24 = *(_QWORD *)v50;
LABEL_11:
    v25 = 0;
    while (1)
    {
      if (*(_QWORD *)v50 != v24)
        objc_enumerationMutation(v21);
      v26 = *(void **)(*((_QWORD *)&v49 + 1) + 8 * v25);
      if (manager)
        migrationContext = manager->_migrationContext;
      else
        migrationContext = 0;
      -[NSMigrationContext setCurrentPropertyMapping:]((uint64_t)migrationContext, *(void **)(*((_QWORD *)&v49 + 1) + 8 * v25));
      if (!objc_msgSend(v26, "valueExpression"))
        goto LABEL_54;
      v28 = -[NSMigrationManager destinationEntityForEntityMapping:](manager, "destinationEntityForEntityMapping:", mapping);
      v29 = objc_msgSend(v26, "name");
      if (v28)
        v30 = -[NSDictionary objectForKey:](-[NSEntityDescription propertiesByName](v28, "propertiesByName"), "objectForKey:", v29);
      else
        v30 = 0;
      v31 = (id)objc_msgSend(v20, "mutableCopy");
      objc_msgSend(v31, "setValue:forKey:", v26, CFSTR("propertyMapping"));
      v32 = (void *)objc_msgSend((id)objc_msgSend(v26, "valueExpression"), "expressionValueWithObject:context:", 0, v31);
      if (objc_msgSend(v30, "isToMany"))
      {
        if (!objc_msgSend(v30, "isOrdered"))
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              v36 = objc_msgSend(v32, "set");
              goto LABEL_52;
            }
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              v36 = objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v32);
              goto LABEL_52;
            }
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              v36 = objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", v32);
LABEL_52:
              v32 = (void *)v36;
            }
            else
            {
              if (v32)
              {
                error = v47;
                if (!v47)
                  return 0;
                v40 = (void *)MEMORY[0x1E0CB35C8];
                v41 = *MEMORY[0x1E0CB28A8];
                v42 = (void *)MEMORY[0x1E0C99D80];
                v46 = dInstance;
                v45 = v32;
                v44 = v26;
                v43 = CFSTR("Unknown/unsupported type for toMany relationship destination");
                goto LABEL_72;
              }
              v32 = (void *)NSSet_EmptySet;
            }
          }
          objc_msgSend(-[NSManagedObject mutableSetValueForKey:](dInstance, "mutableSetValueForKey:", objc_msgSend(v26, "name")), "unionSet:", v32);
          goto LABEL_54;
        }
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v33 = objc_msgSend(MEMORY[0x1E0C99E40], "orderedSetWithSet:", v32);
            goto LABEL_48;
          }
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v33 = objc_msgSend(MEMORY[0x1E0C99E40], "orderedSetWithArray:", v32);
            goto LABEL_48;
          }
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v33 = objc_msgSend(MEMORY[0x1E0C99E40], "orderedSetWithObject:", v32);
LABEL_48:
            v32 = (void *)v33;
          }
          else
          {
            if (v32)
            {
              error = v47;
              if (!v47)
                return 0;
              v40 = (void *)MEMORY[0x1E0CB35C8];
              v41 = *MEMORY[0x1E0CB28A8];
              v42 = (void *)MEMORY[0x1E0C99D80];
              v46 = dInstance;
              v45 = v32;
              v44 = v26;
              v43 = CFSTR("Unknown/unsupported type for ordered toMany relationship destination");
              goto LABEL_72;
            }
            v32 = (void *)NSOrderedSet_EmptyOrderedSet;
          }
        }
        v38 = +[_PFRoutines newOrderedSetFromCollection:byAddingItems:]((uint64_t)_PFRoutines, v32, -[NSManagedObject valueForKey:](dInstance, "valueForKey:", objc_msgSend(v26, "name")));
        -[NSManagedObject setValue:forKey:](dInstance, "setValue:forKey:", v38, objc_msgSend(v26, "name"));

        goto LABEL_54;
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v34 = objc_msgSend(v32, "count");
        if (!v34)
          goto LABEL_37;
        if (v34 != 1)
          goto LABEL_64;
        v35 = objc_msgSend(v32, "anyObject");
      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0 && v32)
            {
              error = v47;
              if (!v47)
                return 0;
              v40 = (void *)MEMORY[0x1E0CB35C8];
              v41 = *MEMORY[0x1E0CB28A8];
              v42 = (void *)MEMORY[0x1E0C99D80];
              v46 = dInstance;
              v45 = v32;
              v44 = v26;
              v43 = CFSTR("Unknown/unsupported type for toOne relationship destination");
              goto LABEL_72;
            }
            goto LABEL_38;
          }
        }
        v37 = objc_msgSend(v32, "count");
        if (!v37)
        {
LABEL_37:
          v32 = 0;
          goto LABEL_38;
        }
        if (v37 != 1)
        {
LABEL_64:
          error = v47;
          if (!v47)
            return 0;
          v40 = (void *)MEMORY[0x1E0CB35C8];
          v41 = *MEMORY[0x1E0CB28A8];
          v42 = (void *)MEMORY[0x1E0C99D80];
          v46 = dInstance;
          v45 = v32;
          v44 = v26;
          v43 = CFSTR("More than one relationship destination for a toOne relationship");
LABEL_72:
          v15 = objc_msgSend(v42, "dictionaryWithObjectsAndKeys:", v43, CFSTR("reason"), mapping, CFSTR("entityMapping"), v44, CFSTR("propertyMapping"), v45, CFSTR("relationshipDestinations"), v46, CFSTR("destination"), 0);
          v16 = v40;
          v17 = v41;
          goto LABEL_8;
        }
        v35 = objc_msgSend(v32, "lastObject");
      }
      v32 = (void *)v35;
LABEL_38:
      -[NSManagedObject setValue:forKey:](dInstance, "setValue:forKey:", v32, objc_msgSend(v26, "name"));
LABEL_54:
      if (v23 == ++v25)
      {
        v39 = -[NSArray countByEnumeratingWithState:objects:count:](v21, "countByEnumeratingWithState:objects:count:", &v49, v53, 16);
        v23 = v39;
        if (!v39)
          return 1;
        goto LABEL_11;
      }
    }
  }
  if (!error)
    return 0;
  v12 = (void *)MEMORY[0x1E0CB35C8];
  v13 = *MEMORY[0x1E0CB28A8];
  v14 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjectsAndKeys:", CFSTR("Can't find source for destination in default mapping policy"), CFSTR("reason"), v11, CFSTR("source"), dInstance, CFSTR("destination"), 0);
LABEL_7:
  v15 = v14;
  v16 = v12;
  v17 = v13;
LABEL_8:
  v18 = (NSError *)objc_msgSend(v16, "errorWithDomain:code:userInfo:", v17, 134110, v15);
  result = 0;
  *error = v18;
  return result;
}

- (BOOL)endRelationshipCreationForEntityMapping:(NSEntityMapping *)mapping manager:(NSMigrationManager *)manager error:(NSError *)error
{
  return 1;
}

- (BOOL)performCustomValidationForEntityMapping:(NSEntityMapping *)mapping manager:(NSMigrationManager *)manager error:(NSError *)error
{
  return 1;
}

- (BOOL)endEntityMapping:(NSEntityMapping *)mapping manager:(NSMigrationManager *)manager error:(NSError *)error
{
  return 1;
}

- (id)_nonNilValueOrDefaultValueForAttribute:(id)a3 source:(id)a4 destination:(id)a5
{
  id v6;
  id result;

  v6 = -[NSEntityDescription _attributeNamed:](objc_msgSend(a5, "entity"), (uint64_t)a3);
  result = (id)objc_msgSend(a4, "valueForKey:", objc_msgSend((id)objc_msgSend((id)objc_msgSend(a4, "entity"), "_propertyWithRenamingIdentifier:", objc_msgSend(v6, "renamingIdentifier")), "name"));
  if (!result)
    return (id)objc_msgSend(v6, "defaultValue");
  return result;
}

@end
