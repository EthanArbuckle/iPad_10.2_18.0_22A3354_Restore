@implementation CUIKObjectGroup

- (CUIKObjectGroup)initWithObjects:(id)a3
{
  id v4;
  CUIKObjectGroup *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)CUIKObjectGroup;
  v5 = -[CUIKObjectGroup init](&v11, sel_init);
  if (v5)
  {
    objc_msgSend((id)objc_opt_class(), "_objectMapForObjects:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[CUIKObjectGroup setOriginalObjectMap:](v5, "setOriginalObjectMap:", v6);

    v7 = (void *)MEMORY[0x1E0C99E08];
    -[CUIKObjectGroup originalObjectMap](v5, "originalObjectMap");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "dictionaryWithDictionary:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[CUIKObjectGroup setObjectMap:](v5, "setObjectMap:", v9);

  }
  return v5;
}

+ (id)_objectMapForObjects:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  void *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v16 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * i);
        v12 = (void *)objc_msgSend(v11, "copy", (_QWORD)v15);
        objc_msgSend(a1, "_identifierForObject:", v11);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "setObject:forKeyedSubscript:", v12, v13);

      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v8);
  }

  return v5;
}

+ (id)_identifierForObject:(id)a3
{
  id v3;
  void *v4;

  v3 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(v3, "eventOccurrenceID");
  else
    objc_msgSend(v3, "uniqueIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (BOOL)_newSeriesSpawnedWithObject:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  void *v17;
  char v18;
  BOOL v19;
  uint64_t v21;
  CUIKObjectGroup *v22;
  uint64_t v23;
  void *v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _BYTE v33[128];
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a3, "uniqueIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  -[CUIKObjectGroup spawnedObjectIdentifiers](self, "spawnedObjectIdentifiers");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "keys");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v23 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v29, v34, 16);
  if (v23)
  {
    v7 = *(_QWORD *)v30;
    v21 = *(_QWORD *)v30;
    v22 = self;
    v24 = v6;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v30 != v7)
          objc_enumerationMutation(v6);
        v9 = *(_QWORD *)(*((_QWORD *)&v29 + 1) + 8 * v8);
        v25 = 0u;
        v26 = 0u;
        v27 = 0u;
        v28 = 0u;
        -[CUIKObjectGroup spawnedObjectIdentifiers](self, "spawnedObjectIdentifiers", v21, v22);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "existingObjectForKey:", v9);
        v11 = (void *)objc_claimAutoreleasedReturnValue();

        v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v25, v33, 16);
        if (v12)
        {
          v13 = v12;
          v14 = *(_QWORD *)v26;
          while (2)
          {
            for (i = 0; i != v13; ++i)
            {
              if (*(_QWORD *)v26 != v14)
                objc_enumerationMutation(v11);
              objc_msgSend(MEMORY[0x1E0CAA118], "recurrenceIdentifierWithString:", *(_QWORD *)(*((_QWORD *)&v25 + 1) + 8 * i));
              v16 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v16, "localUID");
              v17 = (void *)objc_claimAutoreleasedReturnValue();
              v18 = objc_msgSend(v17, "isEqualToString:", v4);

              if ((v18 & 1) != 0)
              {

                v19 = 1;
                v6 = v24;
                goto LABEL_19;
              }
            }
            v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v25, v33, 16);
            if (v13)
              continue;
            break;
          }
        }

        ++v8;
        self = v22;
        v6 = v24;
        v7 = v21;
      }
      while (v8 != v23);
      v19 = 0;
      v23 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v29, v34, 16);
    }
    while (v23);
  }
  else
  {
    v19 = 0;
  }
LABEL_19:

  return v19;
}

- (BOOL)objectsBelongInGroup:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  _BOOL4 v14;
  BOOL v15;
  void *v16;
  uint64_t v17;
  uint64_t v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v4 = a3;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (v5)
  {
    v6 = v5;
    v20 = 0;
    v7 = 0;
    v8 = *(_QWORD *)v22;
    while (2)
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v22 != v8)
          objc_enumerationMutation(v4);
        v10 = *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * i);
        objc_msgSend((id)objc_opt_class(), "_identifierForObject:", v10);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        -[CUIKObjectGroup originalObjectMap](self, "originalObjectMap");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "objectForKeyedSubscript:", v11);
        v13 = (void *)objc_claimAutoreleasedReturnValue();

        if (v13)
        {
          ++v7;

        }
        else
        {
          v14 = -[CUIKObjectGroup _newSeriesSpawnedWithObject:](self, "_newSeriesSpawnedWithObject:", v10);

          if (!v14)
          {

            v15 = 0;
            goto LABEL_21;
          }
          ++v20;
        }
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
      if (v6)
        continue;
      break;
    }
  }
  else
  {
    v20 = 0;
    v7 = 0;
  }

  -[CUIKObjectGroup originalObjectMap](self, "originalObjectMap");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "count");

  v15 = v17 == v7 || v17 == v7 + v20;
