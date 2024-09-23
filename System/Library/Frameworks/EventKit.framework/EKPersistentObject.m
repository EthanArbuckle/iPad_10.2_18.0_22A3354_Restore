@implementation EKPersistentObject

void __64__EKPersistentObject__takeDefaultValuesForObjects_inEventStore___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  void *v4;
  id v5;
  id v6;

  v4 = *(void **)(a1 + 32);
  v5 = a3;
  objc_msgSend(v4, "registerFetchedObjectWithID:", a2);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "takeDefaultValues:", v5);

}

- (EKPersistentObject)init
{
  EKPersistentObject *v2;
  uint64_t v3;
  EKObjectID *objectID;
  objc_super v6;
  pthread_mutexattr_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v6.receiver = self;
  v6.super_class = (Class)EKPersistentObject;
  v2 = -[EKPersistentObject init](&v6, sel_init);
  if (v2)
  {
    v7.__sig = 0;
    *(_QWORD *)v7.__opaque = 0;
    pthread_mutexattr_init(&v7);
    pthread_mutexattr_settype(&v7, 2);
    pthread_mutex_init(&v2->_lock, &v7);
    +[EKObjectID temporaryObjectIDWithEntityType:](EKObjectID, "temporaryObjectIDWithEntityType:", -[EKPersistentObject entityType](v2, "entityType"));
    v3 = objc_claimAutoreleasedReturnValue();
    objectID = v2->_objectID;
    v2->_objectID = (EKObjectID *)v3;

    v2->_databaseRestoreGeneration = -1;
  }
  return v2;
}

- (void)_setObjectID:(id)a3 inDatabaseRestoreGeneration:(int)a4
{
  EKObjectID *objectID;
  EKObjectID *v8;
  EKObjectID *v9;
  void *v10;
  EKObjectID *v11;

  v11 = (EKObjectID *)a3;
  pthread_mutex_lock(&self->_lock);
  objectID = self->_objectID;
  if (objectID && !-[EKObjectID isTemporary](objectID, "isTemporary"))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("EKPersistentObject.m"), 330, CFSTR("Trying to set the object ID on an object that has one!"));

  }
  if (self->_objectID != v11)
  {
    v8 = (EKObjectID *)-[EKObjectID copy](v11, "copy");
    v9 = self->_objectID;
    self->_objectID = v8;

  }
  self->_databaseRestoreGeneration = a4;
  pthread_mutex_unlock(&self->_lock);

}

- (BOOL)isEqual:(id)a3
{
  EKPersistentObject *v4;
  EKPersistentObject *v5;
  void *v6;
  EKObjectID *v7;
  char v8;

  v4 = (EKPersistentObject *)a3;
  v5 = v4;
  if (!v4)
    goto LABEL_7;
  if (self == v4)
  {
    v8 = 1;
    goto LABEL_13;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[EKPersistentObject objectID](v5, "objectID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      pthread_mutex_lock(&self->_lock);
      v7 = self->_objectID;
      pthread_mutex_unlock(&self->_lock);
      if (v7)
        v8 = objc_msgSend(v6, "isEqual:", v7);
      else
        v8 = 0;

    }
    else
    {
      v8 = 0;
    }

  }
  else
  {
LABEL_7:
    v8 = 0;
  }
LABEL_13:

  return v8;
}

- (EKObjectID)objectID
{
  _opaque_pthread_mutex_t *p_lock;
  EKObjectID *v4;

  p_lock = &self->_lock;
  pthread_mutex_lock(&self->_lock);
  v4 = self->_objectID;
  pthread_mutex_unlock(p_lock);
  return v4;
}

- (void)_setEventStore:(id)a3
{
  id obj;

  obj = a3;
  if (obj)
  {
    pthread_mutex_lock(&self->_lock);
    objc_storeWeak((id *)&self->_eventStore, obj);
    pthread_mutex_unlock(&self->_lock);
  }
  else
  {
    objc_storeWeak((id *)&self->_eventStore, 0);
  }

}

- (id)primitiveRelationValueForKey:(id)a3
{
  id v4;
  _opaque_pthread_mutex_t *p_lock;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _BOOL4 v10;
  id v11;
  void *v12;
  void *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  uint64_t v19;
  void *v20;
  void *v21;
  objc_class *v22;
  void *v23;
  _BOOL4 v24;
  id v25;
  id WeakRetained;
  void *v28;
  void *v29;
  id v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  id v35;
  _BYTE v36[128];
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  p_lock = &self->_lock;
  pthread_mutex_lock(&self->_lock);
  -[EKPersistentObject _loadDefaultPropertiesIfNeeded](self, "_loadDefaultPropertiesIfNeeded");
  -[EKPersistentObject _propertyForKey:](self, "_propertyForKey:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6 == v7)
  {

    v6 = 0;
  }
  else if (!v6)
  {
    objc_msgSend((id)objc_opt_class(), "_relationForKey:", v4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8;
    if (v8)
    {
      if (objc_msgSend(v8, "toMany"))
      {
        v35 = 0;
        v10 = -[EKPersistentObject _loadChildIdentifiersForKey:values:](self, "_loadChildIdentifiersForKey:values:", v4, &v35);
        v11 = v35;
        v12 = v11;
        v6 = 0;
        if (v10)
        {
          if (v11)
          {
            v29 = v9;
            v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E20]), "initWithCapacity:", objc_msgSend(v11, "count"));
            v31 = 0u;
            v32 = 0u;
            v33 = 0u;
            v34 = 0u;
            v28 = v12;
            v14 = v12;
            v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v31, v36, 16);
            if (v15)
            {
              v16 = v15;
              v17 = *(_QWORD *)v32;
              do
              {
                for (i = 0; i != v16; ++i)
                {
                  if (*(_QWORD *)v32 != v17)
                    objc_enumerationMutation(v14);
                  v19 = *(_QWORD *)(*((_QWORD *)&v31 + 1) + 8 * i);
                  -[EKPersistentObject eventStore](self, "eventStore");
                  v20 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v20, "registerFetchedObjectWithID:", v19);
                  v21 = (void *)objc_claimAutoreleasedReturnValue();

                  if (v21)
                    objc_msgSend(v13, "addObject:", v21);

                }
                v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v31, v36, 16);
              }
              while (v16);
            }

            objc_msgSend(MEMORY[0x1E0C99E20], "setWithSet:", v13);
            v6 = (void *)objc_claimAutoreleasedReturnValue();
            -[EKPersistentObject _setProperty:forKey:isUpdatedProperty:](self, "_setProperty:forKey:isUpdatedProperty:", v6, v4, 0);

            v12 = v28;
            v9 = v29;
          }
          else
          {
            -[EKPersistentObject _setProperty:forKey:isUpdatedProperty:](self, "_setProperty:forKey:isUpdatedProperty:", 0, v4, 0);
            v6 = 0;
          }
        }
      }
      else
      {
        v30 = 0;
        v24 = -[EKPersistentObject _loadRelationForKey:value:](self, "_loadRelationForKey:value:", v4, &v30);
        v25 = v30;
        v12 = v25;
        v6 = 0;
        if (v24 && v25)
        {
          WeakRetained = objc_loadWeakRetained((id *)&self->_eventStore);
          objc_msgSend(WeakRetained, "registerFetchedObjectWithID:", v12);
          v6 = (void *)objc_claimAutoreleasedReturnValue();

        }
        -[EKPersistentObject _setProperty:forKey:isUpdatedProperty:](self, "_setProperty:forKey:isUpdatedProperty:", v6, v4, 0);
      }

    }
    else
    {
      v22 = (objc_class *)objc_opt_class();
      NSStringFromClass(v22);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      NSLog(CFSTR("'%@' is not a relation of '%@'"), v4, v23);

      v6 = 0;
    }

  }
  pthread_mutex_unlock(p_lock);

  return v6;
}

- (id)primitiveDateValueForKey:(id)a3
{
  _opaque_pthread_mutex_t *p_lock;
  id v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v11;
  uint64_t v12;
  id (*v13)(uint64_t, void *);
  void *v14;
  id v15;
  EKPersistentObject *v16;

  p_lock = &self->_lock;
  v5 = a3;
  pthread_mutex_lock(p_lock);
  -[EKPersistentObject _CADObjectID](self, "_CADObjectID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = MEMORY[0x1E0C809B0];
  v12 = 3221225472;
  v13 = __47__EKPersistentObject_primitiveDateValueForKey___block_invoke;
  v14 = &unk_1E4786B90;
  v15 = v6;
  v16 = self;
  v7 = v6;
  -[EKPersistentObject _primitiveValueForKey:loader:](self, "_primitiveValueForKey:loader:", v5, &v11);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = (void *)objc_msgSend(v8, "copy", v11, v12, v13, v14);
  pthread_mutex_unlock(p_lock);

  return v9;
}

- (EKEventStore)eventStore
{
  _opaque_pthread_mutex_t *p_lock;
  id WeakRetained;

  p_lock = &self->_lock;
  pthread_mutex_lock(&self->_lock);
  WeakRetained = objc_loadWeakRetained((id *)&self->_eventStore);
  pthread_mutex_unlock(p_lock);
  return (EKEventStore *)WeakRetained;
}

- (id)primitiveNumberValueForKey:(id)a3
{
  id v4;
  _opaque_pthread_mutex_t *p_lock;
  void *v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  _QWORD v12[4];
  id v13;
  EKPersistentObject *v14;
  id v15;

  v4 = a3;
  p_lock = &self->_lock;
  pthread_mutex_lock(&self->_lock);
  -[EKPersistentObject _CADObjectID](self, "_CADObjectID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __49__EKPersistentObject_primitiveNumberValueForKey___block_invoke;
  v12[3] = &unk_1E4786B40;
  v13 = v6;
  v14 = self;
  v15 = v4;
  v7 = v4;
  v8 = v6;
  -[EKPersistentObject _primitiveValueForKey:loader:](self, "_primitiveValueForKey:loader:", v7, v12);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v9, "copy");

  pthread_mutex_unlock(p_lock);
  return v10;
}

- (id)_CADObjectID
{
  return -[EKObjectID CADObjectIDWithGeneration:](self->_objectID, "CADObjectIDWithGeneration:", self->_databaseRestoreGeneration);
}

- (id)primitiveStringValueForKey:(id)a3
{
  _opaque_pthread_mutex_t *p_lock;
  id v5;
  void *v6;
  void *v7;
  _QWORD v9[5];

  p_lock = &self->_lock;
  v5 = a3;
  pthread_mutex_lock(p_lock);
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __49__EKPersistentObject_primitiveStringValueForKey___block_invoke;
  v9[3] = &unk_1E4784CB8;
  v9[4] = self;
  -[EKPersistentObject _primitiveValueForKey:loader:](self, "_primitiveValueForKey:loader:", v5, v9);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = (void *)objc_msgSend(v6, "copy");
  pthread_mutex_unlock(p_lock);
  return v7;
}

- (id)_primitiveValueForKey:(id)a3 loader:(id)a4
{
  id v6;
  void (**v7)(id, id);
  void *v8;
  void *v9;

  v6 = a3;
  v7 = (void (**)(id, id))a4;
  -[EKPersistentObject _loadDefaultPropertiesIfNeeded](self, "_loadDefaultPropertiesIfNeeded");
  -[EKPersistentObject _propertyForKey:](self, "_propertyForKey:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8 == v9)
  {

    v8 = 0;
  }
  else if (!v8)
  {
    v7[2](v7, v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[EKPersistentObject _setProperty:forKey:isUpdatedProperty:](self, "_setProperty:forKey:isUpdatedProperty:", v8, v6, 0);
  }

  return v8;
}

- (id)_propertyForKey:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  id v7;
  void *v8;

  v4 = a3;
  -[NSMutableDictionary objectForKey:](self->_updatedProperties, "objectForKey:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v5, "value");
    v6 = objc_claimAutoreleasedReturnValue();
    if (!v6)
      -[NSMutableDictionary removeObjectForKey:](self->_updatedProperties, "removeObjectForKey:", v4);

    v5 = (void *)v6;
  }
  if (v5)
  {
    v7 = v5;
  }
  else
  {
    -[EKPersistentObject _loadedPropertyForKey:](self, "_loadedPropertyForKey:", v4);
    v7 = (id)objc_claimAutoreleasedReturnValue();
  }
  v8 = v7;

  return v8;
}

- (id)_loadedPropertyForKey:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;

  v4 = a3;
  -[NSMutableDictionary objectForKey:](self->_loadedProperties, "objectForKey:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v5, "value");
    v6 = objc_claimAutoreleasedReturnValue();
    if (!v6)
      -[NSMutableDictionary removeObjectForKey:](self->_loadedProperties, "removeObjectForKey:", v4);

    v5 = (void *)v6;
  }

  return v5;
}

- (void)_loadDefaultPropertiesIfNeeded
{
  id v3;

  objc_msgSend((id)objc_opt_class(), "defaultPropertiesToLoad");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "count")
    && !-[EKPersistentObject _areDefaultPropertiesLoaded](self, "_areDefaultPropertiesLoaded"))
  {
    -[EKPersistentObject _loadPropertiesIfNeeded:](self, "_loadPropertiesIfNeeded:", v3);
  }

}

