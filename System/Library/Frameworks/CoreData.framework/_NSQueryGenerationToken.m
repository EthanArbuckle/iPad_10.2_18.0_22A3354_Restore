@implementation _NSQueryGenerationToken

- (_NSQueryGenerationToken)autorelease
{
  objc_super v2;

  if ((*(_WORD *)&self->_flags & 2) == 0)
  {
    v2.receiver = self;
    v2.super_class = (Class)_NSQueryGenerationToken;
    return -[_NSQueryGenerationToken autorelease](&v2, sel_autorelease);
  }
  return self;
}

- (_NSQueryGenerationToken)retain
{
  objc_super v2;

  if ((*(_WORD *)&self->_flags & 2) == 0)
  {
    v2.receiver = self;
    v2.super_class = (Class)_NSQueryGenerationToken;
    return -[_NSQueryGenerationToken retain](&v2, sel_retain);
  }
  return self;
}

- (_WORD)_generationalComponentForStore:(uint64_t)a1
{
  _WORD *v2;
  __int16 v4;
  uint64_t v5;
  id WeakRetained;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  _WORD *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v2 = (_WORD *)a1;
  v19 = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    v4 = *(_WORD *)(a1 + 32);
    if ((v4 & 1) != 0)
    {
      v16 = 0u;
      v17 = 0u;
      v14 = 0u;
      v15 = 0u;
      v7 = *(void **)(a1 + 24);
      v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      if (v8)
      {
        v9 = v8;
        v10 = *(_QWORD *)v15;
        while (2)
        {
          for (i = 0; i != v9; ++i)
          {
            if (*(_QWORD *)v15 != v10)
              objc_enumerationMutation(v7);
            v12 = (_WORD *)-[_NSQueryGenerationToken _generationalComponentForStore:](*(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * i), a2);
            if (v12)
            {
              v2 = v12;
              if ((v12[16] & 2) == 0)
                return v12;
              return v2;
            }
          }
          v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
          v2 = 0;
          if (v9)
            continue;
          break;
        }
      }
      else
      {
        return 0;
      }
    }
    else if ((v4 & 2) == 0)
    {
      v5 = *(_QWORD *)(a1 + 16);
      if (v5)
        WeakRetained = objc_loadWeakRetained((id *)(v5 + 8));
      else
        WeakRetained = 0;
      if (WeakRetained != a2)
        v2 = 0;

    }
  }
  return v2;
}

- (void)release
{
  objc_super v2;

  if ((*(_WORD *)&self->_flags & 2) == 0)
  {
    v2.receiver = self;
    v2.super_class = (Class)_NSQueryGenerationToken;
    -[_NSQueryGenerationToken release](&v2, sel_release);
  }
}

- (void)dealloc
{
  _PFWeakReference *store;
  id WeakRetained;
  objc_super v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  if ((*(_WORD *)&self->_flags & 0xF) == 4)
  {
    store = self->_store;
    if (store)
      WeakRetained = objc_loadWeakRetained(&store->_object);
    else
      WeakRetained = 0;
    objc_msgSend(WeakRetained, "freeQueryGenerationWithIdentifier:", self->_generationIdentifier);

  }
  self->_storeIdentifier = 0;

  self->_generationIdentifier = 0;
  self->_store = 0;
  v5.receiver = self;
  v5.super_class = (Class)_NSQueryGenerationToken;
  -[_NSQueryGenerationToken dealloc](&v5, sel_dealloc);
}

- (id)persistentStoreCoordinator
{
  __int16 flags;
  id result;
  _PFWeakReference *store;
  id WeakRetained;
  void *v6;
  id generationIdentifier;
  id v8;
  uint64_t v9;
  uint64_t v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  flags = (__int16)self->_flags;
  if ((flags & 0xA) != 0)
    return 0;
  if ((flags & 1) != 0)
  {
    v13 = 0u;
    v14 = 0u;
    v11 = 0u;
    v12 = 0u;
    generationIdentifier = self->_generationIdentifier;
    result = (id)objc_msgSend(generationIdentifier, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    if (result)
    {
      v8 = result;
      v9 = *(_QWORD *)v12;
LABEL_10:
      v10 = 0;
      while (1)
      {
        if (*(_QWORD *)v12 != v9)
          objc_enumerationMutation(generationIdentifier);
        result = (id)objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * v10), "persistentStoreCoordinator");
        if (result)
          break;
        if (v8 == (id)++v10)
        {
          v8 = (id)objc_msgSend(generationIdentifier, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
          result = 0;
          if (v8)
            goto LABEL_10;
          return result;
        }
      }
    }
  }
  else
  {
    store = self->_store;
    if (store)
      WeakRetained = objc_loadWeakRetained(&store->_object);
    else
      WeakRetained = 0;
    v6 = (void *)objc_msgSend(WeakRetained, "_persistentStoreCoordinator");

    return v6;
  }
  return result;
}

