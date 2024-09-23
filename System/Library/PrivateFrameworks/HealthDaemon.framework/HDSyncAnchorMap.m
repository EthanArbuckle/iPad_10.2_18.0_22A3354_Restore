@implementation HDSyncAnchorMap

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_anchorsByEntityIdentifier, 0);
}

- (void)setAnchor:(int64_t)a3 forSyncEntity:(Class)a4
{
  void *v8;
  id v9;

  if (!a4)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HDSyncAnchorMap.m"), 68, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("syncEntityClass != Nil"));

  }
  -[objc_class syncEntityIdentifier](a4, "syncEntityIdentifier");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  -[HDSyncAnchorMap setAnchor:forSyncEntityIdentifier:](self, "setAnchor:forSyncEntityIdentifier:", a3, v9);

}

+ (HDSyncAnchorMap)syncAnchorMapWithCodableSyncAnchorRangeMap:(id)a3
{
  id v3;
  HDSyncAnchorMap *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  HDSyncEntityIdentifier *v11;
  void *v12;
  HDSyncEntityIdentifier *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = objc_alloc_init(HDSyncAnchorMap);
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  objc_msgSend(v3, "anchorRanges", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v16;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v16 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * v9);
        v11 = [HDSyncEntityIdentifier alloc];
        objc_msgSend(v10, "entityIdentifier");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = -[HDSyncEntityIdentifier initWithCodableEntityIdentifier:](v11, "initWithCodableEntityIdentifier:", v12);

        -[HDSyncAnchorMap setAnchor:forSyncEntityIdentifier:](v4, "setAnchor:forSyncEntityIdentifier:", objc_msgSend(v10, "endAnchor"), v13);
        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v7);
  }

  return v4;
}

+ (HDSyncAnchorMap)syncAnchorMapWithDictionary:(id)a3
{
  id v3;
  HDSyncAnchorMap *v4;
  HDSyncAnchorMap *v5;
  _QWORD v7[4];
  HDSyncAnchorMap *v8;

  v3 = a3;
  v4 = objc_alloc_init(HDSyncAnchorMap);
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __47__HDSyncAnchorMap_syncAnchorMapWithDictionary___block_invoke;
  v7[3] = &unk_1E6D03920;
  v5 = v4;
  v8 = v5;
  objc_msgSend(v3, "enumerateKeysAndObjectsUsingBlock:", v7);

  return v5;
}

void __47__HDSyncAnchorMap_syncAnchorMapWithDictionary___block_invoke(uint64_t a1, void *a2, void *a3)
{
  void *v4;
  id v5;

  v4 = *(void **)(a1 + 32);
  v5 = a2;
  objc_msgSend(v4, "setAnchor:forSyncEntityIdentifier:", objc_msgSend(a3, "longLongValue"), v5);

}

- (id)codableSyncAnchorRangeMap
{
  HDCodableSyncAnchorRangeMap *v3;
  HDCodableSyncAnchorRangeMap *v4;
  _QWORD v6[4];
  HDCodableSyncAnchorRangeMap *v7;

  v3 = objc_alloc_init(HDCodableSyncAnchorRangeMap);
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __44__HDSyncAnchorMap_codableSyncAnchorRangeMap__block_invoke;
  v6[3] = &unk_1E6CEB578;
  v4 = v3;
  v7 = v4;
  -[HDSyncAnchorMap enumerateAnchorsAndEntityIdentifiersWithBlock:](self, "enumerateAnchorsAndEntityIdentifiersWithBlock:", v6);

  return v4;
}

void __44__HDSyncAnchorMap_codableSyncAnchorRangeMap__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  void *v6;
  HDCodableSyncAnchorRange *v7;

  v5 = a2;
  v7 = objc_alloc_init(HDCodableSyncAnchorRange);
  -[HDCodableSyncAnchorRange setStartAnchor:](v7, "setStartAnchor:", 0);
  -[HDCodableSyncAnchorRange setEndAnchor:](v7, "setEndAnchor:", a3);
  objc_msgSend(v5, "codableEntityIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[HDCodableSyncAnchorRange setEntityIdentifier:](v7, "setEntityIdentifier:", v6);
  objc_msgSend(*(id *)(a1 + 32), "addAnchorRanges:", v7);

}