- (BOOL)_areDefaultPropertiesLoaded
{
  EKPersistentObject *v2;
  _opaque_pthread_mutex_t *p_lock;

  v2 = self;
  p_lock = &self->_lock;
  pthread_mutex_lock(&self->_lock);
  LODWORD(v2) = (v2->_flags >> 3) & 1;
  pthread_mutex_unlock(p_lock);
  return (char)v2;
}

- (BOOL)isPropertyUnavailable:(id)a3
{
  id v3;
  char v5;

  v5 = 0;
  v3 = -[EKPersistentObject loadedOrUpdatedPropertyValue:wasAvailable:](self, "loadedOrUpdatedPropertyValue:wasAvailable:", a3, &v5);
  return v5 == 0;
}

- (id)meltedObjectInStore:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[EKPersistentObject frozenObjectInStore:](self, "frozenObjectInStore:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "publicObjectWithPersistentObject:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)frozenObjectInStore:(id)a3
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;
  EKPersistentObject *v11;
  EKPersistentObject *v12;
  void *v13;
  void *v15;

  v5 = a3;
  -[EKPersistentObject eventStore](self, "eventStore");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v5 && v6 && v6 != v5)
  {
    objc_msgSend(v6, "eventStoreIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "eventStoreIdentifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v8, "isEqualToString:", v9);

    if ((v10 & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("EKPersistentObject.m"), 237, CFSTR("Cannot copy objects across different event stores backed by different databases"));

    }
    if (-[EKPersistentObject isNew](self, "isNew"))
    {
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v11 = (EKPersistentObject *)-[EKPersistentObject copy](self, "copy");
      else
        v11 = (EKPersistentObject *)objc_alloc_init((Class)objc_opt_class());
      v12 = v11;
      -[EKPersistentObject _setEventStore:](v11, "_setEventStore:", v5);
    }
    else
    {
      -[EKPersistentObject objectID](self, "objectID");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "registerFetchedObjectWithID:withDefaultLoadedPropertyKeys:values:", v13, 0, 0);
      v12 = (EKPersistentObject *)objc_claimAutoreleasedReturnValue();

    }
  }
  else
  {
    v12 = self;
  }

  return v12;
}

- (BOOL)isFrozen
{
  return 1;
}

- (void)_setProperty:(id)a3 forKey:(id)a4 isUpdatedProperty:(BOOL)a5
{
  _BOOL8 v5;
  id v8;
  id v9;
  id v10;

  v5 = a5;
  v8 = a4;
  v9 = a3;
  objc_msgSend((id)objc_opt_class(), "_relationForKey:", v8);
  v10 = (id)objc_claimAutoreleasedReturnValue();
  -[EKPersistentObject _setProperty:forKey:forRelation:isUpdatedProperty:](self, "_setProperty:forKey:forRelation:isUpdatedProperty:", v9, v8, v10, v5);

}

id __47__EKPersistentObject_primitiveDateValueForKey___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id WeakRetained;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  id v10;
  _QWORD v12[4];
  id v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  id v20;

  v3 = a2;
  v15 = 0;
  v16 = &v15;
  v17 = 0x3032000000;
  v18 = __Block_byref_object_copy__16;
  v19 = __Block_byref_object_dispose__16;
  v20 = 0;
  v4 = *(void **)(a1 + 32);
  if (v4)
  {
    if ((objc_msgSend(v4, "isTemporary") & 1) == 0)
    {
      WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 40) + 72));

      if (WeakRetained)
      {
        v6 = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 40) + 72));
        objc_msgSend(v6, "connection");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "CADOperationProxySync");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = *(_QWORD *)(a1 + 32);
        v12[0] = MEMORY[0x1E0C809B0];
        v12[1] = 3221225472;
        v12[2] = __47__EKPersistentObject_primitiveDateValueForKey___block_invoke_2;
        v12[3] = &unk_1E4786B68;
        v13 = v3;
        v14 = &v15;
        objc_msgSend(v8, "CADObject:getDatePropertyWithName:reply:", v9, v13, v12);

      }
    }
  }
  v10 = (id)v16[5];
  _Block_object_dispose(&v15, 8);

  return v10;
}

- (void)_loadPropertiesIfNeeded:(id)a3
{
  id v4;
  id v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  uint64_t v11;
  void *v12;
  void *v13;
  _BOOL4 v14;
  void *v15;
  void *v16;
  id WeakRetained;
  BOOL v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  uint64_t v23;
  _QWORD v24[4];
  id v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  uint64_t (*v30)(uint64_t, uint64_t);
  void (*v31)(uint64_t);
  id v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  _BYTE v37[128];
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (objc_msgSend(v4, "count") && !-[EKPersistentObject isNew](self, "isNew"))
  {
    v5 = v4;
    if (-[NSMutableDictionary count](self->_updatedProperties, "count")
      || -[NSMutableDictionary count](self->_loadedProperties, "count"))
    {
      objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v5, "count"));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v35 = 0u;
      v36 = 0u;
      v33 = 0u;
      v34 = 0u;
      v7 = v5;
      v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
      if (v8)
      {
        v9 = *(_QWORD *)v34;
        do
        {
          for (i = 0; i != v8; ++i)
          {
            if (*(_QWORD *)v34 != v9)
              objc_enumerationMutation(v7);
            v11 = *(_QWORD *)(*((_QWORD *)&v33 + 1) + 8 * i);
            -[NSMutableDictionary objectForKey:](self->_updatedProperties, "objectForKey:", v11);
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            if (v12)
            {

            }
            else
            {
              -[NSMutableDictionary objectForKey:](self->_loadedProperties, "objectForKey:", v11);
              v13 = (void *)objc_claimAutoreleasedReturnValue();
              v14 = v13 == 0;

              if (v14)
                objc_msgSend(v6, "addObject:", v11);
            }
          }
          v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
        }
        while (v8);
      }

    }
    else
    {
      v6 = v5;
    }
    if (objc_msgSend(v6, "count"))
    {
      v27 = 0;
      v28 = &v27;
      v29 = 0x3032000000;
      v30 = __Block_byref_object_copy__16;
      v31 = __Block_byref_object_dispose__16;
      v32 = 0;
      -[EKPersistentObject _CADObjectID](self, "_CADObjectID");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = v15;
      if (v15)
      {
        if ((objc_msgSend(v15, "isTemporary") & 1) == 0)
        {
          WeakRetained = objc_loadWeakRetained((id *)&self->_eventStore);
          v18 = WeakRetained == 0;

          if (!v18)
          {
            v19 = (void *)MEMORY[0x1A85847F4]();
            v20 = objc_loadWeakRetained((id *)&self->_eventStore);
            objc_msgSend(v20, "connection");
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v21, "CADOperationProxySync");
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            v24[0] = MEMORY[0x1E0C809B0];
            v24[1] = 3221225472;
            v24[2] = __46__EKPersistentObject__loadPropertiesIfNeeded___block_invoke;
            v24[3] = &unk_1E4786AF0;
            v25 = v16;
            v26 = &v27;
            objc_msgSend(v22, "CADObject:getPropertiesWithNames:reply:", v25, v6, v24);

            objc_autoreleasePoolPop(v19);
          }
        }
      }
      v23 = v28[5];
      if (v23)
        -[EKPersistentObject _takeValuesForDefaultPropertyKeys:values:relatedObjectValues:](self, "_takeValuesForDefaultPropertyKeys:values:relatedObjectValues:", v6, v23, 0);

      _Block_object_dispose(&v27, 8);
    }

  }
}

id __49__EKPersistentObject_primitiveNumberValueForKey___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id WeakRetained;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  id v10;
  _QWORD v12[4];
  id v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  id v20;

  v3 = a2;
  v15 = 0;
  v16 = &v15;
  v17 = 0x3032000000;
  v18 = __Block_byref_object_copy__16;
  v19 = __Block_byref_object_dispose__16;
  v20 = 0;
  v4 = *(void **)(a1 + 32);
  if (v4)
  {
    if ((objc_msgSend(v4, "isTemporary") & 1) == 0)
    {
      WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 40) + 72));

      if (WeakRetained)
      {
        v6 = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 40) + 72));
        objc_msgSend(v6, "connection");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "CADOperationProxySync");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = *(_QWORD *)(a1 + 32);
        v12[0] = MEMORY[0x1E0C809B0];
        v12[1] = 3221225472;
        v12[2] = __49__EKPersistentObject_primitiveNumberValueForKey___block_invoke_2;
        v12[3] = &unk_1E4786B18;
        v13 = *(id *)(a1 + 48);
        v14 = &v15;
        objc_msgSend(v8, "CADObject:getNumberPropertyWithName:reply:", v9, v3, v12);

      }
    }
  }
  v10 = (id)v16[5];
  _Block_object_dispose(&v15, 8);

  return v10;
}

- (BOOL)_loadChildIdentifiersForKey:(id)a3 values:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  EKEventStore **p_eventStore;
  id WeakRetained;
  id v11;
  void *v12;
  void *v13;
  char v14;
  _QWORD v16[4];
  id v17;
  uint64_t *v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t (*v23)(uint64_t, uint64_t);
  void (*v24)(uint64_t);
  id v25;
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  char v29;

  v6 = a3;
  v26 = 0;
  v27 = &v26;
  v28 = 0x2020000000;
  v29 = 0;
  v20 = 0;
  v21 = &v20;
  v22 = 0x3032000000;
  v23 = __Block_byref_object_copy__16;
  v24 = __Block_byref_object_dispose__16;
  v25 = 0;
  -[EKPersistentObject _CADObjectID](self, "_CADObjectID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
  {
    if ((objc_msgSend(v7, "isTemporary") & 1) == 0)
    {
      p_eventStore = &self->_eventStore;
      WeakRetained = objc_loadWeakRetained((id *)p_eventStore);

      if (WeakRetained)
      {
        v11 = objc_loadWeakRetained((id *)p_eventStore);
        objc_msgSend(v11, "connection");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "CADOperationProxySync");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v16[0] = MEMORY[0x1E0C809B0];
        v16[1] = 3221225472;
        v16[2] = __57__EKPersistentObject__loadChildIdentifiersForKey_values___block_invoke;
        v16[3] = &unk_1E4786C58;
        v17 = v6;
        v18 = &v20;
        v19 = &v26;
        objc_msgSend(v13, "CADObject:getRelatedObjectsWithRelationName:reply:", v8, v17, v16);

      }
    }
  }
  *a4 = objc_retainAutorelease((id)v21[5]);
  v14 = *((_BYTE *)v27 + 24);

  _Block_object_dispose(&v20, 8);
  _Block_object_dispose(&v26, 8);

  return v14;
}

uint64_t __49__EKPersistentObject_primitiveStringValueForKey___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_loadStringValueForKey:", a2);
}

- (id)_loadStringValueForKey:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  EKEventStore **p_eventStore;
  id WeakRetained;
  id v9;
  void *v10;
  void *v11;
  id v12;
  _QWORD v14[4];
  id v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, uint64_t);
  void (*v21)(uint64_t);
  id v22;

  v4 = a3;
  v17 = 0;
  v18 = &v17;
  v19 = 0x3032000000;
  v20 = __Block_byref_object_copy__16;
  v21 = __Block_byref_object_dispose__16;
  v22 = 0;
  -[EKPersistentObject _CADObjectID](self, "_CADObjectID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    if ((objc_msgSend(v5, "isTemporary") & 1) == 0)
    {
      p_eventStore = &self->_eventStore;
      WeakRetained = objc_loadWeakRetained((id *)p_eventStore);

      if (WeakRetained)
      {
        v9 = objc_loadWeakRetained((id *)p_eventStore);
        objc_msgSend(v9, "connection");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "CADOperationProxySync");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v14[0] = MEMORY[0x1E0C809B0];
        v14[1] = 3221225472;
        v14[2] = __45__EKPersistentObject__loadStringValueForKey___block_invoke;
        v14[3] = &unk_1E4786BB8;
        v15 = v4;
        v16 = &v17;
        objc_msgSend(v11, "CADObject:getStringPropertyWithName:reply:", v6, v15, v14);

      }
    }
  }
  v12 = (id)v18[5];

  _Block_object_dispose(&v17, 8);
  return v12;
}

void __54__EKPersistentObject__takeValues_relatedObjectValues___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  unint64_t v7;
  id v8;
  id v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  os_log_t *v15;
  uint64_t v16;
  void *v17;
  os_log_t *v18;
  unint64_t v19;
  id v20;
  uint64_t v21;
  id WeakRetained;
  void *v23;
  void *v24;
  NSObject *v25;
  uint64_t v26;
  NSObject *v27;
  uint64_t v28;
  uint64_t v29;
  id v30;
  id v31;
  void *v32;
  uint64_t v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  uint8_t buf[4];
  id v39;
  _BYTE v40[128];
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v7 = 0x1E0C99000uLL;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v29 = 0;
      goto LABEL_37;
    }
    objc_msgSend(MEMORY[0x1E0C99E20], "setWithCapacity:", objc_msgSend(v6, "count"));
    v10 = objc_claimAutoreleasedReturnValue();
    v34 = 0u;
    v35 = 0u;
    v36 = 0u;
    v37 = 0u;
    v8 = v6;
    v12 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v34, v40, 16);
    if (!v12)
      goto LABEL_35;
    v13 = v12;
    v31 = v5;
    v32 = (void *)v10;
    v30 = v6;
    v14 = *(_QWORD *)v35;
    v15 = (os_log_t *)&EKLogHandle;
    v33 = *(_QWORD *)v35;