- (_QWORD)initWithValue:(void *)a3 store:(int)a4 freeValueOnDealloc:
{
  _QWORD *v6;
  __int16 v7;

  if (!a1)
    return 0;
  v6 = -[_NSQueryGenerationToken _initWithValue:singleton:](a1, a2, 0);
  if (v6)
  {
    if (a3)
    {
      v6[1] = (id)objc_msgSend(a3, "identifier");
      v6[2] = -[_PFWeakReference initWithObject:]([_PFWeakReference alloc], "initWithObject:", a3);
    }
    *((_WORD *)v6 + 16) &= ~1u;
    if (a4)
      v7 = 4;
    else
      v7 = 0;
    *((_WORD *)v6 + 16) = v6[4] & 0xFFFB | v7;
  }
  return v6;
}

- (_QWORD)_initWithValue:(int)a3 singleton:
{
  _QWORD *v5;
  _QWORD *v6;
  __int16 v7;
  objc_super v9;

  if (!a1)
    return 0;
  v9.receiver = a1;
  v9.super_class = (Class)_NSQueryGenerationToken;
  v5 = objc_msgSendSuper2(&v9, sel_init);
  if (v5)
  {
    if (objc_msgSend(a2, "isNSData"))
      v6 = -[_PFSQLiteSnapshotWrapper initWithData:]([_PFSQLiteSnapshotWrapper alloc], a2);
    else
      v6 = a2;
    v5[3] = v6;
    if (a3)
      v7 = 2;
    else
      v7 = 0;
    *((_WORD *)v5 + 16) = v5[4] & 0xFFFD | v7;
    *((_WORD *)v5 + 16) &= ~4u;
    *((_WORD *)v5 + 16) &= ~8u;
  }
  return v5;
}

- (_WORD)_storesForRequestRoutingFrom:(uint64_t *)a3 error:
{
  uint64_t v4;
  _BOOL4 v6;
  _BOOL4 v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  uint64_t v21;
  _BYTE v22[128];
  _QWORD v23[2];
  _QWORD v24[3];

  v24[2] = *MEMORY[0x1E0C80C00];
  if (result)
  {
    v4 = (uint64_t)result;
    if ((result[16] & 8) == 0)
      goto LABEL_9;
    v21 = 0;
    v6 = -[_NSQueryGenerationToken _moor:error:]((uint64_t)result, a2, (uint64_t)&v21);
    v7 = v6;
    if (a3 && !v6)
    {
      v8 = v21;
      if (!v21)
      {
        v9 = (void *)MEMORY[0x1E0CB35C8];
        v10 = *MEMORY[0x1E0CB28A8];
        v23[0] = CFSTR("reason");
        v23[1] = CFSTR("expected stores");
        v24[0] = CFSTR("Can't reattach all stores specified by token");
        v24[1] = -[_NSQueryGenerationToken _expectedStores](v4);
        v8 = objc_msgSend(v9, "errorWithDomain:code:userInfo:", v10, 134060, objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v24, v23, 2));
      }
      *a3 = v8;
    }
    if (!v7)
    {
      return 0;
    }
    else
    {
LABEL_9:
      v11 = (void *)objc_msgSend(a2, "mutableCopy");
      v17 = 0u;
      v18 = 0u;
      v19 = 0u;
      v20 = 0u;
      v12 = objc_msgSend(a2, "countByEnumeratingWithState:objects:count:", &v17, v22, 16);
      if (v12)
      {
        v13 = v12;
        v14 = *(_QWORD *)v18;
        do
        {
          for (i = 0; i != v13; ++i)
          {
            if (*(_QWORD *)v18 != v14)
              objc_enumerationMutation(a2);
            v16 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * i);
            if (!-[_NSQueryGenerationToken _generationalComponentForStore:](v4, v16))
              objc_msgSend(v11, "removeObject:", v16);
          }
          v13 = objc_msgSend(a2, "countByEnumeratingWithState:objects:count:", &v17, v22, 16);
        }
        while (v13);
      }
      return v11;
    }
  }
  return result;
}

