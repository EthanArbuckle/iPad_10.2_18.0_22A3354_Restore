@implementation MTChangeSet

+ (id)dictionaryFromChanges:(id)a3
{
  id v3;
  void *v4;
  id v5;
  _QWORD v7[4];
  id v8;

  v3 = a3;
  v4 = (void *)objc_opt_new();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __37__MTChangeSet_dictionaryFromChanges___block_invoke;
  v7[3] = &unk_1E39CDB28;
  v5 = v4;
  v8 = v5;
  objc_msgSend(v3, "na_each:", v7);

  return v5;
}

void __37__MTChangeSet_dictionaryFromChanges___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  id v4;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v3, "property");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v3, v4);

}

- (MTChangeSet)initWithChanges:(id)a3
{
  id v4;
  void *v5;
  MTChangeSet *v6;

  v4 = a3;
  objc_msgSend((id)objc_opt_class(), "dictionaryFromChanges:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = -[MTChangeSet initWithChangeDictionary:](self, "initWithChangeDictionary:", v5);
  return v6;
}

- (MTChangeSet)initWithChangeDictionary:(id)a3
{
  id v5;
  MTChangeSet *v6;
  MTChangeSet *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  NSSet *changedProperties;
  objc_super v13;

  v5 = a3;
  v13.receiver = self;
  v13.super_class = (Class)MTChangeSet;
  v6 = -[MTChangeSet init](&v13, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_changeDictionary, a3);
    v8 = (void *)MEMORY[0x1E0C99E60];
    objc_msgSend(v5, "allKeys");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setWithArray:", v9);
    v10 = objc_claimAutoreleasedReturnValue();
    changedProperties = v7->_changedProperties;
    v7->_changedProperties = (NSSet *)v10;

  }
  return v7;
}

- (BOOL)_isEqualToChangeSet:(id)a3 checkOriginalValues:(BOOL)a4
{
  _BOOL4 v4;
  MTChangeSet *v6;
  void *v7;
  void *v8;
  char v9;
  void *v10;
  void *v11;
  _QWORD v13[5];
  MTChangeSet *v14;

  v4 = a4;
  v6 = (MTChangeSet *)a3;
  if (self == v6)
  {
    v9 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      if (v4)
      {
        -[MTChangeSet changeDictionary](self, "changeDictionary");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        -[MTChangeSet changeDictionary](v6, "changeDictionary");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = objc_msgSend(v7, "isEqualToDictionary:", v8);
      }
      else
      {
        -[MTChangeSet changedProperties](self, "changedProperties");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        -[MTChangeSet changedProperties](v6, "changedProperties");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v7, "isEqualToSet:", v8))
        {
          -[MTChangeSet changeDictionary](self, "changeDictionary");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "allKeys");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          v13[0] = MEMORY[0x1E0C809B0];
          v13[1] = 3221225472;
          v13[2] = __55__MTChangeSet__isEqualToChangeSet_checkOriginalValues___block_invoke;
          v13[3] = &unk_1E39CDB50;
          v13[4] = self;
          v14 = v6;
          v9 = objc_msgSend(v11, "na_all:", v13);

        }
        else
        {
          v9 = 0;
        }
      }

    }
    else
    {
      v9 = 0;
    }
  }

  return v9;
}

uint64_t __55__MTChangeSet__isEqualToChangeSet_checkOriginalValues___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "changeDictionary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 40), "changeDictionary");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "changedValue");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "changedValue");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v9, "isEqual:", v10);

  return v11;
}

- (BOOL)isEquivalentToChangeSet:(id)a3
{
  return -[MTChangeSet _isEqualToChangeSet:checkOriginalValues:](self, "_isEqualToChangeSet:checkOriginalValues:", a3, 0);
}

- (BOOL)isEqual:(id)a3
{
  return -[MTChangeSet _isEqualToChangeSet:checkOriginalValues:](self, "_isEqualToChangeSet:checkOriginalValues:", a3, 1);
}