- (void)setAnchor:(int64_t)a3 forSyncEntityIdentifier:(id)a4
{
  NSMutableDictionary *v6;
  NSMutableDictionary *anchorsByEntityIdentifier;
  void *v8;
  id v9;

  v9 = a4;
  if (!self->_anchorsByEntityIdentifier)
  {
    v6 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    anchorsByEntityIdentifier = self->_anchorsByEntityIdentifier;
    self->_anchorsByEntityIdentifier = v6;

  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_anchorsByEntityIdentifier, "setObject:forKeyedSubscript:", v8, v9);

}

- (int64_t)anchorForSyncEntityClass:(Class)a3
{
  void *v5;
  int64_t v6;
  void *v9;

  if (!a3)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HDSyncAnchorMap.m"), 83, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("syncEntityClass != Nil"));

  }
  -[objc_class syncEntityIdentifier](a3, "syncEntityIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[HDSyncAnchorMap anchorForSyncEntityIdentifier:](self, "anchorForSyncEntityIdentifier:", v5);

  return v6;
}

- (int64_t)anchorForSyncEntityIdentifier:(id)a3
{
  void *v3;
  int64_t v4;

  -[NSMutableDictionary objectForKeyedSubscript:](self->_anchorsByEntityIdentifier, "objectForKeyedSubscript:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "integerValue");

  return v4;
}

- (id)anchorIfPresentForSyncEntityIdentifier:(id)a3
{
  return (id)-[NSMutableDictionary objectForKeyedSubscript:](self->_anchorsByEntityIdentifier, "objectForKeyedSubscript:", a3);
}

- (void)enumerateAnchorsAndEntityIdentifiersWithBlock:(id)a3
{
  id v4;
  NSMutableDictionary *anchorsByEntityIdentifier;
  id v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  anchorsByEntityIdentifier = self->_anchorsByEntityIdentifier;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __65__HDSyncAnchorMap_enumerateAnchorsAndEntityIdentifiersWithBlock___block_invoke;
  v7[3] = &unk_1E6D03948;
  v8 = v4;
  v6 = v4;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](anchorsByEntityIdentifier, "enumerateKeysAndObjectsUsingBlock:", v7);

}

void __65__HDSyncAnchorMap_enumerateAnchorsAndEntityIdentifiersWithBlock___block_invoke(uint64_t a1, void *a2, void *a3, uint64_t a4)
{
  uint64_t v6;
  id v7;

  v6 = *(_QWORD *)(a1 + 32);
  v7 = a2;
  (*(void (**)(uint64_t, id, uint64_t, uint64_t))(v6 + 16))(v6, v7, objc_msgSend(a3, "integerValue"), a4);

}

- (void)setAnchorsFromMap:(id)a3
{
  id v4;
  NSMutableDictionary *anchorsByEntityIdentifier;
  NSMutableDictionary *v6;
  NSMutableDictionary *v7;
  id v8;

  v4 = a3;
  anchorsByEntityIdentifier = self->_anchorsByEntityIdentifier;
  v8 = v4;
  if (!anchorsByEntityIdentifier)
  {
    v6 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    v7 = self->_anchorsByEntityIdentifier;
    self->_anchorsByEntityIdentifier = v6;

    v4 = v8;
    anchorsByEntityIdentifier = self->_anchorsByEntityIdentifier;
  }
  -[NSMutableDictionary addEntriesFromDictionary:](anchorsByEntityIdentifier, "addEntriesFromDictionary:", *((_QWORD *)v4 + 1));

}

- (unint64_t)anchorCount
{
  return -[NSMutableDictionary count](self->_anchorsByEntityIdentifier, "count");
}