+ (uint64_t)identifierIsForNonGenerationalStore:(uint64_t)a1
{
  objc_opt_self();
  return objc_msgSend(CFSTR("unsupported"), "isEqual:", a2);
}

- (_QWORD)initForNonGenerationalStore:(_QWORD *)result
{
  if (result)
    return -[_NSQueryGenerationToken initWithValue:store:freeValueOnDealloc:](result, CFSTR("unsupported"), a2, 0);
  return result;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (_NSQueryGenerationToken)initWithCoder:(id)a3
{
  int v5;
  NSQueryGenerationToken *v6;
  _NSQueryGenerationToken *v7;
  _NSQueryGenerationToken *v8;
  __int16 v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  _QWORD *v17;
  uint64_t v19;
  objc_super v20;

  if (objc_msgSend(a3, "decodeBoolForKey:", CFSTR("NSQueryTokenIsSingleton")))
  {
    v5 = objc_msgSend(a3, "decodeIntForKey:", CFSTR("NSQueryTokenWhichSingleton"));
    if (v5 == 2)
    {
      v6 = +[NSQueryGenerationToken currentQueryGenerationToken](NSQueryGenerationToken, "currentQueryGenerationToken");
    }
    else if (v5 == 1)
    {
      v6 = +[NSQueryGenerationToken nostoresQueryGenerationToken](NSQueryGenerationToken, "nostoresQueryGenerationToken");
    }
    else
    {
      v6 = +[NSQueryGenerationToken unpinnedQueryGenerationToken](NSQueryGenerationToken, "unpinnedQueryGenerationToken");
    }
    v8 = (_NSQueryGenerationToken *)v6;

  }
  else
  {
    v20.receiver = self;
    v20.super_class = (Class)_NSQueryGenerationToken;
    v7 = -[_NSQueryGenerationToken init](&v20, sel_init);
    v8 = v7;
    if (v7)
    {
      *(_WORD *)&v7->_flags &= ~2u;
      v9 = objc_msgSend(a3, "decodeBoolForKey:", CFSTR("NSQueryTokenIsCompound"));
      *(_WORD *)&v8->_flags = *(_WORD *)&v8->_flags & 0xFFFE | v9;
      if ((v9 & 1) != 0)
      {
        v10 = (void *)MEMORY[0x1E0C99E60];
        v11 = objc_opt_class();
        v12 = objc_msgSend(v10, "setWithObjects:", v11, objc_opt_class(), 0, v19);
      }
      else
      {
        v8->_storeIdentifier = (NSString *)(id)objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("NSQueryTokenStoreIdentifier"));
        v13 = (void *)MEMORY[0x1E0C99E60];
        v14 = objc_opt_class();
        v15 = objc_opt_class();
        v12 = objc_msgSend(v13, "setWithObjects:", v14, v15, objc_opt_class(), 0);
      }
      v16 = (void *)objc_msgSend(a3, "decodeObjectOfClasses:forKey:", v12, CFSTR("NSQueryTokenGenerationIdentifier"));
      if (objc_msgSend(v16, "isNSData"))
        v17 = -[_PFSQLiteSnapshotWrapper initWithData:]([_PFSQLiteSnapshotWrapper alloc], v16);
      else
        v17 = v16;
      v8->_generationIdentifier = v17;
      *(_WORD *)&v8->_flags |= 8u;
    }
  }
  return v8;
}

