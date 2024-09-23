@implementation HDSyncAnchorRangeMap

- (HDSyncAnchorRangeMap)initWithCodableSyncAnchorRangeMap:(id)a3 error:(id *)a4
{
  id v6;
  HDSyncAnchorRangeMap *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  HDSyncEntityIdentifier *v15;
  void *v16;
  HDSyncEntityIdentifier *v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  NSObject *v22;
  uint64_t v23;
  uint64_t v24;
  HDSyncAnchorRangeMap *v25;
  const __CFString *v26;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  objc_super v32;
  uint8_t buf[4];
  uint64_t v34;
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v32.receiver = self;
  v32.super_class = (Class)HDSyncAnchorRangeMap;
  v7 = -[HDSyncAnchorRangeMap init](&v32, sel_init);
  if (!v7)
    goto LABEL_22;
  v30 = 0u;
  v31 = 0u;
  v28 = 0u;
  v29 = 0u;
  objc_msgSend(v6, "anchorRanges");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v28, v35, 16);
  if (!v9)
    goto LABEL_21;
  v10 = v9;
  v11 = *(_QWORD *)v29;
  do
  {
    v12 = 0;
    do
    {
      if (*(_QWORD *)v29 != v11)
        objc_enumerationMutation(v8);
      v13 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * v12);
      if (!objc_msgSend(v13, "hasStartAnchor")
        || !objc_msgSend(v13, "hasEndAnchor")
        || !objc_msgSend(v13, "hasEntityType"))
      {
        v26 = CFSTR("Codable sync anchor range %@ does not contain all required fields.");
LABEL_25:
        objc_msgSend(MEMORY[0x1E0CB35C8], "hk_assignError:code:format:", a4, 3, v26, v13);

        v25 = 0;
        goto LABEL_26;
      }
      v14 = objc_msgSend(v13, "startAnchor");
      if (v14 > objc_msgSend(v13, "endAnchor"))
      {
        v26 = CFSTR("Codable sync anchor range %@ has a start anchor after its end anchor.");
        goto LABEL_25;
      }
      if (objc_msgSend(v13, "hasEntityIdentifier"))
      {
        v15 = [HDSyncEntityIdentifier alloc];
        objc_msgSend(v13, "entityIdentifier");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = -[HDSyncEntityIdentifier initWithCodableEntityIdentifier:](v15, "initWithCodableEntityIdentifier:", v16);

        if (v17)
          goto LABEL_15;
      }
      v18 = HDBuiltinSyncEntityClassForType(objc_msgSend(v13, "entityType"));
      if (v18)
      {
        objc_msgSend(v18, "syncEntityIdentifier");
        v17 = (HDSyncEntityIdentifier *)objc_claimAutoreleasedReturnValue();
        if (!v17)
          goto LABEL_16;
LABEL_15:
        v19 = HDSyncAnchorRangeMake(objc_msgSend(v13, "startAnchor"), objc_msgSend(v13, "endAnchor"));
        -[HDSyncAnchorRangeMap setAnchorRange:forSyncEntityIdentifier:](v7, "setAnchorRange:forSyncEntityIdentifier:", v19, v20, v17);

        goto LABEL_16;
      }
      _HKInitializeLogging();
      v21 = (void *)*MEMORY[0x1E0CB5370];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_DEFAULT))
      {
        v22 = v21;
        v23 = objc_msgSend(v13, "entityType");
        *(_DWORD *)buf = 134217984;
        v34 = v23;
        _os_log_impl(&dword_1B7802000, v22, OS_LOG_TYPE_DEFAULT, "Codable sync anchor range contains invalid sync entity type (%lld) which will be ignored.", buf, 0xCu);

      }
LABEL_16:
      ++v12;
    }
    while (v10 != v12);
    v24 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v28, v35, 16);
    v10 = v24;
  }
  while (v24);
LABEL_21:

LABEL_22:
  v25 = v7;
LABEL_26:

  return v25;
}