- (id)changeSetByAddingChangeSet:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  MTChangeSet *v8;

  v4 = a3;
  -[MTChangeSet changeDictionary](self, "changeDictionary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "mutableCopy");

  objc_msgSend(v4, "changeDictionary");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "addEntriesFromDictionary:", v7);
  v8 = -[MTChangeSet initWithChangeDictionary:](self, "initWithChangeDictionary:", v6);

  return v8;
}

+ (id)changeSetWithChangesFromObject:(id)a3 toObject:(id)a4
{
  return (id)objc_msgSend(a1, "changeSetWithChangesFromObject:toObject:inProperties:", a3, a4, 0);
}

+ (id)changeSetWithChangesFromObject:(id)a3 toObject:(id)a4 inProperties:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  MTChange *v27;
  id v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  void *v35;
  MTChange *v36;
  void *v37;
  void *v39;
  void *v40;
  void *v41;
  objc_class *v42;
  void *v43;
  id v44;
  id v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  _BYTE v54[128];
  _BYTE v55[128];
  uint64_t v56;

  v56 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (v9)
  {
    v42 = (objc_class *)a1;
    v11 = (void *)objc_opt_new();
    v45 = v8;
    objc_msgSend(v11, "encodeObject:forKey:", v8, CFSTR("fromObject"));
    v44 = v9;
    objc_msgSend(v11, "encodeObject:forKey:", v9, CFSTR("toObject"));
    v43 = v11;
    objc_msgSend(v11, "encodedDictionary");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("fromObject"));
    v13 = objc_claimAutoreleasedReturnValue();
    v41 = v12;
    objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("toObject"));
    v14 = objc_claimAutoreleasedReturnValue();
    v40 = (void *)v13;
    +[MTStorageReader _unwrap:](MTStorageReader, "_unwrap:", v13);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v39 = (void *)v14;
    +[MTStorageReader _unwrap:](MTStorageReader, "_unwrap:", v14);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = (void *)objc_opt_new();
    v50 = 0u;
    v51 = 0u;
    v52 = 0u;
    v53 = 0u;
    v18 = v15;
    v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v50, v55, 16);
    if (v19)
    {
      v20 = v19;
      v21 = *(_QWORD *)v51;
      do
      {
        v22 = 0;
        do
        {
          if (*(_QWORD *)v51 != v21)
            objc_enumerationMutation(v18);
          v23 = *(_QWORD *)(*((_QWORD *)&v50 + 1) + 8 * v22);
          if (!v10 || objc_msgSend(v10, "containsObject:", *(_QWORD *)(*((_QWORD *)&v50 + 1) + 8 * v22)))
          {
            objc_msgSend(v18, "objectForKeyedSubscript:", v23);
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v16, "objectForKeyedSubscript:", v23);
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            v26 = v25;
            if (v25 != v24 && (objc_msgSend(v25, "isEqual:", v24) & 1) == 0)
            {
              v27 = -[MTChange initWithProperty:changedValue:originalValue:]([MTChange alloc], "initWithProperty:changedValue:originalValue:", v23, v26, v24);
              objc_msgSend(v17, "addObject:", v27);

            }
          }
          ++v22;
        }
        while (v20 != v22);
        v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v50, v55, 16);
      }
      while (v20);
    }

    v48 = 0u;
    v49 = 0u;
    v46 = 0u;
    v47 = 0u;
    v28 = v16;
    v29 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v46, v54, 16);
    if (v29)
    {
      v30 = v29;
      v31 = *(_QWORD *)v47;
      do
      {
        v32 = 0;
        do
        {
          if (*(_QWORD *)v47 != v31)
            objc_enumerationMutation(v28);
          v33 = *(_QWORD *)(*((_QWORD *)&v46 + 1) + 8 * v32);
          if (!v10 || objc_msgSend(v10, "containsObject:", *(_QWORD *)(*((_QWORD *)&v46 + 1) + 8 * v32)))
          {
            objc_msgSend(v18, "objectForKeyedSubscript:", v33);
            v34 = (void *)objc_claimAutoreleasedReturnValue();

            if (!v34)
            {
              objc_msgSend(v28, "objectForKeyedSubscript:", v33);
              v35 = (void *)objc_claimAutoreleasedReturnValue();
              v36 = -[MTChange initWithProperty:changedValue:originalValue:]([MTChange alloc], "initWithProperty:changedValue:originalValue:", v33, v35, 0);
              objc_msgSend(v17, "addObject:", v36);

            }
          }
          ++v32;
        }
        while (v30 != v32);
        v30 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v46, v54, 16);
      }
      while (v30);
    }

    v37 = (void *)objc_msgSend([v42 alloc], "initWithChanges:", v17);
    v9 = v44;
    v8 = v45;
  }
  else
  {
    v37 = 0;
  }

  return v37;
}