LABEL_11:
    v16 = 0;
    while (1)
    {
      if (*(_QWORD *)v35 != v14)
        objc_enumerationMutation(v8);
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
        break;
      EKObjectIDFromDictionary();
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v17)
        goto LABEL_22;
      v18 = v15;
      v19 = v7;
      v20 = v8;
      v21 = a1;
      WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 72));
      objc_msgSend(WeakRetained, "registerFetchedObjectWithID:", v17);
      v23 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v23)
      {
        a1 = v21;
        v8 = v20;
        v7 = v19;
        v15 = v18;
        v14 = v33;
        goto LABEL_22;
      }
      objc_msgSend(v32, "addObject:", v23);
      a1 = v21;
      if (*(_QWORD *)(v21 + 40))
      {
        CalGetValuesFromFetchedObjectDictionary();
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v8 = v20;
        if (v24)
          objc_msgSend(*(id *)(a1 + 40), "setObject:forKeyedSubscript:", v24, v17);

      }
      else
      {
        v8 = v20;
      }
      v7 = v19;
      v15 = v18;
      v14 = v33;
LABEL_25:

      if (v13 == ++v16)
      {
        v26 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v34, v40, 16);
        v13 = v26;
        if (!v26)
        {
          v5 = v31;
          v10 = (uint64_t)v32;
          v6 = v30;
          goto LABEL_35;
        }
        goto LABEL_11;
      }
    }
    v17 = 0;
LABEL_22:
    v25 = *v15;
    if (os_log_type_enabled(*v15, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v39 = v31;
      _os_log_error_impl(&dword_1A2318000, v25, OS_LOG_TYPE_ERROR, "Failed to take value for related object with key %@", buf, 0xCu);
    }
    v23 = 0;
    goto LABEL_25;
  }
  EKObjectIDFromDictionary();
  v8 = (id)objc_claimAutoreleasedReturnValue();
  if (v8
    && (v9 = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 72)),
        objc_msgSend(v9, "registerFetchedObjectWithID:", v8),
        v10 = objc_claimAutoreleasedReturnValue(),
        v9,
        v10))
  {
    if (*(_QWORD *)(a1 + 40))
    {
      CalGetValuesFromFetchedObjectDictionary();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      if (v11)
        objc_msgSend(*(id *)(a1 + 40), "setObject:forKeyedSubscript:", v11, v8);

    }
  }
  else
  {
    v27 = EKLogHandle;
    if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_ERROR))
      __54__EKPersistentObject__takeValues_relatedObjectValues___block_invoke_cold_1((uint64_t)v5, v27, v28);
    v10 = 0;
  }
LABEL_35:

  v29 = 1;
  v6 = (id)v10;
LABEL_37:
  if (!*(_BYTE *)(a1 + 48) || (objc_msgSend(*(id *)(a1 + 32), "isPropertyLoaded:", v5) & 1) == 0)
    objc_msgSend(*(id *)(a1 + 32), "_setProperty:forKey:isRelation:isUpdatedProperty:", v6, v5, v29, 0);

}

- (void)_setProperty:(id)a3 forKey:(id)a4 isRelation:(BOOL)a5 isUpdatedProperty:(BOOL)a6
{
  _BOOL8 v6;
  _BOOL4 v7;
  id v10;
  void *v11;
  id v12;

  v6 = a6;
  v7 = a5;
  v12 = a3;
  v10 = a4;
  if (v7)
  {
    objc_msgSend((id)objc_opt_class(), "_relationForKey:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v11 = 0;
  }
  -[EKPersistentObject _setProperty:forKey:forRelation:isUpdatedProperty:](self, "_setProperty:forKey:forRelation:isUpdatedProperty:", v12, v10, v11, v6);

}

- (void)_setProperty:(id)a3 forKey:(id)a4 forRelation:(id)a5 isUpdatedProperty:(BOOL)a6
{
  _BOOL4 v6;
  id v10;
  id v11;
  uint64_t v12;
  EKWeakReference *v13;
  id v14;
  id v15;

  v6 = a6;
  v14 = a3;
  v10 = a4;
  v11 = a5;
  v12 = (uint64_t)v14;
  if (v14)
  {
    if (v11)
    {
      if ((objc_msgSend(v11, "ownsRelatedObject") & 1) != 0)
      {
        v12 = (uint64_t)v14;
      }
      else
      {
        v13 = -[EKWeakReference initWithValue:]([EKWeakReference alloc], "initWithValue:", v14);

        v12 = (uint64_t)v13;
      }
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v12 = objc_claimAutoreleasedReturnValue();
  }
  v15 = (id)v12;
  if (v6)
  {
    -[EKPersistentObject _createUpdatedPropertiesIfNeeded](self, "_createUpdatedPropertiesIfNeeded");
    -[NSMutableDictionary setObject:forKey:](self->_updatedProperties, "setObject:forKey:", v15, v10);
    -[EKPersistentObject changed](self, "changed");
  }
  else
  {
    -[EKPersistentObject _createLoadedPropertiesIfNeeded](self, "_createLoadedPropertiesIfNeeded");
    -[NSMutableDictionary setObject:forKey:](self->_loadedProperties, "setObject:forKey:", v15, v10);
  }

}

- (void)_createLoadedPropertiesIfNeeded
{
  NSMutableDictionary *v3;
  NSMutableDictionary *loadedProperties;

  if (!self->_loadedProperties)
  {
    v3 = (NSMutableDictionary *)objc_opt_new();
    loadedProperties = self->_loadedProperties;
    self->_loadedProperties = v3;

  }
}

- (BOOL)primitiveBoolValueForKey:(id)a3
{
  void *v3;
  char v4;

  -[EKPersistentObject primitiveNumberValueForKey:](self, "primitiveNumberValueForKey:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "BOOLValue");

  return v4;
}

- (int)primitiveIntValueForKey:(id)a3
{
  void *v3;
  int v4;

  -[EKPersistentObject primitiveNumberValueForKey:](self, "primitiveNumberValueForKey:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "intValue");

  return v4;
}

- (BOOL)_isNew
{
  _opaque_pthread_mutex_t *p_lock;
  EKObjectID *objectID;
  char v5;

  p_lock = &self->_lock;
  pthread_mutex_lock(&self->_lock);
  objectID = self->_objectID;
  if (objectID)
    v5 = -[EKObjectID isTemporary](objectID, "isTemporary");
  else
    v5 = 1;
  pthread_mutex_unlock(p_lock);
  return v5;
}

+ (id)_relationForKey:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  objc_msgSend(a1, "relations");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)takeDefaultValues:(id)a3
{
  _opaque_pthread_mutex_t *p_lock;
  id v5;

  p_lock = &self->_lock;
  v5 = a3;
  pthread_mutex_lock(p_lock);
  -[EKPersistentObject _takeValues:relatedObjectValues:](self, "_takeValues:relatedObjectValues:", v5, 0);

  -[EKPersistentObject _setDefaultPropertiesLoaded:](self, "_setDefaultPropertiesLoaded:", 1);
  pthread_mutex_unlock(p_lock);
}

- (void)_takeValues:(id)a3 forKeys:(id)a4 relatedObjectValues:(id)a5
{
  void *v8;
  id v9;
  id v10;

  if (a3)
  {
    v8 = (void *)MEMORY[0x1E0C99D80];
    v9 = a5;
    objc_msgSend(v8, "dictionaryWithObjects:forKeys:", a3, a4);
    v10 = (id)objc_claimAutoreleasedReturnValue();
    -[EKPersistentObject _takeValues:relatedObjectValues:](self, "_takeValues:relatedObjectValues:", v10, v9);

  }
}

- (void)_takeValues:(id)a3 relatedObjectValues:(id)a4
{
  id v6;
  BOOL v7;
  id v8;
  _QWORD v9[5];
  id v10;
  BOOL v11;

  v6 = a4;
  if (a3)
  {
    v7 = self->_loadedProperties != 0;
    v9[1] = 3221225472;
    v9[2] = __54__EKPersistentObject__takeValues_relatedObjectValues___block_invoke;
    v9[3] = &unk_1E4786CA8;
    v9[4] = self;
    v8 = v6;
    v9[0] = MEMORY[0x1E0C809B0];
    v10 = v6;
    v11 = v7;
    objc_msgSend(a3, "enumerateKeysAndObjectsUsingBlock:", v9);

    v6 = v8;
  }

}

- (void)takeValuesForDefaultPropertyKeys:(id)a3 values:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;

  v6 = a4;
  v7 = a3;
  v10 = (id)objc_opt_new();
  pthread_mutex_lock(&self->_lock);
  -[EKPersistentObject _takeValuesForDefaultPropertyKeys:values:relatedObjectValues:](self, "_takeValuesForDefaultPropertyKeys:values:relatedObjectValues:", v7, v6, v10);

  pthread_mutex_unlock(&self->_lock);
  v8 = (void *)objc_opt_class();
  -[EKPersistentObject eventStore](self, "eventStore");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "_takeDefaultValuesForObjects:inEventStore:", v10, v9);

}

- (void)_setDefaultPropertiesLoaded:(BOOL)a3
{
  _BOOL4 v3;
  _opaque_pthread_mutex_t *p_lock;
  int v6;

  v3 = a3;
  p_lock = &self->_lock;
  pthread_mutex_lock(&self->_lock);
  if (v3)
    v6 = 8;
  else
    v6 = 0;
  self->_flags = self->_flags & 0xFFFFFFF7 | v6;
  pthread_mutex_unlock(p_lock);
}

- (void)_takeValuesForDefaultPropertyKeys:(id)a3 values:(id)a4 relatedObjectValues:(id)a5
{
  -[EKPersistentObject _takeValues:forKeys:relatedObjectValues:](self, "_takeValues:forKeys:relatedObjectValues:", a4, a3, a5);
  if (a4)
    -[EKPersistentObject _setDefaultPropertiesLoaded:](self, "_setDefaultPropertiesLoaded:", 1);
}

+ (void)_takeDefaultValuesForObjects:(id)a3 inEventStore:(id)a4
{
  id v5;
  id v6;
  _QWORD v7[4];
  id v8;

  v5 = a4;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __64__EKPersistentObject__takeDefaultValuesForObjects_inEventStore___block_invoke;
  v7[3] = &unk_1E4786C80;
  v8 = v5;
  v6 = v5;
  objc_msgSend(a3, "enumerateKeysAndObjectsUsingBlock:", v7);

}

- (CADGenerationStampedObjectID)CADObjectID
{
  _opaque_pthread_mutex_t *p_lock;
  void *v4;

  p_lock = &self->_lock;
  pthread_mutex_lock(&self->_lock);
  -[EKPersistentObject _CADObjectID](self, "_CADObjectID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  pthread_mutex_unlock(p_lock);
  return (CADGenerationStampedObjectID *)v4;
}

void __47__EKPersistentObject_primitiveDateValueForKey___block_invoke_2(uint64_t a1, int a2, void *a3)
{
  id v6;

  v6 = a3;
  if (a2)
  {
    if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_ERROR))
      __47__EKPersistentObject_primitiveDateValueForKey___block_invoke_2_cold_1();
  }
  else
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a3);
  }

}

void __46__EKPersistentObject__loadPropertiesIfNeeded___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  id v9;
  id v10;

  v5 = a3;
  v10 = v5;
  if ((_DWORD)a2)
  {
    v6 = *(_QWORD *)(a1 + 32);
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithCADResult:", a2);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    NSLog(CFSTR("Error loading properties for object %@ from daemon: %@"), v6, v7);
  }
  else
  {
    v8 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v9 = v5;
    v7 = *(void **)(v8 + 40);
    *(_QWORD *)(v8 + 40) = v9;
  }

}

void __49__EKPersistentObject_primitiveNumberValueForKey___block_invoke_2(uint64_t a1, int a2, void *a3)
{
  id v6;

  v6 = a3;
  if (a2)
  {
    if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_ERROR))
      __49__EKPersistentObject_primitiveNumberValueForKey___block_invoke_2_cold_1();
  }
  else
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a3);
  }

}

void __45__EKPersistentObject__loadStringValueForKey___block_invoke(uint64_t a1, int a2, void *a3)
{
  id v6;

  v6 = a3;
  if (a2)
  {
    if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_ERROR))
      __45__EKPersistentObject__loadStringValueForKey___block_invoke_cold_1();
  }
  else
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a3);
  }

}

void __57__EKPersistentObject__loadChildIdentifiersForKey_values___block_invoke(uint64_t a1, int a2, void *a3)
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (a2)
  {
    if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_ERROR))
      __57__EKPersistentObject__loadChildIdentifiersForKey_values___block_invoke_cold_1();
  }
  else
  {
    v6 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99E20]), "initWithCapacity:", objc_msgSend(v5, "count"));
    v7 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v8 = *(void **)(v7 + 40);
    *(_QWORD *)(v7 + 40) = v6;

    v18 = 0u;
    v19 = 0u;
    v16 = 0u;
    v17 = 0u;
    v9 = v5;
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v17;
      do
      {
        v13 = 0;
        do
        {
          if (*(_QWORD *)v17 != v12)
            objc_enumerationMutation(v9);
          v14 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
          +[EKObjectID objectIDWithCADObjectID:](EKObjectID, "objectIDWithCADObjectID:", *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * v13), (_QWORD)v16);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "addObject:", v15);

          ++v13;
        }
        while (v11 != v13);
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      }
      while (v11);
    }

    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 1;
  }

}