- (id)copyWithZone:(_NSZone *)a3
{
  HDSyncAnchorRangeMap *v5;
  void *v6;

  v5 = -[HDSyncAnchorRangeMap init](+[HDSyncAnchorRangeMap allocWithZone:](HDSyncAnchorRangeMap, "allocWithZone:"), "init");
  v6 = (void *)-[NSMutableDictionary mutableCopyWithZone:](self->_anchorRangesByEntityIdentifier, "mutableCopyWithZone:", a3);
  if (v5)
    objc_storeStrong((id *)&v5->_anchorRangesByEntityIdentifier, v6);

  return v5;
}

- (id)codableSyncAnchorRangeMap
{
  HDCodableSyncAnchorRangeMap *v3;
  NSMutableDictionary *anchorRangesByEntityIdentifier;
  HDCodableSyncAnchorRangeMap *v5;
  _QWORD v7[4];
  HDCodableSyncAnchorRangeMap *v8;

  v3 = objc_alloc_init(HDCodableSyncAnchorRangeMap);
  anchorRangesByEntityIdentifier = self->_anchorRangesByEntityIdentifier;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __49__HDSyncAnchorRangeMap_codableSyncAnchorRangeMap__block_invoke;
  v7[3] = &unk_1E6D10968;
  v5 = v3;
  v8 = v5;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](anchorRangesByEntityIdentifier, "enumerateKeysAndObjectsUsingBlock:", v7);

  return v5;
}

void __49__HDSyncAnchorRangeMap_codableSyncAnchorRangeMap__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  HDCodableSyncAnchorRange *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  _QWORD *v10;

  v10 = a3;
  v5 = a2;
  v6 = objc_alloc_init(HDCodableSyncAnchorRange);
  if (v10)
  {
    v7 = v10[1];
    v8 = v10[2];
  }
  else
  {
    v8 = 0;
    v7 = 0;
  }
  -[HDCodableSyncAnchorRange setStartAnchor:](v6, "setStartAnchor:", v7);
  -[HDCodableSyncAnchorRange setEndAnchor:](v6, "setEndAnchor:", v8);
  -[HDCodableSyncAnchorRange setEntityType:](v6, "setEntityType:", objc_msgSend(v5, "entityIdentifier"));
  objc_msgSend(v5, "codableEntityIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[HDCodableSyncAnchorRange setEntityIdentifier:](v6, "setEntityIdentifier:", v9);
  objc_msgSend(*(id *)(a1 + 32), "addAnchorRanges:", v6);

}

- (void)setAnchorRange:(HDSyncAnchorRange)a3 forSyncEntityIdentifier:(id)a4
{
  int64_t end;
  int64_t start;
  id v8;
  NSMutableDictionary *v9;
  NSMutableDictionary *anchorRangesByEntityIdentifier;
  _HDSyncAnchorRangeBox *v11;
  HDSyncAnchorRangeMap *v12;
  HDSyncAnchorRangeMap *v13;
  void *v14;
  objc_super v15;

  end = a3.end;
  start = a3.start;
  v8 = a4;
  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HDSyncAnchorRangeMap.m"), 151, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("syncEntityIdentifier != nil"));

  }
  if (!self->_anchorRangesByEntityIdentifier)
  {
    v9 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    anchorRangesByEntityIdentifier = self->_anchorRangesByEntityIdentifier;
    self->_anchorRangesByEntityIdentifier = v9;

  }
  v11 = [_HDSyncAnchorRangeBox alloc];
  if (v11)
  {
    v15.receiver = v11;
    v15.super_class = (Class)_HDSyncAnchorRangeBox;
    v12 = -[HDSyncAnchorRangeMap init](&v15, sel_init);
    v13 = v12;
    if (v12)
    {
      v12->_anchorRangesByEntityIdentifier = (NSMutableDictionary *)start;
      v12[1].super.isa = (Class)end;
    }
  }
  else
  {
    v13 = 0;
  }
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_anchorRangesByEntityIdentifier, "setObject:forKeyedSubscript:", v13, v8);

}

