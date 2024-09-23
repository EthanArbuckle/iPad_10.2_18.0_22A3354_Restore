@implementation NRSecureDevicePropertyStore

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dirtyQueue, 0);
  objc_storeStrong((id *)&self->_propertyToID, 0);
  objc_storeStrong((id *)&self->_IDToProperty, 0);
}

- (id)copyWithZone:(_NSZone *)a3
{
  NRSecureDevicePropertyStore *v5;
  uint64_t v6;
  NSMutableDictionary *IDToProperty;
  uint64_t v8;
  NSMutableDictionary *propertyToID;

  v5 = -[NRSecureDevicePropertyStore init](+[NRSecureDevicePropertyStore allocWithZone:](NRSecureDevicePropertyStore, "allocWithZone:"), "init");
  v6 = -[NSMutableDictionary mutableCopyWithZone:](self->_IDToProperty, "mutableCopyWithZone:", a3);
  IDToProperty = v5->_IDToProperty;
  v5->_IDToProperty = (NSMutableDictionary *)v6;

  v8 = -[NSMutableDictionary mutableCopyWithZone:](self->_propertyToID, "mutableCopyWithZone:", a3);
  propertyToID = v5->_propertyToID;
  v5->_propertyToID = (NSMutableDictionary *)v8;

  v5->_dirty = 1;
  return v5;
}

- (NRSecureDevicePropertyStore)init
{
  NRSecureDevicePropertyStore *v2;
  uint64_t v3;
  NSMutableDictionary *IDToProperty;
  uint64_t v5;
  NSMutableDictionary *propertyToID;
  dispatch_queue_t v7;
  OS_dispatch_queue *dirtyQueue;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)NRSecureDevicePropertyStore;
  v2 = -[NRSecureDevicePropertyStore init](&v10, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v3 = objc_claimAutoreleasedReturnValue();
    IDToProperty = v2->_IDToProperty;
    v2->_IDToProperty = (NSMutableDictionary *)v3;

    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v5 = objc_claimAutoreleasedReturnValue();
    propertyToID = v2->_propertyToID;
    v2->_propertyToID = (NSMutableDictionary *)v5;

    v7 = dispatch_queue_create("com.apple.nanoregistry.nrsecuredevicepropertystore.dirtyqueue", 0);
    dirtyQueue = v2->_dirtyQueue;
    v2->_dirtyQueue = (OS_dispatch_queue *)v7;

    v2->_dirty = 0;
  }
  return v2;
}

+ (id)enclosedClassTypes
{
  void *v2;
  void *v3;

  +[NRMutableDeviceProperty enclosedClassTypes](NRMutableDeviceProperty, "enclosedClassTypes");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setByAddingObject:", objc_opt_class());
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)storeSecureProperty:(id)a3
{
  id v4;
  void *v5;
  NSObject *dirtyQueue;
  _QWORD block[5];

  v4 = a3;
  -[NSMutableDictionary objectForKeyedSubscript:](self->_propertyToID, "objectForKeyedSubscript:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    v5 = (void *)objc_opt_new();
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_IDToProperty, "setObject:forKeyedSubscript:", v4, v5);
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_propertyToID, "setObject:forKeyedSubscript:", v5, v4);
    dirtyQueue = self->_dirtyQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __51__NRSecureDevicePropertyStore_storeSecureProperty___block_invoke;
    block[3] = &unk_1E4494FB8;
    block[4] = self;
    dispatch_async(dirtyQueue, block);
  }

  return v5;
}

uint64_t __51__NRSecureDevicePropertyStore_storeSecureProperty___block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(result + 32) + 32) = 1;
  return result;
}

- (void)removeSecureProperty:(id)a3
{
  id v4;
  void *v5;
  NSObject *dirtyQueue;
  _QWORD block[5];

  v4 = a3;
  -[NSMutableDictionary objectForKeyedSubscript:](self->_IDToProperty, "objectForKeyedSubscript:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    -[NSMutableDictionary removeObjectForKey:](self->_IDToProperty, "removeObjectForKey:", v4);
    -[NSMutableDictionary removeObjectForKey:](self->_propertyToID, "removeObjectForKey:", v5);
    dirtyQueue = self->_dirtyQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __52__NRSecureDevicePropertyStore_removeSecureProperty___block_invoke;
    block[3] = &unk_1E4494FB8;
    block[4] = self;
    dispatch_async(dirtyQueue, block);
  }

}

uint64_t __52__NRSecureDevicePropertyStore_removeSecureProperty___block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(result + 32) + 32) = 1;
  return result;
}

- (id)securePropertyForID:(id)a3
{
  return (id)-[NSMutableDictionary objectForKeyedSubscript:](self->_IDToProperty, "objectForKeyedSubscript:", a3);
}

- (id)allSecurePropertyIDs
{
  return (id)-[NSMutableDictionary allKeys](self->_IDToProperty, "allKeys");
}

- (unint64_t)count
{
  return -[NSMutableDictionary count](self->_IDToProperty, "count");
}

- (void)forceWriteSecurePropertyID:(id)a3 withValue:(id)a4
{
  NSObject *dirtyQueue;
  _QWORD block[5];

  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_IDToProperty, "setObject:forKeyedSubscript:", a4, a3);
  dirtyQueue = self->_dirtyQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __68__NRSecureDevicePropertyStore_forceWriteSecurePropertyID_withValue___block_invoke;
  block[3] = &unk_1E4494FB8;
  block[4] = self;
  dispatch_async(dirtyQueue, block);
}

uint64_t __68__NRSecureDevicePropertyStore_forceWriteSecurePropertyID_withValue___block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(result + 32) + 32) = 1;
  return result;
}