+ (id)defaultPropertiesToLoad
{
  return (id)objc_msgSend(MEMORY[0x1E0C99D20], "array");
}

+ (id)relations
{
  objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", CFSTR("+[EKPersistentObject relations] not implemented in subclass"), CFSTR("Subclass %@ of EKPersistentObject did not implement +relations"), objc_opt_class());
  return 0;
}

- (void)dealloc
{
  objc_super v3;

  pthread_mutex_destroy(&self->_lock);
  v3.receiver = self;
  v3.super_class = (Class)EKPersistentObject;
  -[EKPersistentObject dealloc](&v3, sel_dealloc);
}

+ (Class)alternateUniverseClass
{
  NSObject *v4;

  +[EKReminderStore log](EKReminderStore, "log");
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    +[EKPersistentObject alternateUniverseClass].cold.1((objc_class *)a1, v4);

  objc_msgSend(a1, "doesNotRecognizeSelector:", a2);
  objc_opt_class();
  return (Class)(id)objc_claimAutoreleasedReturnValue();
}

- (BOOL)canBeConvertedToFullObject
{
  return 0;
}

- (BOOL)isPartialObject
{
  return 0;
}

- (id)preFrozenRelationshipObjects
{
  return 0;
}

- (id)loadedOrUpdatedPropertyValue:(id)a3 wasAvailable:(BOOL *)a4
{
  _opaque_pthread_mutex_t *p_lock;
  id v7;
  void *v8;
  void *v9;

  p_lock = &self->_lock;
  v7 = a3;
  pthread_mutex_lock(p_lock);
  -[EKPersistentObject _propertyForKey:](self, "_propertyForKey:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  pthread_mutex_unlock(p_lock);
  if (a4)
    *a4 = v8 != 0;
  objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8 == v9)
  {

    v8 = 0;
  }
  return v8;
}

+ (id)propertiesUnavailableForPartialObjects
{
  return 0;
}

+ (id)propertyKeyForUniqueIdentifier
{
  return CFSTR("uniqueIdentifier");
}

- (NSString)uniqueIdentifier
{
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend((id)objc_opt_class(), "propertyKeyForUniqueIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "isEqualToString:", CFSTR("uniqueIdentifier")))
  {
    -[EKPersistentObject objectID](self, "objectID");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "stringRepresentation");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    -[EKPersistentObject valueForKey:](self, "valueForKey:", v3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return (NSString *)v5;
}

- (id)changeSet
{
  return 0;
}

- (id)existingMeltedObject
{
  return 0;
}

- (Class)frozenClass
{
  return (Class)objc_msgSend((id)objc_opt_class(), "frozenClass");
}

- (BOOL)isCompletelyEqual:(id)a3
{
  -[EKPersistentObject doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
  return 0;
}

- (BOOL)isEqual:(id)a3 ignoringProperties:(id)a4
{
  -[EKPersistentObject doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2, a4);
  return 0;
}

+ (id)_createNonPartialObjectFromObject:(id)a3 ifPropertyIsUnavailable:(id)a4
{
  return 0;
}

- (int)databaseRestoreGeneration
{
  EKPersistentObject *v2;
  _opaque_pthread_mutex_t *p_lock;

  v2 = self;
  p_lock = &self->_lock;
  pthread_mutex_lock(&self->_lock);
  LODWORD(v2) = v2->_databaseRestoreGeneration;
  pthread_mutex_unlock(p_lock);
  return (int)v2;
}

- (BOOL)existsInStore
{
  _opaque_pthread_mutex_t *p_lock;
  void *v4;
  id WeakRetained;
  void *v6;
  void *v7;
  char v8;
  _QWORD v10[4];
  id v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  char v16;

  v13 = 0;
  v14 = &v13;
  v15 = 0x2020000000;
  v16 = 0;
  p_lock = &self->_lock;
  pthread_mutex_lock(&self->_lock);
  -[EKPersistentObject _CADObjectID](self, "_CADObjectID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  WeakRetained = objc_loadWeakRetained((id *)&self->_eventStore);
  pthread_mutex_unlock(p_lock);
  if (WeakRetained && v4 && (objc_msgSend(v4, "isTemporary") & 1) == 0)
  {
    objc_msgSend(WeakRetained, "connection");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "CADOperationProxySync");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __35__EKPersistentObject_existsInStore__block_invoke;
    v10[3] = &unk_1E4786AC8;
    v11 = v4;
    v12 = &v13;
    objc_msgSend(v7, "CADObjectExists:reply:", v11, v10);

  }
  v8 = *((_BYTE *)v14 + 24);

  _Block_object_dispose(&v13, 8);
  return v8;
}

void __35__EKPersistentObject_existsInStore__block_invoke(uint64_t a1, uint64_t a2, char a3)
{
  uint64_t v3;
  id v4;

  if ((_DWORD)a2)
  {
    v3 = *(_QWORD *)(a1 + 32);
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithCADResult:", a2);
    v4 = (id)objc_claimAutoreleasedReturnValue();
    NSLog(CFSTR("Error checking whether object %@ exists: %@"), v3, v4);

  }
  else
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = a3;
  }
}

- (BOOL)isDirty
{
  EKPersistentObject *v2;
  _opaque_pthread_mutex_t *p_lock;

  v2 = self;
  p_lock = &self->_lock;
  pthread_mutex_lock(&self->_lock);
  LOBYTE(v2) = -[NSMutableDictionary count](v2->_updatedProperties, "count") != 0;
  pthread_mutex_unlock(p_lock);
  return (char)v2;
}

- (void)changed
{
  _opaque_pthread_mutex_t *p_lock;
  EKObjectID *objectID;
  id WeakRetained;

  p_lock = &self->_lock;
  pthread_mutex_lock(&self->_lock);
  objectID = self->_objectID;
  if (objectID
    && !-[EKObjectID isTemporary](objectID, "isTemporary")
    && !-[EKPersistentObject _isPendingUpdate](self, "_isPendingUpdate")
    && !-[EKPersistentObject _isPendingInsert](self, "_isPendingInsert")
    && !-[EKPersistentObject _isPendingDelete](self, "_isPendingDelete"))
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_eventStore);
    objc_msgSend(WeakRetained, "_trackModifiedObject:", self);

  }
  pthread_mutex_unlock(p_lock);
}

- (id)_loadedPropertyKeys
{
  return (id)-[NSMutableDictionary allKeys](self->_loadedProperties, "allKeys");
}

- (BOOL)refresh
{
  _opaque_pthread_mutex_t *p_lock;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  uint64_t v12;
  void *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  p_lock = &self->_lock;
  pthread_mutex_lock(&self->_lock);
  -[EKPersistentObject _loadedPropertyKeys](self, "_loadedPropertyKeys");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "propertyKeyForUniqueIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](self->_loadedProperties, "objectForKeyedSubscript:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v7 = v4;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v16 != v10)
          objc_enumerationMutation(v7);
        v12 = *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * i);
        -[NSMutableDictionary objectForKey:](self->_updatedProperties, "objectForKey:", v12, (_QWORD)v15);
        v13 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v13)
          -[EKPersistentObject unloadPropertyForKey:](self, "unloadPropertyForKey:", v12);
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v9);
  }

  if (v6)
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_loadedProperties, "setObject:forKeyedSubscript:", v6, v5);
  pthread_mutex_unlock(p_lock);

  return 1;
}

- (BOOL)isPropertyDirty:(id)a3
{
  _opaque_pthread_mutex_t *p_lock;
  id v5;
  void *v6;

  p_lock = &self->_lock;
  v5 = a3;
  pthread_mutex_lock(p_lock);
  -[NSMutableDictionary objectForKey:](self->_updatedProperties, "objectForKey:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  pthread_mutex_unlock(p_lock);
  return v6 != 0;
}

- (BOOL)isPropertyLoaded:(id)a3
{
  _opaque_pthread_mutex_t *p_lock;
  id v5;
  void *v6;

  p_lock = &self->_lock;
  v5 = a3;
  pthread_mutex_lock(p_lock);
  -[EKPersistentObject _loadedPropertyForKey:](self, "_loadedPropertyForKey:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  pthread_mutex_unlock(p_lock);
  return v6 != 0;
}

- (id)dirtyPropertiesAndValues
{
  _opaque_pthread_mutex_t *p_lock;
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  id WeakRetained;
  void *v19;
  pthread_mutex_t *v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  p_lock = &self->_lock;
  pthread_mutex_lock(&self->_lock);
  v4 = (id)-[NSMutableDictionary count](self->_updatedProperties, "count");
  if (!v4)
    goto LABEL_21;
  v21 = p_lock;
  v4 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", v4);
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  -[NSMutableDictionary allKeys](self->_updatedProperties, "allKeys");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
  if (!v6)
    goto LABEL_16;
  v7 = v6;
  v8 = *(_QWORD *)v23;
  do
  {
    for (i = 0; i != v7; ++i)
    {
      if (*(_QWORD *)v23 != v8)
        objc_enumerationMutation(v5);
      v10 = *(_QWORD *)(*((_QWORD *)&v22 + 1) + 8 * i);
      -[EKPersistentObject _propertyForKey:](self, "_propertyForKey:", v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      if (v11)
      {
        objc_msgSend((id)objc_opt_class(), "_relationForKey:", v10);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = v12;
        if (v12)
        {
          if ((objc_msgSend(v12, "toMany") & 1) != 0)
          {
LABEL_13:

            goto LABEL_14;
          }
          objc_msgSend(MEMORY[0x1E0C99E38], "null");
          v14 = (void *)objc_claimAutoreleasedReturnValue();

          if (v11 != v14)
          {
            objc_msgSend(v11, "CADObjectID");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v4, "setObject:forKey:", v15, v10);

            goto LABEL_13;
          }
        }
        objc_msgSend(v4, "setObject:forKey:", v11, v10);
        goto LABEL_13;
      }
LABEL_14:

    }
    v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
  }
  while (v7);
LABEL_16:

  if (!objc_msgSend(v4, "count"))
  {
    p_lock = v21;
    goto LABEL_21;
  }
  -[EKPersistentObject objectID](self, "objectID");
  v16 = objc_claimAutoreleasedReturnValue();
  p_lock = v21;
  if (!v16)
  {
LABEL_21:
    pthread_mutex_unlock(p_lock);
    goto LABEL_22;
  }
  v17 = (void *)v16;
  WeakRetained = objc_loadWeakRetained((id *)&self->_eventStore);

  pthread_mutex_unlock(v21);
  if (!WeakRetained)
  {
LABEL_22:
    v19 = 0;
    goto LABEL_23;
  }
  v4 = v4;
  v19 = v4;
LABEL_23:

  return v19;
}

+ (id)propertiesToUnloadOnCommit
{
  if (propertiesToUnloadOnCommit_onceToken_1 != -1)
    dispatch_once(&propertiesToUnloadOnCommit_onceToken_1, &__block_literal_global_54);
  return (id)propertiesToUnloadOnCommit_propertiesToUnloadOnCommit_1;
}

void __48__EKPersistentObject_propertiesToUnloadOnCommit__block_invoke()
{
  uint64_t v0;
  void *v1;
  _QWORD v2[2];

  v2[1] = *MEMORY[0x1E0C80C00];
  v2[0] = *MEMORY[0x1E0D0B838];
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v2, 1);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)propertiesToUnloadOnCommit_propertiesToUnloadOnCommit_1;
  propertiesToUnloadOnCommit_propertiesToUnloadOnCommit_1 = v0;

}

- (void)didCommit
{
  _opaque_pthread_mutex_t *p_lock;
  NSHashTable *coCommitObjects;
  NSMutableDictionary *updatedProperties;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  p_lock = &self->_lock;
  pthread_mutex_lock(&self->_lock);
  coCommitObjects = self->_coCommitObjects;
  self->_coCommitObjects = 0;

  -[NSMutableDictionary addEntriesFromDictionary:](self->_loadedProperties, "addEntriesFromDictionary:", self->_updatedProperties);
  updatedProperties = self->_updatedProperties;
  self->_updatedProperties = 0;

  pthread_mutex_unlock(p_lock);
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  objc_msgSend((id)objc_opt_class(), "propertiesToUnloadOnCommit", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v12;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v12 != v9)
          objc_enumerationMutation(v6);
        -[EKPersistentObject unloadPropertyForKey:](self, "unloadPropertyForKey:", *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * v10++));
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v8);
  }

}

- (void)reset
{
  -[EKPersistentObject reset:](self, "reset:", 0);
}