- (BOOL)getAnchorRange:(HDSyncAnchorRange *)a3 forSyncEntityIdentifier:(id)a4
{
  id v7;
  uint64_t v8;
  BOOL v9;
  void *v11;

  v7 = a4;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HDSyncAnchorRangeMap.m"), 162, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("syncEntityIdentifier != nil"));

  }
  -[NSMutableDictionary objectForKeyedSubscript:](self->_anchorRangesByEntityIdentifier, "objectForKeyedSubscript:", v7);
  v8 = objc_claimAutoreleasedReturnValue();
  if (v8)
    *a3 = *(HDSyncAnchorRange *)(v8 + 8);
  v9 = v8 != 0;

  return v9;
}

- (void)enumerateAnchorRangesAndEntityIdentifiersWithBlock:(id)a3
{
  id v4;
  NSMutableDictionary *anchorRangesByEntityIdentifier;
  id v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  anchorRangesByEntityIdentifier = self->_anchorRangesByEntityIdentifier;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __75__HDSyncAnchorRangeMap_enumerateAnchorRangesAndEntityIdentifiersWithBlock___block_invoke;
  v7[3] = &unk_1E6D10990;
  v8 = v4;
  v6 = v4;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](anchorRangesByEntityIdentifier, "enumerateKeysAndObjectsUsingBlock:", v7);

}

uint64_t __75__HDSyncAnchorRangeMap_enumerateAnchorRangesAndEntityIdentifiersWithBlock___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v5 = *(_QWORD *)(a1 + 32);
  if (a3)
  {
    v6 = a3;
    a3 = *(_QWORD *)(a3 + 8);
    v7 = *(_QWORD *)(v6 + 16);
  }
  else
  {
    v7 = 0;
  }
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(v5 + 16))(v5, a2, a3, v7, a4);
}

- (unint64_t)anchorRangeCount
{
  return -[NSMutableDictionary count](self->_anchorRangesByEntityIdentifier, "count");
}

- (void)reset
{
  -[NSMutableDictionary removeAllObjects](self->_anchorRangesByEntityIdentifier, "removeAllObjects");
}

- (id)description
{
  id v3;
  NSMutableDictionary *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  objc_super v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v4 = self->_anchorRangesByEntityIdentifier;
  v5 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v22;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v22 != v7)
          objc_enumerationMutation(v4);
        v9 = *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * v8);
        -[NSMutableDictionary objectForKeyedSubscript:](self->_anchorRangesByEntityIdentifier, "objectForKeyedSubscript:", v9);
        v10 = (_QWORD *)objc_claimAutoreleasedReturnValue();
        if (v10)
        {
          v12 = v10[1];
          v11 = v10[2];
        }
        else
        {
          v11 = 0;
          v12 = 0;
        }

        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@: (%lld, %lld)"), v9, v12, v11);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "addObject:", v13);

        ++v8;
      }
      while (v6 != v8);
      v14 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
      v6 = v14;
    }
    while (v14);
  }

  v15 = (void *)MEMORY[0x1E0CB3940];
  v20.receiver = self;
  v20.super_class = (Class)HDSyncAnchorRangeMap;
  -[HDSyncAnchorRangeMap description](&v20, sel_description);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "componentsJoinedByString:", CFSTR(", "));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "stringWithFormat:", CFSTR("<%@ %@>"), v16, v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  return v18;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  NSMutableDictionary *anchorRangesByEntityIdentifier;
  NSMutableDictionary *v6;
  char v7;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    goto LABEL_5;
  anchorRangesByEntityIdentifier = self->_anchorRangesByEntityIdentifier;
  v6 = (NSMutableDictionary *)v4[1];
  if (anchorRangesByEntityIdentifier == v6)
  {
    v7 = 1;
    goto LABEL_7;
  }
  if (v6)
    v7 = -[NSMutableDictionary isEqual:](anchorRangesByEntityIdentifier, "isEqual:");
  else
