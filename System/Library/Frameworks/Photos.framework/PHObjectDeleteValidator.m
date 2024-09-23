@implementation PHObjectDeleteValidator

- (PHObjectDeleteValidator)initWithEntityName:(id)a3 managedObjectContext:(id)a4
{
  id v6;
  id v7;
  PHObjectDeleteValidator *v8;
  NSMutableSet *v9;
  NSMutableSet *deletedObjectIDs;
  uint64_t v11;
  NSEntityDescription *entity;
  objc_super v14;

  v6 = a3;
  v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)PHObjectDeleteValidator;
  v8 = -[PHObjectDeleteValidator init](&v14, sel_init);
  if (v8)
  {
    v9 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
    deletedObjectIDs = v8->_deletedObjectIDs;
    v8->_deletedObjectIDs = v9;

    PLSafeEntityForNameInManagedObjectContext();
    v11 = objc_claimAutoreleasedReturnValue();
    entity = v8->_entity;
    v8->_entity = (NSEntityDescription *)v11;

    objc_storeStrong((id *)&v8->_context, a4);
  }

  return v8;
}

- (BOOL)recordObjectID:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  BOOL v7;

  v4 = a3;
  objc_msgSend(v4, "entity");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (self->_entity && objc_msgSend(v5, "isKindOfEntity:"))
  {
    -[NSMutableSet addObject:](self->_deletedObjectIDs, "addObject:", v4);
    v7 = 1;
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (BOOL)validateForDeleteWithRequestsByObjectID:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  void *v17;
  void *v18;
  BOOL v19;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  if (-[NSMutableSet count](self->_deletedObjectIDs, "count"))
  {
    v7 = (void *)MEMORY[0x1E0C97B48];
    -[NSEntityDescription name](self->_entity, "name");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "fetchRequestWithEntityName:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("self IN %@"), self->_deletedObjectIDs);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setPredicate:", v10);

    -[NSManagedObjectContext executeFetchRequest:error:](self->_context, "executeFetchRequest:error:", v9, 0);
    v21 = 0u;
    v22 = 0u;
    v23 = 0u;
    v24 = 0u;
    v11 = (id)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    if (v12)
    {
      v13 = v12;
      v14 = *(_QWORD *)v22;
      while (2)
      {
        for (i = 0; i != v13; ++i)
        {
          if (*(_QWORD *)v22 != v14)
            objc_enumerationMutation(v11);
          v16 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * i);
          objc_msgSend(v16, "objectID");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "objectForKey:", v17);
          v18 = (void *)objc_claimAutoreleasedReturnValue();

          LODWORD(v16) = objc_msgSend(v18, "validateForDeleteManagedObject:error:", v16, a4);
          if (!(_DWORD)v16)
          {
            v19 = 0;
            goto LABEL_12;
          }
        }
        v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
        if (v13)
          continue;
        break;
      }
    }
    v19 = 1;
LABEL_12:

  }
  else
  {
    v19 = 1;
  }

  return v19;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_entity, 0);
  objc_storeStrong((id *)&self->_deletedObjectIDs, 0);
}

@end