- (void)reset:(id)a3
{
  id v4;
  NSMutableDictionary *updatedProperties;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  NSHashTable *v10;
  uint64_t v11;
  NSHashTable *coCommitObjects;
  id WeakRetained;
  NSHashTable *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  pthread_mutex_lock(&self->_lock);
  if (objc_msgSend(v4, "containsObject:", self->_objectID))
  {
    pthread_mutex_unlock(&self->_lock);
  }
  else
  {
    -[EKPersistentObject _releaseLoadedProperties](self, "_releaseLoadedProperties");
    updatedProperties = self->_updatedProperties;
    objc_msgSend((id)objc_opt_class(), "propertyKeyForUniqueIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary objectForKeyedSubscript:](updatedProperties, "objectForKeyedSubscript:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      -[EKPersistentObject uniqueIdentifier](self, "uniqueIdentifier");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableDictionary removeAllObjects](self->_updatedProperties, "removeAllObjects");
      if (v8)
      {
        objc_msgSend((id)objc_opt_class(), "propertyKeyForUniqueIdentifier");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        -[EKPersistentObject setValue:forKey:](self, "setValue:forKey:", v8, v9);

      }
    }
    else
    {
      -[NSMutableDictionary removeAllObjects](self->_updatedProperties, "removeAllObjects");
    }
    -[EKPersistentObject _setDefaultPropertiesLoaded:](self, "_setDefaultPropertiesLoaded:", 0);
    v10 = self->_coCommitObjects;
    v11 = -[NSHashTable count](v10, "count");
    if (v11)
    {
      if (!v4)
      {
        objc_msgSend(MEMORY[0x1E0C99E20], "setWithCapacity:", v11 + 1);
        v4 = (id)objc_claimAutoreleasedReturnValue();
      }
      objc_msgSend(v4, "addObject:", self->_objectID);
      coCommitObjects = self->_coCommitObjects;
      self->_coCommitObjects = 0;

    }
    -[EKPersistentObject _setPendingUpdate:](self, "_setPendingUpdate:", 0);
    WeakRetained = objc_loadWeakRetained((id *)&self->_eventStore);
    pthread_mutex_unlock(&self->_lock);
    objc_msgSend(WeakRetained, "_objectDidReset:", self);
    v21 = 0u;
    v22 = 0u;
    v19 = 0u;
    v20 = 0u;
    v14 = v10;
    v15 = -[NSHashTable countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    if (v15)
    {
      v16 = v15;
      v17 = *(_QWORD *)v20;
      do
      {
        v18 = 0;
        do
        {
          if (*(_QWORD *)v20 != v17)
            objc_enumerationMutation(v14);
          objc_msgSend(*(id *)(*((_QWORD *)&v19 + 1) + 8 * v18++), "reset:", v4, (_QWORD)v19);
        }
        while (v16 != v18);
        v16 = -[NSHashTable countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
      }
      while (v16);
    }

  }
}

- (void)rollback
{
  _opaque_pthread_mutex_t *p_lock;

  p_lock = &self->_lock;
  pthread_mutex_lock(&self->_lock);
  -[NSHashTable removeAllObjects](self->_coCommitObjects, "removeAllObjects");
  -[NSMutableDictionary removeAllObjects](self->_updatedProperties, "removeAllObjects");
  -[EKPersistentObject _setPendingUpdate:](self, "_setPendingUpdate:", 0);
  pthread_mutex_unlock(p_lock);
}

- (void)_setPendingInsert:(BOOL)a3
{
  _BOOL4 v3;
  _opaque_pthread_mutex_t *p_lock;

  v3 = a3;
  p_lock = &self->_lock;
  pthread_mutex_lock(&self->_lock);
  self->_flags = self->_flags & 0xFFFFFFFE | v3;
  pthread_mutex_unlock(p_lock);
}

- (BOOL)_isPendingInsert
{
  EKPersistentObject *v2;
  _opaque_pthread_mutex_t *p_lock;

  v2 = self;
  p_lock = &self->_lock;
  pthread_mutex_lock(&self->_lock);
  LODWORD(v2) = v2->_flags & 1;
  pthread_mutex_unlock(p_lock);
  return (char)v2;
}

- (void)_setPendingUpdate:(BOOL)a3
{
  _BOOL4 v3;
  _opaque_pthread_mutex_t *p_lock;
  int v6;

  v3 = a3;
  p_lock = &self->_lock;
  pthread_mutex_lock(&self->_lock);
  if (v3)
    v6 = 2;
  else
    v6 = 0;
  self->_flags = self->_flags & 0xFFFFFFFD | v6;
  pthread_mutex_unlock(p_lock);
}

- (BOOL)_isPendingUpdate
{
  EKPersistentObject *v2;
  _opaque_pthread_mutex_t *p_lock;

  v2 = self;
  p_lock = &self->_lock;
  pthread_mutex_lock(&self->_lock);
  LODWORD(v2) = (v2->_flags >> 1) & 1;
  pthread_mutex_unlock(p_lock);
  return (char)v2;
}

- (void)_setPendingDelete:(BOOL)a3
{
  _BOOL4 v3;
  _opaque_pthread_mutex_t *p_lock;
  int v6;

  v3 = a3;
  p_lock = &self->_lock;
  pthread_mutex_lock(&self->_lock);
  if (v3)
    v6 = 4;
  else
    v6 = 0;
  self->_flags = self->_flags & 0xFFFFFFFB | v6;
  pthread_mutex_unlock(p_lock);
}

- (BOOL)_isPendingDelete
{
  EKPersistentObject *v2;
  _opaque_pthread_mutex_t *p_lock;

  v2 = self;
  p_lock = &self->_lock;
  pthread_mutex_lock(&self->_lock);
  LODWORD(v2) = (v2->_flags >> 2) & 1;
  pthread_mutex_unlock(p_lock);
  return (char)v2;
}

+ (BOOL)_shouldRetainPropertyForKey:(id)a3
{
  void *v3;
  void *v4;
  char v5;

  objc_msgSend(a1, "_relationForKey:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
    v5 = objc_msgSend(v3, "ownsRelatedObject");
  else
    v5 = 1;

  return v5;
}

- (id)coCommitObjects
{
  _opaque_pthread_mutex_t *p_lock;
  void *v4;

  p_lock = &self->_lock;
  pthread_mutex_lock(&self->_lock);
  -[NSHashTable allObjects](self->_coCommitObjects, "allObjects");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  pthread_mutex_unlock(p_lock);
  return v4;
}

- (void)addCoCommitObject:(id)a3
{
  id v4;

  if (a3)
  {
    v4 = a3;
    -[EKPersistentObject internalAddCoCommitObject:](self, "internalAddCoCommitObject:", v4);
    objc_msgSend(v4, "internalAddCoCommitObject:", self);

  }
}

- (void)internalAddCoCommitObject:(id)a3
{
  NSHashTable *coCommitObjects;
  NSHashTable *v5;
  NSHashTable *v6;
  id v7;

  v7 = a3;
  pthread_mutex_lock(&self->_lock);
  coCommitObjects = self->_coCommitObjects;
  if (!coCommitObjects)
  {
    v5 = (NSHashTable *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3690]), "initWithOptions:capacity:", 5, 1);
    v6 = self->_coCommitObjects;
    self->_coCommitObjects = v5;

    coCommitObjects = self->_coCommitObjects;
  }
  -[NSHashTable addObject:](coCommitObjects, "addObject:", v7);
  pthread_mutex_unlock(&self->_lock);

}

- (void)removeCoCommitObject:(id)a3
{
  id v4;

  if (a3)
  {
    v4 = a3;
    -[EKPersistentObject internalRemoveCoCommitObject:](self, "internalRemoveCoCommitObject:", v4);
    objc_msgSend(v4, "internalRemoveCoCommitObject:", self);

  }
}

- (void)internalRemoveCoCommitObject:(id)a3
{
  _opaque_pthread_mutex_t *p_lock;
  id v5;

  p_lock = &self->_lock;
  v5 = a3;
  pthread_mutex_lock(p_lock);
  -[NSHashTable removeObject:](self->_coCommitObjects, "removeObject:", v5);

  pthread_mutex_unlock(p_lock);
}

- (id)loadedPropertyForKey:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id WeakRetained;
  BOOL v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  _QWORD v18[4];
  id v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t (*v24)(uint64_t, uint64_t);
  void (*v25)(uint64_t);
  id v26;
  id v27;
  uint64_t v28;
  _QWORD v29[2];

  v29[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  pthread_mutex_lock(&self->_lock);
  -[EKPersistentObject _loadDefaultPropertiesIfNeeded](self, "_loadDefaultPropertiesIfNeeded");
  -[EKPersistentObject _loadedPropertyForKey:](self, "_loadedPropertyForKey:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    -[EKPersistentObject _CADObjectID](self, "_CADObjectID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    v21 = 0;
    v22 = &v21;
    v23 = 0x3032000000;
    v24 = __Block_byref_object_copy__16;
    v25 = __Block_byref_object_dispose__16;
    v26 = 0;
    if (v6)
    {
      if ((objc_msgSend(v6, "isTemporary") & 1) == 0)
      {
        WeakRetained = objc_loadWeakRetained((id *)&self->_eventStore);
        v9 = WeakRetained == 0;

        if (!v9)
        {
          v10 = (void *)MEMORY[0x1A85847F4]();
          v11 = objc_loadWeakRetained((id *)&self->_eventStore);
          objc_msgSend(v11, "connection");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "CADOperationProxySync");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v29[0] = v4;
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v29, 1);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v18[0] = MEMORY[0x1E0C809B0];
          v18[1] = 3221225472;
          v18[2] = __43__EKPersistentObject_loadedPropertyForKey___block_invoke;
          v18[3] = &unk_1E4786AF0;
          v19 = v7;
          v20 = &v21;
          objc_msgSend(v13, "CADObject:getPropertiesWithNames:reply:", v19, v14, v18);

          objc_autoreleasePoolPop(v10);
        }
      }
    }
    if (v22[5])
    {
      v28 = v22[5];
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v28, 1);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = v4;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v27, 1);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[EKPersistentObject _takeValues:forKeys:relatedObjectValues:](self, "_takeValues:forKeys:relatedObjectValues:", v15, v16, 0);

      -[EKPersistentObject _loadedPropertyForKey:](self, "_loadedPropertyForKey:", v4);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v5 = 0;
    }
    _Block_object_dispose(&v21, 8);

  }
  pthread_mutex_unlock(&self->_lock);

  return v5;
}

void __43__EKPersistentObject_loadedPropertyForKey___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  if ((_DWORD)a2)
  {
    v4 = *(_QWORD *)(a1 + 32);
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithCADResult:", a2);
    v8 = objc_claimAutoreleasedReturnValue();
    NSLog(CFSTR("Error loading default properties for object %@ from daemon: %@"), v4, v8);
    v5 = (void *)v8;
  }
  else
  {
    objc_msgSend(a3, "firstObject");
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v5 = *(void **)(v7 + 40);
    *(_QWORD *)(v7 + 40) = v6;
  }

}

- (void)_createUpdatedPropertiesIfNeeded
{
  NSMutableDictionary *v3;
  NSMutableDictionary *updatedProperties;

  if (!self->_updatedProperties)
  {
    v3 = (NSMutableDictionary *)objc_opt_new();
    updatedProperties = self->_updatedProperties;
    self->_updatedProperties = v3;

  }
}

- (id)updatedPropertiesWithOnlyPersistentObjects
{
  void *v3;
  NSMutableDictionary *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v4 = self->_updatedProperties;
  v5 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v14;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v14 != v7)
          objc_enumerationMutation(v4);
        v9 = *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * i);
        -[NSMutableDictionary objectForKey:](self->_updatedProperties, "objectForKey:", v9, (_QWORD)v13);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          objc_msgSend(v10, "value");
          v11 = objc_claimAutoreleasedReturnValue();

          v10 = (void *)v11;
        }
        if (v10)
          objc_msgSend(v3, "setValue:forKey:", v10, v9);

      }
      v6 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v6);
  }

  return v3;
}

- (void)_releaseLoadedProperties
{
  void *v3;
  NSMutableDictionary *loadedProperties;
  id v5;

  objc_msgSend((id)objc_opt_class(), "propertyKeyForUniqueIdentifier");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](self->_loadedProperties, "objectForKeyedSubscript:");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  loadedProperties = self->_loadedProperties;
  if (v3)
  {
    -[NSMutableDictionary removeAllObjects](loadedProperties, "removeAllObjects");
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_loadedProperties, "setObject:forKeyedSubscript:", v3, v5);
  }
  else
  {
    self->_loadedProperties = 0;

  }
}

- (void)unloadPropertyForKey:(id)a3
{
  void *v4;
  void *v5;
  int v6;
  id v7;

  v7 = a3;
  pthread_mutex_lock(&self->_lock);
  -[NSMutableDictionary removeObjectForKey:](self->_updatedProperties, "removeObjectForKey:", v7);
  -[EKPersistentObject _loadedPropertyForKey:](self, "_loadedPropertyForKey:", v7);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    -[NSMutableDictionary removeObjectForKey:](self->_loadedProperties, "removeObjectForKey:", v7);
    objc_msgSend((id)objc_opt_class(), "defaultPropertiesToLoad");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "containsObject:", v7);

    if (v6)
      -[EKPersistentObject _setDefaultPropertiesLoaded:](self, "_setDefaultPropertiesLoaded:", 0);
  }
  pthread_mutex_unlock(&self->_lock);

}

- (void)_addObjectCore:(id)a3 toValues:(id)a4 relation:(id)a5
{
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  void *v12;
  char v13;
  id WeakRetained;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  uint64_t v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  objc_msgSend(v8, "eventStore");
  v11 = objc_claimAutoreleasedReturnValue();
  if (!v11)
  {
LABEL_4:
    WeakRetained = objc_loadWeakRetained((id *)&self->_eventStore);
    objc_msgSend(WeakRetained, "_insertObject:", v8);

    -[EKPersistentObject addCoCommitObject:](self, "addCoCommitObject:", v8);
    goto LABEL_6;
  }
  v12 = (void *)v11;
  if (objc_msgSend(v8, "isNew"))
  {
    v13 = objc_msgSend(v8, "_isPendingInsert");

    if ((v13 & 1) != 0)
      goto LABEL_6;
    goto LABEL_4;
  }

LABEL_6:
  objc_msgSend(v9, "addObject:", v8);
  objc_msgSend(v10, "inversePropertyNames");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (v16)
  {
    v17 = v16;
    v18 = *(_QWORD *)v22;
    do
    {
      for (i = 0; i != v17; ++i)
      {
        if (*(_QWORD *)v22 != v18)
          objc_enumerationMutation(v15);
        v20 = *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * i);
        if (objc_msgSend(v10, "shouldSetInverseProperty:onObject:forObject:", v20, v8, self))
          objc_msgSend(v8, "_setProperty:forKey:isUpdatedProperty:", self, v20, 1);
      }
      v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    }
    while (v17);
  }

}