LABEL_5:
    v7 = 0;
LABEL_7:

  return v7;
}

- (unint64_t)hash
{
  return -[NSMutableDictionary hash](self->_anchorRangesByEntityIdentifier, "hash");
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
  objc_msgSend(v14, "encodeObject:forKey:", self->_anchorRangesByEntityIdentifier, CFSTR("AnchorRangesByEntityIdentifier"));
  v4 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v5 = self->_anchorRangesByEntityIdentifier;
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
          -[NSMutableDictionary objectForKeyedSubscript:](self->_anchorRangesByEntityIdentifier, "objectForKeyedSubscript:", v10);
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

  objc_msgSend(v14, "encodeObject:forKey:", v4, CFSTR("AnchorRangesByObjectType"));
}

- (HDSyncAnchorRangeMap)initWithCoder:(id)a3
{
  id v4;
  HDSyncAnchorRangeMap *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  NSMutableDictionary *anchorRangesByEntityIdentifier;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  NSMutableDictionary *v15;
  NSMutableDictionary *v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t i;
  void *v22;
  void *v23;
  char isKindOfClass;
  void *v25;
  void *v26;
  id v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  objc_super v33;
  _BYTE v34[128];
  _QWORD v35[3];
  _QWORD v36[5];

  v36[3] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v33.receiver = self;
  v33.super_class = (Class)HDSyncAnchorRangeMap;
  v5 = -[HDSyncAnchorRangeMap init](&v33, sel_init);
  if (v5)
  {
    v6 = (void *)MEMORY[0x1E0C99E60];
    v36[0] = objc_opt_class();
    v36[1] = objc_opt_class();
    v36[2] = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v36, 3);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setWithArray:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v8, CFSTR("AnchorRangesByEntityIdentifier"));
    v9 = objc_claimAutoreleasedReturnValue();
    anchorRangesByEntityIdentifier = v5->_anchorRangesByEntityIdentifier;
    v5->_anchorRangesByEntityIdentifier = (NSMutableDictionary *)v9;

    if (!v5->_anchorRangesByEntityIdentifier)
    {
      v11 = (void *)MEMORY[0x1E0C99E60];
      v35[0] = objc_opt_class();
      v35[1] = objc_opt_class();
      v35[2] = objc_opt_class();
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v35, 3);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setWithArray:", v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = v4;
      objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v13, CFSTR("AnchorRangesByObjectType"));
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      v15 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
      v16 = v5->_anchorRangesByEntityIdentifier;
      v5->_anchorRangesByEntityIdentifier = v15;

      v31 = 0u;
      v32 = 0u;
      v29 = 0u;
      v30 = 0u;
      v17 = v14;
      v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v29, v34, 16);
      if (v18)
      {
        v19 = v18;
        v20 = *(_QWORD *)v30;
        do
        {
          for (i = 0; i != v19; ++i)
          {
            if (*(_QWORD *)v30 != v20)
              objc_enumerationMutation(v17);
            v22 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * i);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              objc_msgSend(v17, "objectForKeyedSubscript:", v22);
              v23 = (void *)objc_claimAutoreleasedReturnValue();
              objc_opt_class();
              isKindOfClass = objc_opt_isKindOfClass();

              if ((isKindOfClass & 1) != 0)
              {
                +[HDSyncEntityIdentifier identifierWithSchema:entity:](HDSyncEntityIdentifier, "identifierWithSchema:entity:", 0, objc_msgSend(v22, "integerValue"));
                v25 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v17, "objectForKeyedSubscript:", v22);
                v26 = (void *)objc_claimAutoreleasedReturnValue();
                -[NSMutableDictionary setObject:forKeyedSubscript:](v5->_anchorRangesByEntityIdentifier, "setObject:forKeyedSubscript:", v26, v25);

              }
            }
          }
          v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v29, v34, 16);
        }
        while (v19);
      }

      v4 = v28;
    }

  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_anchorRangesByEntityIdentifier, 0);
}

@end