- (void)forceImportSecureProperties:(id)a3
{
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  uint64_t v10;
  void *v11;
  NSObject *dirtyQueue;
  _QWORD block[5];
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (objc_msgSend(v4, "count"))
  {
    v16 = 0u;
    v17 = 0u;
    v14 = 0u;
    v15 = 0u;
    v5 = v4;
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v15;
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v15 != v8)
            objc_enumerationMutation(v5);
          v10 = *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * i);
          objc_msgSend(v5, "objectForKeyedSubscript:", v10);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSMutableDictionary setObject:forKeyedSubscript:](self->_IDToProperty, "setObject:forKeyedSubscript:", v11, v10);
          -[NSMutableDictionary setObject:forKeyedSubscript:](self->_propertyToID, "setObject:forKeyedSubscript:", v10, v11);

        }
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      }
      while (v7);
    }

    dirtyQueue = self->_dirtyQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __59__NRSecureDevicePropertyStore_forceImportSecureProperties___block_invoke;
    block[3] = &unk_1E4494FB8;
    block[4] = self;
    dispatch_async(dirtyQueue, block);
  }

}

uint64_t __59__NRSecureDevicePropertyStore_forceImportSecureProperties___block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(result + 32) + 32) = 1;
  return result;
}

- (BOOL)dirty
{
  NSObject *dirtyQueue;
  char v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  dirtyQueue = self->_dirtyQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __36__NRSecureDevicePropertyStore_dirty__block_invoke;
  v5[3] = &unk_1E4495A48;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(dirtyQueue, v5);
  v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __36__NRSecureDevicePropertyStore_dirty__block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(result + 32) + 32);
  return result;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NRSecureDevicePropertyStore)initWithCoder:(id)a3
{
  id v4;
  NRSecureDevicePropertyStore *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  NSMutableDictionary *IDToProperty;
  NSMutableDictionary *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  uint64_t v18;
  void *v19;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  _QWORD v26[3];

  v26[2] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = -[NRSecureDevicePropertyStore init](self, "init");
  if (v5)
  {
    v6 = (void *)MEMORY[0x1E0C99E60];
    v26[0] = objc_opt_class();
    v26[1] = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v26, 2);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setWithArray:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    +[NRMutableDeviceProperty enclosedClassTypes](NRMutableDeviceProperty, "enclosedClassTypes");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setByAddingObjectsFromSet:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v10, CFSTR("properties"));
    v11 = objc_claimAutoreleasedReturnValue();
    IDToProperty = v5->_IDToProperty;
    v5->_IDToProperty = (NSMutableDictionary *)v11;

    +[NRUnarchivedObjectVerifier unarchivingVerifyObjectIsNotNil:name:owner:](NRUnarchivedObjectVerifier, "unarchivingVerifyObjectIsNotNil:name:owner:", v5->_IDToProperty, CFSTR("NRSecureDevicePropertyStore property dictionary"), v5);
    v23 = 0u;
    v24 = 0u;
    v21 = 0u;
    v22 = 0u;
    v13 = v5->_IDToProperty;
    v14 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v13, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    if (v14)
    {
      v15 = v14;
      v16 = *(_QWORD *)v22;
      do
      {
        for (i = 0; i != v15; ++i)
        {
          if (*(_QWORD *)v22 != v16)
            objc_enumerationMutation(v13);
          v18 = *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * i);
          -[NSMutableDictionary objectForKeyedSubscript:](v5->_IDToProperty, "objectForKeyedSubscript:", v18, (_QWORD)v21);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSMutableDictionary setObject:forKeyedSubscript:](v5->_propertyToID, "setObject:forKeyedSubscript:", v18, v19);

        }
        v15 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v13, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
      }
      while (v15);
    }

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  NSObject *dirtyQueue;
  _QWORD block[5];

  objc_msgSend(a3, "encodeObject:forKey:", self->_IDToProperty, CFSTR("properties"));
  dirtyQueue = self->_dirtyQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __47__NRSecureDevicePropertyStore_encodeWithCoder___block_invoke;
  block[3] = &unk_1E4494FB8;
  block[4] = self;
  dispatch_async(dirtyQueue, block);
}

uint64_t __47__NRSecureDevicePropertyStore_encodeWithCoder___block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(result + 32) + 32) = 0;
  return result;
}

+ (id)classTypes
{
  void *v2;
  void *v3;

  objc_msgSend(a1, "enclosedClassTypes");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setByAddingObject:", objc_opt_class());
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)description
{
  void *v3;
  objc_class *v4;
  uint64_t v5;
  void *v6;
  const __CFString *v7;
  void *v8;
  NSMutableDictionary *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)v5;
  if (self->_dirty)
    v7 = CFSTR("dirty");
  else
    v7 = CFSTR("clean");
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@: is %@\n"), v5, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  v9 = self->_IDToProperty;
  v10 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v20;
    do
    {
      v13 = 0;
      v14 = v8;
      do
      {
        if (*(_QWORD *)v20 != v12)
          objc_enumerationMutation(v9);
        v15 = *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * v13);
        -[NSMutableDictionary objectForKeyedSubscript:](self->_IDToProperty, "objectForKeyedSubscript:", v15);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("\t\t%@ = %@\n"), v15, v16, (_QWORD)v19);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "stringByAppendingString:", v17);
        v8 = (void *)objc_claimAutoreleasedReturnValue();

        ++v13;
        v14 = v8;
      }
      while (v11 != v13);
      v11 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    }
    while (v11);
  }

  return v8;
}

- (unint64_t)countByEnumeratingWithState:(id *)a3 objects:(id *)a4 count:(unint64_t)a5
{
  void *v8;
  unint64_t v9;

  v8 = (void *)-[NSMutableDictionary copy](self->_IDToProperty, "copy");
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", a3, a4, a5);

  return v9;
}

@end