- (void)_removeObjectCore:(id)a3 fromValues:(id)a4 relation:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  uint64_t v16;
  id WeakRetained;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  objc_msgSend(v10, "inversePropertyNames");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v19;
    do
    {
      for (i = 0; i != v13; ++i)
      {
        if (*(_QWORD *)v19 != v14)
          objc_enumerationMutation(v11);
        v16 = *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * i);
        if (objc_msgSend(v10, "shouldSetInverseProperty:onObject:forObject:", v16, v8, self))
          objc_msgSend(v8, "_setProperty:forKey:isUpdatedProperty:", 0, v16, 1);
      }
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v13);
  }
  objc_msgSend(v9, "removeObject:", v8);
  if ((objc_msgSend(v8, "isNew") & 1) != 0)
    -[EKPersistentObject removeCoCommitObject:](self, "removeCoCommitObject:", v8);
  else
    -[EKPersistentObject addCoCommitObject:](self, "addCoCommitObject:", v8);
  WeakRetained = objc_loadWeakRetained((id *)&self->_eventStore);
  objc_msgSend(WeakRetained, "_deleteObject:", v8);

}

- (void)primitiveAddRelatedObject:(id)a3 forKey:(id)a4
{
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id WeakRetained;
  void *v12;
  objc_class *v13;
  void *v14;
  id v15;

  v15 = a3;
  v7 = a4;
  pthread_mutex_lock(&self->_lock);
  objc_msgSend((id)objc_opt_class(), "_relationForKey:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v8 && (objc_msgSend(v8, "toMany") & 1) != 0)
  {
    objc_msgSend(v15, "eventStore");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v10)
    {
      WeakRetained = objc_loadWeakRetained((id *)&self->_eventStore);
      objc_msgSend(WeakRetained, "_insertObject:", v15);

      -[EKPersistentObject addCoCommitObject:](self, "addCoCommitObject:", v15);
    }
    -[EKPersistentObject primitiveRelationValueForKey:](self, "primitiveRelationValueForKey:", v7);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v12)
    {
      objc_msgSend(MEMORY[0x1E0C99E20], "setWithCapacity:", 1);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[EKPersistentObject _setProperty:forKey:isUpdatedProperty:](self, "_setProperty:forKey:isUpdatedProperty:", v12, v7, 1);
    }
    -[EKPersistentObject _addObjectCore:toValues:relation:](self, "_addObjectCore:toValues:relation:", v15, v12, v9);
    pthread_mutex_unlock(&self->_lock);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (objc_class *)objc_opt_class();
    NSStringFromClass(v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("EKPersistentObject.m"), 1016, CFSTR("Trying to add an object as a related object for property %@ on %@, but it's not a relation or not to-many"), v7, v14);

  }
}

- (void)primitiveRemoveRelatedObject:(id)a3 forKey:(id)a4
{
  id v7;
  void *v8;
  void *v9;
  void *v10;
  objc_class *v11;
  void *v12;
  void *v13;
  id v14;

  v14 = a3;
  v7 = a4;
  pthread_mutex_lock(&self->_lock);
  objc_msgSend((id)objc_opt_class(), "_relationForKey:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (!v8 || (objc_msgSend(v8, "toMany") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (objc_class *)objc_opt_class();
    NSStringFromClass(v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("EKPersistentObject.m"), 1049, CFSTR("Trying to remove an object as a related object for property %@ on %@, but it's not a relation or not to-many"), v7, v12);

  }
  -[EKPersistentObject _propertyForKey:](self, "_propertyForKey:", v7);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (v13)
    -[EKPersistentObject _removeObjectCore:fromValues:relation:](self, "_removeObjectCore:fromValues:relation:", v14, v13, v9);
  pthread_mutex_unlock(&self->_lock);

}

- (void)primitiveSetRelationValue:(id)a3 forKey:(id)a4
{
  id v7;
  id v8;
  _opaque_pthread_mutex_t *p_lock;
  void *v10;
  void *v11;
  objc_class *v12;
  void *v13;
  uint64_t v14;
  id v15;
  void *v16;
  void *v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t k;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  _opaque_pthread_mutex_t *v32;
  void *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t i;
  id v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t j;
  id WeakRetained;
  id v44;
  uint64_t v45;
  uint64_t v46;
  id v47;
  unint64_t v48;
  void *v49;
  uint64_t m;
  uint64_t v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  id v59;
  id v60;
  void *v61;
  void *v62;
  id obj;
  id obja;
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
  _BYTE v81[128];
  _BYTE v82[128];
  _BYTE v83[128];
  _BYTE v84[128];
  uint64_t v85;

  v85 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  p_lock = &self->_lock;
  pthread_mutex_lock(&self->_lock);
  objc_msgSend((id)objc_opt_class(), "_relationForKey:", v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v10)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (objc_class *)objc_opt_class();
    NSStringFromClass(v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("EKPersistentObject.m"), 1065, CFSTR("Requested set of relation called %@ on a %@, but that doesn't exist."), v8, v13);

  }
  if (objc_msgSend(v10, "toMany"))
  {
    if (v7)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v57 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v57, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("EKPersistentObject.m"), 1071, CFSTR("Setting a to-many relation requires an NSSet"));

      }
    }
    -[EKPersistentObject primitiveRelationValueForKey:](self, "primitiveRelationValueForKey:", v8);
    v14 = objc_claimAutoreleasedReturnValue();
    v15 = v7;
    v61 = (void *)v14;
    if (!v14)
    {
      objc_msgSend(MEMORY[0x1E0C99E20], "set");
      v61 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v62 = v15;
    if (objc_msgSend(v15, "count"))
    {
      v16 = (void *)objc_msgSend(v15, "mutableCopy");
      v17 = v61;
      if (objc_msgSend(v61, "count"))
        objc_msgSend(v16, "minusSet:", v61);
    }
    else
    {
      v16 = 0;
      v17 = v61;
    }
    if (objc_msgSend(v17, "count"))
    {
      v31 = (void *)objc_msgSend(v17, "mutableCopy");
      v32 = &self->_lock;
      if (objc_msgSend(v15, "count"))
        objc_msgSend(v31, "minusSet:", v15);
    }
    else
    {
      v32 = &self->_lock;
      v31 = 0;
    }
    objc_msgSend(MEMORY[0x1E0C99E20], "setWithSet:", v61);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v77 = 0u;
    v78 = 0u;
    v79 = 0u;
    v80 = 0u;
    obj = v16;
    v34 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v77, v84, 16);
    if (v34)
    {
      v35 = v34;
      v36 = *(_QWORD *)v78;
      do
      {
        for (i = 0; i != v35; ++i)
        {
          if (*(_QWORD *)v78 != v36)
            objc_enumerationMutation(obj);
          -[EKPersistentObject _addObjectCore:toValues:relation:](self, "_addObjectCore:toValues:relation:", *(_QWORD *)(*((_QWORD *)&v77 + 1) + 8 * i), v33, v10);
        }
        v35 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v77, v84, 16);
      }
      while (v35);
    }

    v75 = 0u;
    v76 = 0u;
    v73 = 0u;
    v74 = 0u;
    v38 = v31;
    v39 = objc_msgSend(v38, "countByEnumeratingWithState:objects:count:", &v73, v83, 16);
    if (v39)
    {
      v40 = v39;
      v41 = *(_QWORD *)v74;
      do
      {
        for (j = 0; j != v40; ++j)
        {
          if (*(_QWORD *)v74 != v41)
            objc_enumerationMutation(v38);
          -[EKPersistentObject _removeObjectCore:fromValues:relation:](self, "_removeObjectCore:fromValues:relation:", *(_QWORD *)(*((_QWORD *)&v73 + 1) + 8 * j), v33, v10);
        }
        v40 = objc_msgSend(v38, "countByEnumeratingWithState:objects:count:", &v73, v83, 16);
      }
      while (v40);
    }

    -[EKPersistentObject _setProperty:forKey:isUpdatedProperty:](self, "_setProperty:forKey:isUpdatedProperty:", v33, v8, 1);
    p_lock = v32;
    goto LABEL_54;
  }
  if (v7)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v58 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v58, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("EKPersistentObject.m"), 1113, CFSTR("Setting a relation requires an EKPersistentObject"));

    }
  }
  v18 = v7;
  -[EKPersistentObject primitiveRelationValueForKey:](self, "primitiveRelationValueForKey:", v8);
  v19 = objc_claimAutoreleasedReturnValue();
  v61 = v18;
  v62 = (void *)v19;
  if ((id)v19 != v18)
  {
    v20 = v19;
    objc_msgSend(v10, "inversePropertyNames");
    obj = (id)objc_claimAutoreleasedReturnValue();
    v59 = v8;
    v60 = v7;
    if (v20)
    {
      v71 = 0u;
      v72 = 0u;
      v69 = 0u;
      v70 = 0u;
      v21 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v69, v82, 16);
      v22 = v62;
      if (v21)
      {
        v23 = v21;
        v24 = *(_QWORD *)v70;
        do
        {
          for (k = 0; k != v23; ++k)
          {
            if (*(_QWORD *)v70 != v24)
              objc_enumerationMutation(obj);
            v26 = *(_QWORD *)(*((_QWORD *)&v69 + 1) + 8 * k);
            if (objc_msgSend(v10, "shouldSetInverseProperty:onObject:forObject:", v26, v22, self))
            {
              objc_msgSend((id)objc_opt_class(), "_relationForKey:", v26);
              v27 = (void *)objc_claimAutoreleasedReturnValue();
              if (objc_msgSend(v27, "toMany"))
              {
                objc_msgSend(v22, "_propertyForKey:", v26);
                v28 = (void *)objc_claimAutoreleasedReturnValue();
                if (v28)
                {
                  objc_msgSend(MEMORY[0x1E0C99E20], "setWithSet:", v28);
                  v29 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v29, "removeObject:", self);
                  objc_msgSend(MEMORY[0x1E0C99E20], "setWithSet:", v29);
                  v30 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v62, "_setProperty:forKey:isUpdatedProperty:", v30, v26, 1);

                  v22 = v62;
                }

              }
              else
              {
                objc_msgSend(v22, "_setProperty:forKey:isUpdatedProperty:", 0, v26, 1);
              }

            }
          }
          v23 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v69, v82, 16);
        }
        while (v23);
      }
      v8 = v59;
      v7 = v60;
      p_lock = &self->_lock;
      if (objc_msgSend(v10, "ownsRelatedObject"))
      {
        if ((objc_msgSend(v62, "_isPendingInsert") & 1) != 0)
          -[EKPersistentObject removeCoCommitObject:](self, "removeCoCommitObject:", v62);
        else
          -[EKPersistentObject addCoCommitObject:](self, "addCoCommitObject:", v62);
        WeakRetained = objc_loadWeakRetained((id *)&self->_eventStore);
        objc_msgSend(WeakRetained, "_deleteObject:", v62);

      }
    }
    if (objc_msgSend(v10, "ownsRelatedObject")
      && objc_msgSend(v61, "isNew")
      && (objc_msgSend(v61, "_isPendingInsert") & 1) == 0)
    {
      v44 = objc_loadWeakRetained((id *)&self->_eventStore);
      objc_msgSend(v44, "_insertObject:", v61);

    }
    -[EKPersistentObject _setProperty:forKey:isUpdatedProperty:](self, "_setProperty:forKey:isUpdatedProperty:", v61, v8, 1);
    if (!v7)
      goto LABEL_55;
    v67 = 0u;
    v68 = 0u;
    v65 = 0u;
    v66 = 0u;
    v38 = obj;
    v45 = objc_msgSend(v38, "countByEnumeratingWithState:objects:count:", &v65, v81, 16);
    if (v45)
    {
      v46 = v45;
      v47 = *(id *)v66;
      v48 = 0x1E0C99000uLL;
      v49 = v61;
      obja = *(id *)v66;
      do
      {
        for (m = 0; m != v46; ++m)
        {
          if (*(id *)v66 != v47)
            objc_enumerationMutation(v38);
          v51 = *(_QWORD *)(*((_QWORD *)&v65 + 1) + 8 * m);
          if (objc_msgSend(v10, "shouldSetInverseProperty:onObject:forObject:", v51, v49, self))
          {
            objc_msgSend((id)objc_opt_class(), "_relationForKey:", v51);
            v52 = (void *)objc_claimAutoreleasedReturnValue();
            if (objc_msgSend(v52, "toMany"))
            {
              objc_msgSend(v49, "_propertyForKey:", v51);
              v53 = (void *)objc_claimAutoreleasedReturnValue();
              v54 = *(void **)(v48 + 3616);
              if (v53)
              {
                objc_msgSend(v54, "setWithSet:", v53);
                v55 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v55, "addObject:", self);
                objc_msgSend(*(id *)(v48 + 3616), "setWithSet:", v55);
                v56 = (void *)objc_claimAutoreleasedReturnValue();

                v49 = v61;
              }
              else
              {
                objc_msgSend(v54, "setWithObject:", self);
                v56 = (void *)objc_claimAutoreleasedReturnValue();
              }
              objc_msgSend(v49, "_setProperty:forKey:isUpdatedProperty:", v56, v51, 1);

              v47 = obja;
              v48 = 0x1E0C99000;
            }
            else
            {
              objc_msgSend(v49, "_setProperty:forKey:isUpdatedProperty:", self, v51, 1);
            }

          }
        }
        v46 = objc_msgSend(v38, "countByEnumeratingWithState:objects:count:", &v65, v81, 16);
      }
      while (v46);
      obj = v38;
      v8 = v59;
      v7 = v60;
      p_lock = &self->_lock;
    }
    else
    {
      obj = v38;
      v8 = v59;
      v7 = v60;
    }