- (void)encodeWithCoder:(id)a3
{
  __int16 flags;
  uint64_t generationIdentifier;
  uint64_t v7;

  objc_msgSend(a3, "encodeBool:forKey:", (*(_WORD *)&self->_flags >> 1) & 1, CFSTR("NSQueryTokenIsSingleton"));
  flags = (__int16)self->_flags;
  if ((flags & 2) != 0)
  {
    if (+[NSQueryGenerationToken nostoresQueryGenerationToken](NSQueryGenerationToken, "nostoresQueryGenerationToken") == self)v7 = 1;
    else
      v7 = 2
         * (+[NSQueryGenerationToken currentQueryGenerationToken](NSQueryGenerationToken, "currentQueryGenerationToken") == (NSQueryGenerationToken *)self);
    objc_msgSend(a3, "encodeInt:forKey:", v7, CFSTR("NSQueryTokenWhichSingleton"));
  }
  else
  {
    objc_msgSend(a3, "encodeBool:forKey:", flags & 1, CFSTR("NSQueryTokenIsCompound"));
    if ((*(_WORD *)&self->_flags & 1) == 0)
      objc_msgSend(a3, "encodeObject:forKey:", self->_storeIdentifier, CFSTR("NSQueryTokenStoreIdentifier"));
    generationIdentifier = (uint64_t)self->_generationIdentifier;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      generationIdentifier = -[_PFSQLiteSnapshotWrapper data](generationIdentifier);
    objc_msgSend(a3, "encodeObject:forKey:", generationIdentifier, CFSTR("NSQueryTokenGenerationIdentifier"));
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v3;
  __int16 v4;
  __int16 v5;
  id v7;
  id generationIdentifier;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  if ((*(_WORD *)&self->_flags & 2) != 0)
    return self;
  v3 = objc_alloc_init((Class)objc_opt_class());
  v4 = *((_WORD *)v3 + 16);
  *((_WORD *)v3 + 16) = v4 & 0xFFFD;
  *((_WORD *)v3 + 16) = v4 & 0xFFFC | *(_WORD *)&self->_flags & 1;
  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    v7 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    generationIdentifier = self->_generationIdentifier;
    v15 = 0u;
    v16 = 0u;
    v17 = 0u;
    v18 = 0u;
    v9 = objc_msgSend(generationIdentifier, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v16;
      do
      {
        v12 = 0;
        do
        {
          if (*(_QWORD *)v16 != v11)
            objc_enumerationMutation(generationIdentifier);
          v13 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * v12), "copy");
          objc_msgSend(v7, "addObject:", v13);

          ++v12;
        }
        while (v10 != v12);
        v10 = objc_msgSend(generationIdentifier, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      }
      while (v10);
    }

    *((_QWORD *)v3 + 3) = v7;
    v5 = *((_WORD *)v3 + 16);
  }
  else
  {

    *((_QWORD *)v3 + 1) = self->_storeIdentifier;
    *((_QWORD *)v3 + 3) = self->_generationIdentifier;
    v5 = *((_WORD *)v3 + 16) & 0xFFFB;
  }
  *((_WORD *)v3 + 16) = v5 | 8;
  return v3;
}

- (BOOL)isEqual:(id)a3
{
  int v5;

  if (self == a3)
  {
    LOBYTE(v5) = 1;
  }
  else
  {
    v5 = objc_msgSend(a3, "isMemberOfClass:", objc_opt_class());
    if (v5)
    {
      if ((*(_WORD *)&self->_flags & 1) == (*((_WORD *)a3 + 16) & 1))
      {
        if ((*(_WORD *)&self->_flags & 1) != 0
          || (v5 = -[NSString isEqual:](self->_storeIdentifier, "isEqual:", *((_QWORD *)a3 + 1))) != 0)
        {
          LOBYTE(v5) = objc_msgSend(self->_generationIdentifier, "isEqual:", *((_QWORD *)a3 + 3));
        }
      }
      else
      {
        LOBYTE(v5) = 0;
      }
    }
  }
  return v5;
}

- (id)description
{
  void *v4;
  id generationIdentifier;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char v9;
  uint64_t i;
  const __CFString *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  if ((*(_WORD *)&self->_flags & 1) == 0)
    return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<NSQueryGenerationToken : %@/%@>"), self->_storeIdentifier, self->_generationIdentifier);
  v4 = (void *)objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithString:", CFSTR("<NSQueryGenerationToken : {"));
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  generationIdentifier = self->_generationIdentifier;
  v6 = objc_msgSend(generationIdentifier, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v13;
    v9 = 1;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v13 != v8)
          objc_enumerationMutation(generationIdentifier);
        if ((v9 & 1) != 0)
          v11 = CFSTR("%p");
        else
          v11 = CFSTR(", %p");
        objc_msgSend(v4, "appendFormat:", v11, *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * i));
        v9 = 0;
      }
      v7 = objc_msgSend(generationIdentifier, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      v9 = 0;
    }
    while (v7);
  }
  objc_msgSend(v4, "appendString:", CFSTR("}>"));
  return v4;
}

- (uint64_t)_expectedStores
{
  __int16 v2;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  if (!a1)
    return 0;
  v2 = *(_WORD *)(a1 + 32);
  if ((v2 & 2) != 0)
    return objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  if ((v2 & 1) == 0)
    return objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithObject:", *(_QWORD *)(a1 + 8));
  v4 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v5 = *(void **)(a1 + 24);
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v11;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v11 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(v4, "addObjectsFromArray:", -[_NSQueryGenerationToken _expectedStores](*(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * i)));
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v7);
  }
  return (uint64_t)v4;
}