- (BOOL)isAllZero
{
  BOOL v3;
  NSMutableDictionary *anchorsByEntityIdentifier;
  _QWORD v6[5];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  char v10;

  v3 = 1;
  if (-[NSMutableDictionary count](self->_anchorsByEntityIdentifier, "count"))
  {
    v7 = 0;
    v8 = &v7;
    v9 = 0x2020000000;
    v10 = 1;
    anchorsByEntityIdentifier = self->_anchorsByEntityIdentifier;
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __28__HDSyncAnchorMap_isAllZero__block_invoke;
    v6[3] = &unk_1E6D03970;
    v6[4] = &v7;
    -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](anchorsByEntityIdentifier, "enumerateKeysAndObjectsUsingBlock:", v6);
    v3 = *((_BYTE *)v8 + 24) != 0;
    _Block_object_dispose(&v7, 8);
  }
  return v3;
}

uint64_t __28__HDSyncAnchorMap_isAllZero__block_invoke(uint64_t a1, uint64_t a2, void *a3, _BYTE *a4)
{
  uint64_t result;

  result = objc_msgSend(a3, "longLongValue");
  if (result)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 0;
    *a4 = 1;
  }
  return result;
}

- (NSString)description
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
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  objc_super v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v3 = (void *)objc_opt_new();
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v4 = self->_anchorsByEntityIdentifier;
  v5 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v19;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v19 != v7)
          objc_enumerationMutation(v4);
        v9 = *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * i);
        -[NSMutableDictionary objectForKeyedSubscript:](self->_anchorsByEntityIdentifier, "objectForKeyedSubscript:", v9);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v10, "integerValue");

        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@: %lld"), v9, v11);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "addObject:", v12);

      }
      v6 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v6);
  }

  v13 = (void *)MEMORY[0x1E0CB3940];
  v17.receiver = self;
  v17.super_class = (Class)HDSyncAnchorMap;
  -[HDSyncAnchorMap description](&v17, sel_description);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "stringWithFormat:", CFSTR("<%@ %@>"), v14, v3);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v15;
}

- (BOOL)isEqual:(id)a3
{
  id *v4;
  NSMutableDictionary *anchorsByEntityIdentifier;
  NSMutableDictionary *v6;
  BOOL v7;

  v4 = (id *)a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    goto LABEL_8;
  anchorsByEntityIdentifier = self->_anchorsByEntityIdentifier;
  v6 = (NSMutableDictionary *)v4[1];
  if (anchorsByEntityIdentifier != v6)
  {
    if (v6)
    {
      if ((-[NSMutableDictionary isEqual:](anchorsByEntityIdentifier, "isEqual:") & 1) != 0)
        goto LABEL_5;
      anchorsByEntityIdentifier = self->_anchorsByEntityIdentifier;
    }
    if (!-[NSMutableDictionary count](anchorsByEntityIdentifier, "count"))
    {
      v7 = objc_msgSend(v4[1], "count") == 0;
      goto LABEL_9;
    }
LABEL_8:
    v7 = 0;
    goto LABEL_9;
  }
LABEL_5:
  v7 = 1;
LABEL_9:

  return v7;
}

- (id)copyWithZone:(_NSZone *)a3
{
  HDSyncAnchorMap *v4;
  uint64_t v5;
  NSMutableDictionary *anchorsByEntityIdentifier;

  v4 = objc_alloc_init(HDSyncAnchorMap);
  v5 = -[NSMutableDictionary mutableCopy](self->_anchorsByEntityIdentifier, "mutableCopy");
  anchorsByEntityIdentifier = v4->_anchorsByEntityIdentifier;
  v4->_anchorsByEntityIdentifier = (NSMutableDictionary *)v5;

  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  NSMutableDictionary *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v14 = a3;
  objc_msgSend(v14, "encodeObject:forKey:", self->_anchorsByEntityIdentifier, CFSTR("AnchorByEntityIdentifier"));
  v4 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v5 = self->_anchorsByEntityIdentifier;
  v6 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v16 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * i);
        objc_msgSend(v10, "schemaIdentifier");
        v11 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v11)
        {
          -[NSMutableDictionary objectForKeyedSubscript:](self->_anchorsByEntityIdentifier, "objectForKeyedSubscript:", v10);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v10, "entityIdentifier"));
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "setObject:forKeyedSubscript:", v12, v13);

        }
      }
      v7 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v7);
  }

  objc_msgSend(v14, "encodeObject:forKey:", v4, CFSTR("AnchorByObjectType"));
}