- (NSArray)changes
{
  return -[NSDictionary allValues](self->_changeDictionary, "allValues");
}

- (BOOL)hasChangesInProperties:(id)a3
{
  return -[NSSet intersectsSet:](self->_changedProperties, "intersectsSet:", a3);
}

- (BOOL)hasChangeForProperty:(id)a3
{
  return -[NSSet containsObject:](self->_changedProperties, "containsObject:", a3);
}

- (BOOL)hasChangesInCommonWithChangeSet:(id)a3
{
  NSSet *changedProperties;
  void *v4;

  changedProperties = self->_changedProperties;
  objc_msgSend(a3, "changedProperties");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(changedProperties) = -[NSSet intersectsSet:](changedProperties, "intersectsSet:", v4);

  return (char)changedProperties;
}

- (id)changedValueForProperty:(id)a3 hasProperty:(BOOL *)a4
{
  void *v5;
  void *v6;
  void *v7;

  -[NSDictionary objectForKeyedSubscript:](self->_changeDictionary, "objectForKeyedSubscript:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (a4)
    *a4 = v5 != 0;
  if (v5)
  {
    objc_msgSend(v5, "changedValue");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (id)deserializedChangedValueForProperty:(id)a3 hasProperty:(BOOL *)a4
{
  id v6;
  void *v7;
  MTDictionaryDeserializer *v8;
  void *v9;
  MTDictionaryDeserializer *v10;
  id v11;
  id v13;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  -[MTChangeSet changedValueForProperty:hasProperty:](self, "changedValueForProperty:hasProperty:", v6, a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v8 = [MTDictionaryDeserializer alloc];
    v13 = v6;
    v14[0] = v7;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v14, &v13, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = -[MTStorageReader initWithEncodedDictionary:](v8, "initWithEncodedDictionary:", v9);

    -[MTStorageReader decodeObjectForKey:](v10, "decodeObjectForKey:", v6);
    v11 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v11 = v7;
  }

  return v11;
}

- (id)_deserializer
{
  MTDictionaryDeserializer *v3;
  void *v4;
  MTDictionaryDeserializer *v5;

  v3 = [MTDictionaryDeserializer alloc];
  -[NSDictionary na_dictionaryByMappingValues:](self->_changeDictionary, "na_dictionaryByMappingValues:", &__block_literal_global_29);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[MTStorageReader initWithEncodedDictionary:](v3, "initWithEncodedDictionary:", v4);

  return v5;
}

uint64_t __28__MTChangeSet__deserializer__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  return objc_msgSend(a3, "changedValue");
}

- (id)description
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  -[MTChangeSet changes](self, "changes");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@:%p %@ >"), v4, self, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (NSSet)changedProperties
{
  return self->_changedProperties;
}

- (void)setChangedProperties:(id)a3
{
  objc_storeStrong((id *)&self->_changedProperties, a3);
}

- (NSDictionary)changeDictionary
{
  return self->_changeDictionary;
}

- (void)setChangeDictionary:(id)a3
{
  objc_storeStrong((id *)&self->_changeDictionary, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_changeDictionary, 0);
  objc_storeStrong((id *)&self->_changedProperties, 0);
}

@end
