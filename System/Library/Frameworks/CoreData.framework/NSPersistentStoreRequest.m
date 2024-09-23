@implementation NSPersistentStoreRequest

- (void)dealloc
{
  objc_super v3;

  self->_affectedStores = 0;
  v3.receiver = self;
  v3.super_class = (Class)NSPersistentStoreRequest;
  -[NSPersistentStoreRequest dealloc](&v3, sel_dealloc);
}

- (void)setAffectedStores:(NSArray *)affectedStores
{
  NSArray *v5;
  void *v6;
  unint64_t v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  void *v12;
  unint64_t v13;
  unint64_t v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  uint64_t v18;
  uint64_t v19;
  id v20;
  NSArray *v21;
  _QWORD v22[2];

  v22[1] = *MEMORY[0x1E0C80C00];
  v5 = self->_affectedStores;
  if (byte_1ECD8DE1C)
  {
    if (v5 == affectedStores)
      return;

    if (-[NSArray count](affectedStores, "count"))
    {
      v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithArray:", affectedStores);
      v7 = objc_msgSend(v6, "count");
      v8 = v7;
      if (v7 <= 1)
        v9 = 1;
      else
        v9 = v7;
      if (v7 >= 0x201)
        v10 = 1;
      else
        v10 = v9;
      v11 = (char *)v22 - ((8 * v10 + 15) & 0xFFFFFFFFFFFFFFF0);
      if (v7 >= 0x201)
      {
        v11 = (char *)NSAllocateScannedUncollectable();
        objc_msgSend(v6, "getObjects:", v11);
      }
      else
      {
        bzero((char *)v22 - ((8 * v10 + 15) & 0xFFFFFFFFFFFFFFF0), 8 * v9);
        objc_msgSend(v6, "getObjects:", v11);
        if (!v8)
        {
          self->_affectedStores = 0;

          return;
        }
      }
      v18 = 0;
      v19 = 0;
      do
      {
        v20 = +[_PFWeakReference weakReferenceWithObject:]((uint64_t)_PFWeakReference, *(_QWORD *)&v11[8 * v18]);
        if (v20)
          *(_QWORD *)&v11[8 * v19++] = v20;
        ++v18;
      }
      while (v8 != v18);
      if (v19)
        v21 = (NSArray *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D20]), "initWithObjects:count:", v11, v19);
      else
        v21 = 0;
      self->_affectedStores = v21;

      if (v8 >= 0x201)
        NSZoneFree(0, v11);
    }
    else
    {
      self->_affectedStores = 0;
    }
  }
  else if (v5 != affectedStores)
  {

    if (-[NSArray count](affectedStores, "count") < 2)
    {
      self->_affectedStores = (NSArray *)-[NSArray copy](affectedStores, "copy");
    }
    else
    {
      v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithArray:", affectedStores);
      v13 = objc_msgSend(v12, "count");
      v14 = v13;
      if (v13 <= 1)
        v15 = 1;
      else
        v15 = v13;
      if (v13 >= 0x201)
        v16 = 1;
      else
        v16 = v15;
      v17 = (char *)v22 - ((8 * v16 + 15) & 0xFFFFFFFFFFFFFFF0);
      if (v13 > 0x200)
        v17 = (char *)NSAllocateScannedUncollectable();
      else
        bzero((char *)v22 - ((8 * v16 + 15) & 0xFFFFFFFFFFFFFFF0), 8 * v15);
      objc_msgSend(v12, "getObjects:", v17);
      self->_affectedStores = (NSArray *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D20]), "initWithObjects:count:", v17, v14);

      if (v14 >= 0x201)
        NSZoneFree(0, v17);
    }
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v4;

  v4 = (_QWORD *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  if (v4)
    v4[1] = -[NSArray copy](self->_affectedStores, "copy");
  return v4;
}

+ (void)initialize
{
  objc_opt_self();
}

- (NSArray)affectedStores
{
  NSArray *result;
  id v4;
  NSArray *affectedStores;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  uint64_t v10;
  id WeakRetained;
  void *v12;
  NSArray *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  result = self->_affectedStores;
  if (byte_1ECD8DE1C)
  {
    result = -[NSArray count](result, "count");
    if (result)
    {
      v4 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v14 = 0u;
      v15 = 0u;
      v16 = 0u;
      v17 = 0u;
      affectedStores = self->_affectedStores;
      v6 = -[NSArray countByEnumeratingWithState:objects:count:](affectedStores, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      if (v6)
      {
        v7 = v6;
        v8 = *(_QWORD *)v15;
        do
        {
          for (i = 0; i != v7; ++i)
          {
            if (*(_QWORD *)v15 != v8)
              objc_enumerationMutation(affectedStores);
            v10 = *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * i);
            if (v10)
            {
              WeakRetained = objc_loadWeakRetained((id *)(v10 + 8));
              if (WeakRetained)
              {
                v12 = WeakRetained;
                objc_msgSend(v4, "addObject:", WeakRetained);

              }
            }
          }
          v7 = -[NSArray countByEnumeratingWithState:objects:count:](affectedStores, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
        }
        while (v7);
      }
      v13 = (NSArray *)(id)objc_msgSend(v4, "copy");

      if (-[NSArray count](v13, "count"))
        return v13;
      else
        return 0;
    }
  }
  return result;
}

- (BOOL)_secureOperation
{
  return 0;
}

- (NSPersistentStoreRequestType)requestType
{
  objc_opt_class();
  NSRequestConcreteImplementation();
  return 0;
}

@end