- (void)_makeConcrete:(uint64_t)a1
{
  __int16 v3;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    v3 = *(_WORD *)(a1 + 32);
    if ((v3 & 2) == 0)
    {
      if ((v3 & 1) == 0)
      {
        if (!(_DWORD)a2)
        {

          *(_QWORD *)(a1 + 16) = 0;
          return;
        }
        goto LABEL_15;
      }
      v12 = 0u;
      v13 = 0u;
      v10 = 0u;
      v11 = 0u;
      v5 = *(void **)(a1 + 24);
      v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
      if (v6)
      {
        v7 = v6;
        v8 = *(_QWORD *)v11;
        do
        {
          for (i = 0; i != v7; ++i)
          {
            if (*(_QWORD *)v11 != v8)
              objc_enumerationMutation(v5);
            -[_NSQueryGenerationToken _makeConcrete:](*(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * i), a2);
          }
          v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
        }
        while (v7);
      }
      if ((_DWORD)a2)
      {
        v3 = *(_WORD *)(a1 + 32);
LABEL_15:
        *(_WORD *)(a1 + 32) = v3 & 0xFFF7;
      }
    }
  }
}

- (BOOL)_moor:(uint64_t)a3 error:
{
  __int16 v4;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  _BOOL8 v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  uint64_t v19;
  uint64_t v20;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  if (!a1)
    return 0;
  v4 = *(_WORD *)(a1 + 32);
  if ((v4 & 2) == 0)
  {
    if ((v4 & 1) != 0)
    {
      v28 = 0uLL;
      v29 = 0uLL;
      v26 = 0uLL;
      v27 = 0uLL;
      v13 = *(void **)(a1 + 24);
      v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v26, v31, 16);
      if (v14)
      {
        v15 = v14;
        v16 = 0;
        v17 = *(_QWORD *)v27;
        do
        {
          for (i = 0; i != v15; ++i)
          {
            if (*(_QWORD *)v27 != v17)
              objc_enumerationMutation(v13);
            v16 += -[_NSQueryGenerationToken _moor:error:](*(_QWORD *)(*((_QWORD *)&v26 + 1) + 8 * i), a2, a3);
          }
          v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v26, v31, 16);
        }
        while (v15);
      }
      else
      {
        v16 = 0;
      }
      v12 = objc_msgSend(*(id *)(a1 + 24), "count") == v16;
      goto LABEL_30;
    }
    v24 = 0uLL;
    v25 = 0uLL;
    v22 = 0uLL;
    v23 = 0uLL;
    v7 = objc_msgSend(a2, "countByEnumeratingWithState:objects:count:", &v22, v30, 16);
    if (!v7)
    {
LABEL_27:
      v12 = 0;
      goto LABEL_30;
    }
    v8 = v7;
    v9 = *(_QWORD *)v23;
LABEL_6:
    v10 = 0;
    while (1)
    {
      if (*(_QWORD *)v23 != v9)
        objc_enumerationMutation(a2);
      v11 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * v10);
      if (objc_msgSend(*(id *)(a1 + 8), "isEqual:", objc_msgSend(v11, "identifier")))
        break;
      if (v8 == ++v10)
      {
        v8 = objc_msgSend(a2, "countByEnumeratingWithState:objects:count:", &v22, v30, 16);
        v12 = 0;
        if (v8)
          goto LABEL_6;
        goto LABEL_30;
      }
    }
    v19 = objc_msgSend(v11, "reopenQueryGenerationWithIdentifier:error:", *(_QWORD *)(a1 + 24), a3);
    if (!v19)
      goto LABEL_27;
    v20 = v19;
    *(_QWORD *)(a1 + 16) = -[_PFWeakReference initWithObject:]([_PFWeakReference alloc], "initWithObject:", v11);
    if ((objc_msgSend(*(id *)(v20 + 24), "isEqual:", *(_QWORD *)(a1 + 24)) & 1) == 0)
    {

      *(_QWORD *)(a1 + 24) = *(id *)(v20 + 24);
    }
    if ((*(_WORD *)(v20 + 32) & 4) != 0)
    {
      *(_WORD *)(a1 + 32) |= 4u;
      *(_WORD *)(v20 + 32) &= ~4u;
    }
  }
  v12 = 1;
LABEL_30:
  -[_NSQueryGenerationToken _makeConcrete:](a1, v12);
  return v12;
}

@end