LABEL_21:

  return v15;
}

- (void)newObject:(id)a3 spawnedFromObject:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;

  v19 = a3;
  v6 = a4;
  objc_msgSend((id)objc_opt_class(), "_identifierForObject:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[CUIKObjectGroup originalObjectMap](self, "originalObjectMap");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKey:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v9)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      if (objc_msgSend(v6, "isMainOccurrence"))
      {
        objc_msgSend(v6, "localUID");
        v10 = objc_claimAutoreleasedReturnValue();

        v7 = (void *)v10;
      }
    }
  }
  -[CUIKObjectGroup originalObjectMap](self, "originalObjectMap");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "objectForKey:", v7);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    objc_msgSend((id)objc_opt_class(), "_identifierForObject:", v19);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v13, "isEqualToString:", v7) & 1) == 0)
    {
      -[CUIKObjectGroup spawnedObjectIdentifiers](self, "spawnedObjectIdentifiers");
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v14)
      {
        v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D0C2C0]), "initWithDefaultClass:", objc_opt_class());
        -[CUIKObjectGroup setSpawnedObjectIdentifiers:](self, "setSpawnedObjectIdentifiers:", v15);

      }
      -[CUIKObjectGroup spawnedObjectIdentifiers](self, "spawnedObjectIdentifiers");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "objectForKey:", v7);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "addObject:", v13);

      -[CUIKObjectGroup objectMap](self, "objectMap");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "setObject:forKeyedSubscript:", v19, v13);

    }
  }

}

- (id)shiftedOccurrencePreviouslySpawnedByIdentifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  void *i;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  char v15;
  id v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(MEMORY[0x1E0CAA118], "recurrenceIdentifierWithString:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  -[CUIKObjectGroup spawnedObjectIdentifiers](self, "spawnedObjectIdentifiers");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "existingObjectForKey:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = (id)objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v8)
  {
    v17 = v4;
    v9 = *(_QWORD *)v19;
    while (2)
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(_QWORD *)v19 != v9)
          objc_enumerationMutation(v7);
        v11 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * (_QWORD)i);
        objc_msgSend(MEMORY[0x1E0CAA118], "recurrenceIdentifierWithString:", v11);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "localUID");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "localUID");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = objc_msgSend(v13, "isEqualToString:", v14);

        if ((v15 & 1) != 0)
        {
          v8 = v11;

          goto LABEL_11;
        }

      }
      v8 = (id)objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
      if (v8)
        continue;
      break;
    }
LABEL_11:
    v4 = v17;
  }

  return v8;
}

- (id)objectIdentifiers
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = (void *)MEMORY[0x1E0C99E60];
  -[CUIKObjectGroup objectMap](self, "objectMap");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "allKeys");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setWithArray:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)objects
{
  void *v2;
  void *v3;

  -[CUIKObjectGroup objectMap](self, "objectMap");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "allValues");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)originalObjects
{
  void *v2;
  void *v3;

  -[CUIKObjectGroup originalObjectMap](self, "originalObjectMap");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "allValues");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  objc_msgSend(MEMORY[0x1E0CB37A0], "string");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CUIKObjectGroup originalObjectMap](self, "originalObjectMap");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "allKeys");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("originalIdentifiers: %@ \n"), v5);

  -[CUIKObjectGroup objectIdentifiers](self, "objectIdentifiers");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("currentIdentifiers: %@ \n"), v6);

  -[CUIKObjectGroup spawnedObjectIdentifiers](self, "spawnedObjectIdentifiers");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    -[CUIKObjectGroup spawnedObjectIdentifiers](self, "spawnedObjectIdentifiers");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "finalDictionary");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "appendFormat:", CFSTR("spawnedIdentifiers: %@"), v9);

  }
  return v3;
}

- (NSDictionary)originalObjectMap
{
  return (NSDictionary *)objc_getProperty(self, a2, 8, 1);
}

- (void)setOriginalObjectMap:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

- (NSMutableDictionary)objectMap
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 16, 1);
}

- (void)setObjectMap:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (CalDefaultDictionary)spawnedObjectIdentifiers
{
  return (CalDefaultDictionary *)objc_getProperty(self, a2, 24, 1);
}

- (void)setSpawnedObjectIdentifiers:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_spawnedObjectIdentifiers, 0);
  objc_storeStrong((id *)&self->_objectMap, 0);
  objc_storeStrong((id *)&self->_originalObjectMap, 0);
}

@end