- (HDSyncAnchorMap)initWithCoder:(id)a3
{
  id v4;
  HDSyncAnchorMap *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  NSMutableDictionary *anchorsByEntityIdentifier;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  NSMutableDictionary *v21;
  NSMutableDictionary *v22;
  void *v23;
  void *v24;
  void *v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  objc_super v31;
  _BYTE v32[128];
  _QWORD v33[2];
  _QWORD v34[5];

  v34[3] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v31.receiver = self;
  v31.super_class = (Class)HDSyncAnchorMap;
  v5 = -[HDSyncAnchorMap init](&v31, sel_init);
  if (v5)
  {
    v6 = (void *)MEMORY[0x1E0C99E60];
    v34[0] = objc_opt_class();
    v34[1] = objc_opt_class();
    v34[2] = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v34, 3);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setWithArray:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v8, CFSTR("AnchorByEntityIdentifier"));
    v9 = objc_claimAutoreleasedReturnValue();
    anchorsByEntityIdentifier = v5->_anchorsByEntityIdentifier;
    v5->_anchorsByEntityIdentifier = (NSMutableDictionary *)v9;

    if (!v5->_anchorsByEntityIdentifier)
    {
      v26 = v8;
      v11 = (void *)MEMORY[0x1E0C99E60];
      v33[0] = objc_opt_class();
      v33[1] = objc_opt_class();
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v33, 2);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setWithArray:", v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v13, CFSTR("AnchorByObjectType"));
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      v29 = 0u;
      v30 = 0u;
      v27 = 0u;
      v28 = 0u;
      v15 = v14;
      v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
      if (v16)
      {
        v17 = v16;
        v18 = *(_QWORD *)v28;
        do
        {
          v19 = 0;
          do
          {
            if (*(_QWORD *)v28 != v18)
              objc_enumerationMutation(v15);
            v20 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * v19);
            if (!v5->_anchorsByEntityIdentifier)
            {
              v21 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
              v22 = v5->_anchorsByEntityIdentifier;
              v5->_anchorsByEntityIdentifier = v21;

            }
            +[HDSyncEntityIdentifier identifierWithSchema:entity:](HDSyncEntityIdentifier, "identifierWithSchema:entity:", 0, objc_msgSend(v20, "integerValue"));
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v15, "objectForKeyedSubscript:", v20);
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            -[NSMutableDictionary setObject:forKeyedSubscript:](v5->_anchorsByEntityIdentifier, "setObject:forKeyedSubscript:", v24, v23);

            ++v19;
          }
          while (v17 != v19);
          v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
        }
        while (v17);
      }

      v8 = v26;
    }

  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (HDSyncAnchorMap)syncAnchorMapWithSyncAnchorRangeMap:(id)a3
{
  id v3;
  HDSyncAnchorMap *v4;
  HDSyncAnchorMap *v5;
  _QWORD v7[4];
  HDSyncAnchorMap *v8;

  v3 = a3;
  v4 = objc_alloc_init(HDSyncAnchorMap);
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __77__HDSyncAnchorMap_HDSyncAnchorRangeMap__syncAnchorMapWithSyncAnchorRangeMap___block_invoke;
  v7[3] = &unk_1E6CEB4E8;
  v5 = v4;
  v8 = v5;
  objc_msgSend(v3, "enumerateAnchorRangesAndEntityIdentifiersWithBlock:", v7);

  return v5;
}

uint64_t __77__HDSyncAnchorMap_HDSyncAnchorRangeMap__syncAnchorMapWithSyncAnchorRangeMap___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return objc_msgSend(*(id *)(a1 + 32), "setAnchor:forSyncEntityIdentifier:", a4, a2);
}

@end
