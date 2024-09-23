@implementation PHMemoryPropertySet

- (PHMemoryPropertySet)initWithFetchDictionary:(id)a3 memory:(id)a4 prefetched:(BOOL)a5
{
  id v7;
  id v8;
  PHMemoryPropertySet *v9;
  id v10;

  v7 = a3;
  v8 = a4;
  v9 = self;
  PLAbstractMethodException();
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v10);
}

- (PHMemory)memory
{
  return (PHMemory *)objc_loadWeakRetained((id *)&self->_memory);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_memory);
}

+ (NSString)propertySetName
{
  id v2;
  id v3;

  v2 = a1;
  PLAbstractMethodException();
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v3);
}

+ (id)propertiesToFetch
{
  id v2;
  id v3;

  v2 = a1;
  PLAbstractMethodException();
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v3);
}

+ (id)entityName
{
  id v2;
  id v3;

  v2 = a1;
  PLAbstractMethodException();
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v3);
}

+ (id)keyPathFromPrimaryObject
{
  id v2;
  id v3;

  v2 = a1;
  PLAbstractMethodException();
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v3);
}

+ (id)keyPathToPrimaryObject
{
  id v2;
  id v3;

  v2 = a1;
  PLAbstractMethodException();
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v3);
}

+ (BOOL)isToMany
{
  return 0;
}

+ (id)propertiesToPrefetch
{
  pl_dispatch_once();
  return (id)propertiesToPrefetch_propertiesToPrefetch;
}

void __43__PHMemoryPropertySet_propertiesToPrefetch__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  id v12;
  void *v13;
  uint64_t v14;
  void *v15;
  id v16;
  void *v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "propertiesToFetch");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "keyPathFromPrimaryObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    objc_msgSend(*(id *)(a1 + 32), "keyPathFromPrimaryObject");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "stringByAppendingString:", CFSTR("."));
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    v20 = 0u;
    v21 = 0u;
    v18 = 0u;
    v19 = 0u;
    v17 = v3;
    v7 = v3;
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v19;
      do
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v19 != v10)
            objc_enumerationMutation(v7);
          v12 = *(id *)(*((_QWORD *)&v18 + 1) + 8 * i);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Trying to create a property path '%@' on '%@' with an unexpected property type: %@"), v12, *(_QWORD *)(a1 + 32), objc_opt_class());
            objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99768], objc_claimAutoreleasedReturnValue(), 0);
            v16 = (id)objc_claimAutoreleasedReturnValue();
            objc_exception_throw(v16);
          }
          objc_msgSend(v6, "stringByAppendingString:", v12);
          v13 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v2, "addObject:", v13);
        }
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
      }
      while (v9);
    }

    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithArray:", v2);
    v14 = objc_claimAutoreleasedReturnValue();
    v15 = (void *)propertiesToPrefetch_propertiesToPrefetch;
    propertiesToPrefetch_propertiesToPrefetch = v14;

    v3 = v17;
  }
  else
  {
    objc_storeStrong((id *)&propertiesToPrefetch_propertiesToPrefetch, v3);
  }

}

@end