LABEL_54:

LABEL_55:
  }

  pthread_mutex_unlock(p_lock);
}

- (void)_primitiveSetValue:(id)a3 forKey:(id)a4
{
  id v6;
  uint64_t v7;
  id v8;
  id v9;
  id v10;

  v9 = a3;
  v6 = a4;
  v7 = (uint64_t)v9;
  v8 = v6;
  if (!v9)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v7 = objc_claimAutoreleasedReturnValue();
  }
  v10 = (id)v7;
  -[EKPersistentObject _setProperty:forKey:isUpdatedProperty:](self, "_setProperty:forKey:isUpdatedProperty:", v7, v8, 1);

}

- (void)primitiveSetNumberValue:(id)a3 forKey:(id)a4
{
  _opaque_pthread_mutex_t *p_lock;
  id v7;
  id v8;

  p_lock = &self->_lock;
  v7 = a4;
  v8 = a3;
  pthread_mutex_lock(p_lock);
  -[EKPersistentObject _primitiveSetValue:forKey:](self, "_primitiveSetValue:forKey:", v8, v7);

  pthread_mutex_unlock(p_lock);
}

- (void)primitiveSetIntValue:(int)a3 forKey:(id)a4
{
  uint64_t v4;
  _opaque_pthread_mutex_t *p_lock;
  id v7;
  void *v8;

  v4 = *(_QWORD *)&a3;
  p_lock = &self->_lock;
  v7 = a4;
  pthread_mutex_lock(p_lock);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[EKPersistentObject _primitiveSetValue:forKey:](self, "_primitiveSetValue:forKey:", v8, v7);

  pthread_mutex_unlock(p_lock);
}

- (double)primitiveDoubleValueForKey:(id)a3
{
  void *v3;
  double v4;
  double v5;

  -[EKPersistentObject primitiveNumberValueForKey:](self, "primitiveNumberValueForKey:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "doubleValue");
  v5 = v4;

  return v5;
}

- (void)primitiveSetDoubleValue:(double)a3 forKey:(id)a4
{
  _opaque_pthread_mutex_t *p_lock;
  id v7;
  void *v8;

  p_lock = &self->_lock;
  v7 = a4;
  pthread_mutex_lock(p_lock);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[EKPersistentObject _primitiveSetValue:forKey:](self, "_primitiveSetValue:forKey:", v8, v7);

  pthread_mutex_unlock(p_lock);
}

- (void)primitiveSetBoolValue:(BOOL)a3 forKey:(id)a4
{
  _BOOL8 v4;
  _opaque_pthread_mutex_t *p_lock;
  id v7;
  void *v8;

  v4 = a3;
  p_lock = &self->_lock;
  v7 = a4;
  pthread_mutex_lock(p_lock);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[EKPersistentObject _primitiveSetValue:forKey:](self, "_primitiveSetValue:forKey:", v8, v7);

  pthread_mutex_unlock(p_lock);
}

- (void)primitiveSetDateValue:(id)a3 forKey:(id)a4
{
  _opaque_pthread_mutex_t *p_lock;
  id v7;
  id v8;

  p_lock = &self->_lock;
  v7 = a4;
  v8 = a3;
  pthread_mutex_lock(p_lock);
  -[EKPersistentObject _primitiveSetValue:forKey:](self, "_primitiveSetValue:forKey:", v8, v7);

  pthread_mutex_unlock(p_lock);
}

- (void)primitiveSetStringValue:(id)a3 forKey:(id)a4
{
  _opaque_pthread_mutex_t *p_lock;
  id v7;
  id v8;

  p_lock = &self->_lock;
  v7 = a4;
  v8 = a3;
  pthread_mutex_lock(p_lock);
  -[EKPersistentObject _primitiveSetValue:forKey:](self, "_primitiveSetValue:forKey:", v8, v7);

  pthread_mutex_unlock(p_lock);
}

- (id)primitiveDataValueForKey:(id)a3
{
  id v4;
  _opaque_pthread_mutex_t *p_lock;
  void *v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  _QWORD v12[4];
  id v13;
  EKPersistentObject *v14;
  id v15;

  v4 = a3;
  p_lock = &self->_lock;
  pthread_mutex_lock(&self->_lock);
  -[EKPersistentObject _CADObjectID](self, "_CADObjectID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __47__EKPersistentObject_primitiveDataValueForKey___block_invoke;
  v12[3] = &unk_1E4786B40;
  v13 = v6;
  v14 = self;
  v15 = v4;
  v7 = v4;
  v8 = v6;
  -[EKPersistentObject _primitiveValueForKey:loader:](self, "_primitiveValueForKey:loader:", v7, v12);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v9, "copy");

  pthread_mutex_unlock(p_lock);
  return v10;
}

id __47__EKPersistentObject_primitiveDataValueForKey___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id WeakRetained;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  id v10;
  _QWORD v12[4];
  id v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  id v20;

  v3 = a2;
  v15 = 0;
  v16 = &v15;
  v17 = 0x3032000000;
  v18 = __Block_byref_object_copy__16;
  v19 = __Block_byref_object_dispose__16;
  v20 = 0;
  v4 = *(void **)(a1 + 32);
  if (v4)
  {
    if ((objc_msgSend(v4, "isTemporary") & 1) == 0)
    {
      WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 40) + 72));

      if (WeakRetained)
      {
        v6 = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 40) + 72));
        objc_msgSend(v6, "connection");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "CADOperationProxySync");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = *(_QWORD *)(a1 + 32);
        v12[0] = MEMORY[0x1E0C809B0];
        v12[1] = 3221225472;
        v12[2] = __47__EKPersistentObject_primitiveDataValueForKey___block_invoke_2;
        v12[3] = &unk_1E4786BE0;
        v13 = *(id *)(a1 + 48);
        v14 = &v15;
        objc_msgSend(v8, "CADObject:getDataPropertyWithName:reply:", v9, v3, v12);

      }
    }
  }
  v10 = (id)v16[5];
  _Block_object_dispose(&v15, 8);

  return v10;
}

void __47__EKPersistentObject_primitiveDataValueForKey___block_invoke_2(uint64_t a1, int a2, void *a3)
{
  id v6;

  v6 = a3;
  if (a2)
  {
    if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_ERROR))
      __47__EKPersistentObject_primitiveDataValueForKey___block_invoke_2_cold_1();
  }
  else
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a3);
  }

}

- (void)primitiveSetDataValue:(id)a3 forKey:(id)a4
{
  _opaque_pthread_mutex_t *p_lock;
  id v7;
  id v8;

  p_lock = &self->_lock;
  v7 = a4;
  v8 = a3;
  pthread_mutex_lock(p_lock);
  -[EKPersistentObject _primitiveSetValue:forKey:](self, "_primitiveSetValue:forKey:", v8, v7);

  pthread_mutex_unlock(p_lock);
}

- (id)primitiveSecurityScopedURLWrapperValueForKey:(id)a3
{
  id v4;
  _opaque_pthread_mutex_t *p_lock;
  void *v6;
  id v7;
  id v8;
  void *v9;
  _QWORD v11[4];
  id v12;
  EKPersistentObject *v13;
  id v14;

  v4 = a3;
  p_lock = &self->_lock;
  pthread_mutex_lock(&self->_lock);
  -[EKPersistentObject _CADObjectID](self, "_CADObjectID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __67__EKPersistentObject_primitiveSecurityScopedURLWrapperValueForKey___block_invoke;
  v11[3] = &unk_1E4786B40;
  v12 = v6;
  v13 = self;
  v14 = v4;
  v7 = v4;
  v8 = v6;
  -[EKPersistentObject _primitiveValueForKey:loader:](self, "_primitiveValueForKey:loader:", v7, v11);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  pthread_mutex_unlock(p_lock);

  return v9;
}

id __67__EKPersistentObject_primitiveSecurityScopedURLWrapperValueForKey___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id WeakRetained;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  id v10;
  _QWORD v12[4];
  id v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  id v20;

  v3 = a2;
  v15 = 0;
  v16 = &v15;
  v17 = 0x3032000000;
  v18 = __Block_byref_object_copy__16;
  v19 = __Block_byref_object_dispose__16;
  v20 = 0;
  v4 = *(void **)(a1 + 32);
  if (v4)
  {
    if ((objc_msgSend(v4, "isTemporary") & 1) == 0)
    {
      WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 40) + 72));

      if (WeakRetained)
      {
        v6 = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 40) + 72));
        objc_msgSend(v6, "connection");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "CADOperationProxySync");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = *(_QWORD *)(a1 + 32);
        v12[0] = MEMORY[0x1E0C809B0];
        v12[1] = 3221225472;
        v12[2] = __67__EKPersistentObject_primitiveSecurityScopedURLWrapperValueForKey___block_invoke_2;
        v12[3] = &unk_1E4786C08;
        v13 = *(id *)(a1 + 48);
        v14 = &v15;
        objc_msgSend(v8, "CADObject:getSecurityScopedURLWrapperPropertyWithName:reply:", v9, v3, v12);

      }
    }
  }
  v10 = (id)v16[5];
  _Block_object_dispose(&v15, 8);

  return v10;
}

void __67__EKPersistentObject_primitiveSecurityScopedURLWrapperValueForKey___block_invoke_2(uint64_t a1, int a2, void *a3)
{
  id v6;

  v6 = a3;
  if (a2)
  {
    if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_ERROR))
      __47__EKPersistentObject_primitiveDataValueForKey___block_invoke_2_cold_1();
  }
  else
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a3);
  }

}

- (void)primitiveSetSecurityScopedURLWrapperValue:(id)a3 forKey:(id)a4
{
  _opaque_pthread_mutex_t *p_lock;
  id v7;
  id v8;

  p_lock = &self->_lock;
  v7 = a4;
  v8 = a3;
  pthread_mutex_lock(p_lock);
  -[EKPersistentObject _primitiveSetValue:forKey:](self, "_primitiveSetValue:forKey:", v8, v7);

  pthread_mutex_unlock(p_lock);
}

- (BOOL)_loadRelationForKey:(id)a3 value:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  EKEventStore **p_eventStore;
  id WeakRetained;
  id v11;
  void *v12;
  void *v13;
  uint64_t *v14;
  id v15;
  char v16;
  _QWORD v18[4];
  id v19;
  uint64_t *v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t (*v25)(uint64_t, uint64_t);
  void (*v26)(uint64_t);
  id v27;
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  char v31;

  v6 = a3;
  v28 = 0;
  v29 = &v28;
  v30 = 0x2020000000;
  v31 = 0;
  v22 = 0;
  v23 = &v22;
  v24 = 0x3032000000;
  v25 = __Block_byref_object_copy__16;
  v26 = __Block_byref_object_dispose__16;
  v27 = 0;
  -[EKPersistentObject _CADObjectID](self, "_CADObjectID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
  {
    if ((objc_msgSend(v7, "isTemporary") & 1) == 0)
    {
      p_eventStore = &self->_eventStore;
      WeakRetained = objc_loadWeakRetained((id *)p_eventStore);

      if (WeakRetained)
      {
        v11 = objc_loadWeakRetained((id *)p_eventStore);
        objc_msgSend(v11, "connection");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "CADOperationProxySync");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v18[0] = MEMORY[0x1E0C809B0];
        v18[1] = 3221225472;
        v18[2] = __48__EKPersistentObject__loadRelationForKey_value___block_invoke;
        v18[3] = &unk_1E4786C30;
        v19 = v6;
        v20 = &v22;
        v21 = &v28;
        objc_msgSend(v13, "CADObject:getRelatedObjectWithRelationName:reply:", v8, v19, v18);

      }
    }
  }
  v14 = v29;
  if (*((_BYTE *)v29 + 24) && v23[5])
  {
    +[EKObjectID objectIDWithCADObjectID:](EKObjectID, "objectIDWithCADObjectID:");
    v15 = (id)objc_claimAutoreleasedReturnValue();
    v14 = v29;
  }
  else
  {
    v15 = 0;
  }
  *a4 = v15;
  v16 = *((_BYTE *)v14 + 24);

  _Block_object_dispose(&v22, 8);
  _Block_object_dispose(&v28, 8);

  return v16;
}

void __48__EKPersistentObject__loadRelationForKey_value___block_invoke(uint64_t a1, int a2, void *a3)
{
  id v6;

  v6 = a3;
  if (a2)
  {
    if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_ERROR))
      __48__EKPersistentObject__loadRelationForKey_value___block_invoke_cold_1();
  }
  else
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a3);
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 1;
  }

}

- (void)takeValues:(id)a3 forKeys:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;

  v6 = a4;
  v7 = a3;
  v10 = (id)objc_opt_new();
  pthread_mutex_lock(&self->_lock);
  -[EKPersistentObject _takeValues:forKeys:relatedObjectValues:](self, "_takeValues:forKeys:relatedObjectValues:", v7, v6, v10);

  pthread_mutex_unlock(&self->_lock);
  v8 = (void *)objc_opt_class();
  -[EKPersistentObject eventStore](self, "eventStore");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "_takeDefaultValuesForObjects:inEventStore:", v10, v9);

}

- (void)loadPropertiesIfNeeded:(id)a3
{
  _opaque_pthread_mutex_t *p_lock;
  id v5;

  p_lock = &self->_lock;
  v5 = a3;
  pthread_mutex_lock(p_lock);
  -[EKPersistentObject _loadPropertiesIfNeeded:](self, "_loadPropertiesIfNeeded:", v5);

  pthread_mutex_unlock(p_lock);
}

+ (id)allObjectsWithChangesRelatedToObjects:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  void (**v10)(_QWORD, _QWORD);
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  id v18;
  void *v19;
  void *v21;
  _QWORD v22[4];
  id v23;
  void (**v24)(_QWORD, _QWORD);
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _QWORD v29[4];
  id v30;
  id v31;
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = v3;
  objc_msgSend(v3, "allObjects");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v6, "mutableCopy");

  v29[0] = MEMORY[0x1E0C809B0];
  v29[1] = 3221225472;
  v29[2] = __60__EKPersistentObject_allObjectsWithChangesRelatedToObjects___block_invoke;
  v29[3] = &unk_1E4786CD0;
  v8 = v5;
  v30 = v8;
  v9 = v7;
  v31 = v9;
  v10 = (void (**)(_QWORD, _QWORD))MEMORY[0x1A85849D4](v29);
  while (objc_msgSend(v9, "count"))
  {
    objc_msgSend(v9, "lastObject");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "removeLastObject");
    objc_msgSend(v8, "addObject:", v11);
    if ((objc_msgSend(v11, "isDirty") & 1) != 0
      || (objc_msgSend(v11, "_isPendingInsert") & 1) != 0
      || (objc_msgSend(v11, "_isPendingDelete") & 1) != 0
      || objc_msgSend(v11, "_isPendingUpdate"))
    {
      objc_msgSend(v4, "addObject:", v11);
    }
    objc_msgSend(v11, "coCommitObjects");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = 0u;
    v26 = 0u;
    v27 = 0u;
    v28 = 0u;
    v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v25, v32, 16);
    if (v13)
    {
      v14 = v13;
      v15 = *(_QWORD *)v26;
      do
      {
        v16 = 0;
        do
        {
          if (*(_QWORD *)v26 != v15)
            objc_enumerationMutation(v12);
          v10[2](v10, *(_QWORD *)(*((_QWORD *)&v25 + 1) + 8 * v16++));
        }
        while (v14 != v16);
        v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v25, v32, 16);
      }
      while (v14);
    }
    objc_msgSend((id)objc_opt_class(), "relations");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v22[0] = MEMORY[0x1E0C809B0];
    v22[1] = 3221225472;
    v22[2] = __60__EKPersistentObject_allObjectsWithChangesRelatedToObjects___block_invoke_2;
    v22[3] = &unk_1E4786CF8;
    v23 = v11;
    v24 = v10;
    v18 = v11;
    objc_msgSend(v17, "enumerateKeysAndObjectsUsingBlock:", v22);

  }
  v19 = (void *)objc_msgSend(v4, "copy");

  return v19;
}

void __60__EKPersistentObject_allObjectsWithChangesRelatedToObjects___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if ((objc_msgSend(*(id *)(a1 + 32), "containsObject:") & 1) == 0)
    objc_msgSend(*(id *)(a1 + 40), "addObject:", v3);

}

void __60__EKPersistentObject_allObjectsWithChangesRelatedToObjects___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  pthread_mutex_lock((pthread_mutex_t *)(*(_QWORD *)(a1 + 32) + 8));
  objc_msgSend(*(id *)(a1 + 32), "_propertyForKey:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  pthread_mutex_unlock((pthread_mutex_t *)(*(_QWORD *)(a1 + 32) + 8));
  if (v7)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      if (objc_msgSend(v6, "toMany"))
      {
        v8 = v7;
        v13 = 0u;
        v14 = 0u;
        v15 = 0u;
        v16 = 0u;
        v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
        if (v9)
        {
          v10 = v9;
          v11 = *(_QWORD *)v14;
          do
          {
            v12 = 0;
            do
            {
              if (*(_QWORD *)v14 != v11)
                objc_enumerationMutation(v8);
              (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
              ++v12;
            }
            while (v10 != v12);
            v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
          }
          while (v10);
        }

      }
      else
      {
        (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
      }
    }
  }

}

- (id)ownedObjects
{
  void *v3;
  void *v4;
  uint64_t v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  _QWORD v14[4];
  id v15;
  id v16;
  _QWORD v17[4];
  id v18;
  id v19;

  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithObject:", self);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = MEMORY[0x1E0C809B0];
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __34__EKPersistentObject_ownedObjects__block_invoke;
  v17[3] = &unk_1E4786CD0;
  v6 = v4;
  v18 = v6;
  v7 = v3;
  v19 = v7;
  v8 = (void *)MEMORY[0x1A85849D4](v17);
  while (objc_msgSend(v6, "count"))
  {
    objc_msgSend(v6, "lastObject");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "removeLastObject");
    objc_msgSend((id)objc_opt_class(), "relations");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v14[0] = v5;
    v14[1] = 3221225472;
    v14[2] = __34__EKPersistentObject_ownedObjects__block_invoke_2;
    v14[3] = &unk_1E4786CF8;
    v15 = v9;
    v16 = v8;
    v11 = v9;
    objc_msgSend(v10, "enumerateKeysAndObjectsUsingBlock:", v14);

  }
  v12 = (void *)objc_msgSend(v7, "copy");

  return v12;
}

void __34__EKPersistentObject_ownedObjects__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "addObject:", v4);
  objc_msgSend(*(id *)(a1 + 40), "addObject:", v4);

}

void __34__EKPersistentObject_ownedObjects__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (objc_msgSend(v6, "ownsRelatedObject"))
  {
    pthread_mutex_lock((pthread_mutex_t *)(*(_QWORD *)(a1 + 32) + 8));
    objc_msgSend(*(id *)(a1 + 32), "_propertyForKey:", v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    pthread_mutex_unlock((pthread_mutex_t *)(*(_QWORD *)(a1 + 32) + 8));
    if (v7)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (objc_msgSend(v6, "toMany"))
        {
          v8 = v7;
          v13 = 0u;
          v14 = 0u;
          v15 = 0u;
          v16 = 0u;
          v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
          if (v9)
          {
            v10 = v9;
            v11 = *(_QWORD *)v14;
            do
            {
              v12 = 0;
              do
              {
                if (*(_QWORD *)v14 != v11)
                  objc_enumerationMutation(v8);
                (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
                ++v12;
              }
              while (v10 != v12);
              v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
            }
            while (v10);
          }

        }
        else
        {
          (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
        }
      }
    }

  }
}

- (id)dump
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithCapacity:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendString:", CFSTR("{\n"));
  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  -[EKPersistentObject _loadedPropertyKeys](self, "_loadedPropertyKeys");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v16 != v7)
          objc_enumerationMutation(v4);
        v9 = *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * i);
        -[EKPersistentObject _propertyForKey:](self, "_propertyForKey:", v9);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend((id)objc_opt_class(), "_relationForKey:", v9);
        v11 = objc_claimAutoreleasedReturnValue();
        v12 = (void *)v11;
        if (v11)
          objc_msgSend(v3, "appendFormat:", CFSTR("    %@ = %@\n"), v9, v11);
        else
          objc_msgSend(v3, "appendFormat:", CFSTR("    %@ = %@\n"), v9, v10);

      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v6);
  }

  objc_msgSend(v3, "appendString:", CFSTR("}"));
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ <%p> {loaded = %@; updated = %@}"),
    objc_opt_class(),
    self,
    v3,
    self->_updatedProperties);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (id)rebasedFrom
{
  return -[EKPersistentObject _propertyForKey:](self, "_propertyForKey:", *MEMORY[0x1E0D0B838]);
}

- (void)setRebasedFrom:(id)a3
{
  -[EKPersistentObject _setProperty:forKey:isUpdatedProperty:](self, "_setProperty:forKey:isUpdatedProperty:", a3, *MEMORY[0x1E0D0B838], 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_updatedProperties, 0);
  objc_storeStrong((id *)&self->_loadedProperties, 0);
  objc_storeStrong((id *)&self->_coCommitObjects, 0);
  objc_storeStrong((id *)&self->_objectID, 0);
  objc_destroyWeak((id *)&self->_eventStore);
}

+ (Class)meltedClass
{
  OUTLINED_FUNCTION_7_2();
  OUTLINED_FUNCTION_2_0();
  return 0;
}

- (int)entityType
{
  OUTLINED_FUNCTION_7_2();
  OUTLINED_FUNCTION_2_0();
  return -1;
}

+ (void)alternateUniverseClass
{
  void *v3;
  uint64_t v4;
  int v5;
  void *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  NSStringFromClass(a1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = 138543362;
  v6 = v3;
  OUTLINED_FUNCTION_0_5(&dword_1A2318000, a2, v4, "+alternateUniverseClass called on a class that does not implement it (%{public}@)", (uint8_t *)&v5);

}

void __49__EKPersistentObject_primitiveNumberValueForKey___block_invoke_2_cold_1()
{
  void *v0;
  id v1;
  id v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint8_t v10;

  OUTLINED_FUNCTION_4_1();
  v2 = v1;
  objc_msgSend((id)OUTLINED_FUNCTION_3_4(), "errorWithCADResult:");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1_4();
  OUTLINED_FUNCTION_0_1(&dword_1A2318000, v4, v5, "Error loading number %@ from daemon: %@", v6, v7, v8, v9, v10);

  OUTLINED_FUNCTION_1_1();
}

void __47__EKPersistentObject_primitiveDateValueForKey___block_invoke_2_cold_1()
{
  void *v0;
  id v1;
  id v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint8_t v10;

  OUTLINED_FUNCTION_4_1();
  v2 = v1;
  objc_msgSend((id)OUTLINED_FUNCTION_3_4(), "errorWithCADResult:");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1_4();
  OUTLINED_FUNCTION_0_1(&dword_1A2318000, v4, v5, "Error loading date %@ from daemon: %@", v6, v7, v8, v9, v10);

  OUTLINED_FUNCTION_1_1();
}

void __45__EKPersistentObject__loadStringValueForKey___block_invoke_cold_1()
{
  void *v0;
  id v1;
  id v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint8_t v10;

  OUTLINED_FUNCTION_4_1();
  v2 = v1;
  objc_msgSend((id)OUTLINED_FUNCTION_3_4(), "errorWithCADResult:");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1_4();
  OUTLINED_FUNCTION_0_1(&dword_1A2318000, v4, v5, "Error loading string %@ from daemon: %@", v6, v7, v8, v9, v10);

  OUTLINED_FUNCTION_1_1();
}

void __47__EKPersistentObject_primitiveDataValueForKey___block_invoke_2_cold_1()
{
  void *v0;
  id v1;
  id v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint8_t v10;

  OUTLINED_FUNCTION_4_1();
  v2 = v1;
  objc_msgSend((id)OUTLINED_FUNCTION_3_4(), "errorWithCADResult:");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1_4();
  OUTLINED_FUNCTION_0_1(&dword_1A2318000, v4, v5, "Error loading data %@ from daemon: %@", v6, v7, v8, v9, v10);

  OUTLINED_FUNCTION_1_1();
}

void __48__EKPersistentObject__loadRelationForKey_value___block_invoke_cold_1()
{
  void *v0;
  id v1;
  id v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint8_t v10;

  OUTLINED_FUNCTION_4_1();
  v2 = v1;
  objc_msgSend((id)OUTLINED_FUNCTION_3_4(), "errorWithCADResult:");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1_4();
  OUTLINED_FUNCTION_0_1(&dword_1A2318000, v4, v5, "Error loading to-one relation %@ from daemon: %@", v6, v7, v8, v9, v10);

  OUTLINED_FUNCTION_1_1();
}

void __57__EKPersistentObject__loadChildIdentifiersForKey_values___block_invoke_cold_1()
{
  void *v0;
  id v1;
  id v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint8_t v10;

  OUTLINED_FUNCTION_4_1();
  v2 = v1;
  objc_msgSend((id)OUTLINED_FUNCTION_3_4(), "errorWithCADResult:");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1_4();
  OUTLINED_FUNCTION_0_1(&dword_1A2318000, v4, v5, "Error loading to-many relation %@ from daemon: %@", v6, v7, v8, v9, v10);

  OUTLINED_FUNCTION_1_1();
}

void __54__EKPersistentObject__takeValues_relatedObjectValues___block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3)
{
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v3 = 138412290;
  v4 = a1;
  OUTLINED_FUNCTION_0_5(&dword_1A2318000, a2, a3, "Failed to take value for related object with key %@", (uint8_t *)&v3);
}

@end
