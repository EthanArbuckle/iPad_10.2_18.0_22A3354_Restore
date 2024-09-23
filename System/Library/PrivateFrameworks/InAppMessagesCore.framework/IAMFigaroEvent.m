@implementation IAMFigaroEvent

- (NSString)name
{
  void *v3;
  void *v4;

  -[IAMFigaroEvent payload](self, "payload");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[IAMFigaroEvent serializeFigaroEventProperties:withPrefix:](self, "serializeFigaroEventProperties:withPrefix:", v3, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v4;
}

- (IAMFigaroEvent)initWithFigaroEventProperties:(id)a3
{
  id v4;
  IAMFigaroEvent *v5;
  IAMFigaroEvent *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)IAMFigaroEvent;
  v5 = -[IAMFigaroEvent init](&v8, sel_init);
  v6 = v5;
  if (v5)
  {
    -[IAMFigaroEvent setPayload:](v5, "setPayload:", v4);
    -[IAMFigaroEvent setType:](v6, "setType:", 0);
  }

  return v6;
}

- (id)serializeFigaroEventProperties:(id)a3 withPrefix:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  _QWORD v11[5];
  id v12;
  _QWORD *v13;
  uint64_t *v14;
  _QWORD v15[3];
  char v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, uint64_t);
  void (*v21)(uint64_t);
  __CFString *v22;

  v6 = a3;
  v7 = a4;
  v17 = 0;
  v18 = &v17;
  v19 = 0x3032000000;
  v20 = __Block_byref_object_copy_;
  v21 = __Block_byref_object_dispose_;
  v22 = &stru_24C8848C0;
  v15[0] = 0;
  v15[1] = v15;
  v15[2] = 0x2020000000;
  v16 = 1;
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __60__IAMFigaroEvent_serializeFigaroEventProperties_withPrefix___block_invoke;
  v11[3] = &unk_24C884518;
  v13 = v15;
  v11[4] = self;
  v8 = v7;
  v12 = v8;
  v14 = &v17;
  objc_msgSend(v6, "enumerateKeysAndObjectsUsingBlock:", v11);
  v9 = (id)v18[5];

  _Block_object_dispose(v15, 8);
  _Block_object_dispose(&v17, 8);

  return v9;
}

void __60__IAMFigaroEvent_serializeFigaroEventProperties_withPrefix___block_invoke(_QWORD *a1, void *a2, void *a3)
{
  id v5;
  char isKindOfClass;
  void *v7;
  const __CFString *v8;
  const __CFString *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  id v17;

  v17 = a3;
  v5 = a2;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();
  v7 = (void *)MEMORY[0x24BDD17C8];
  v8 = &stru_24C8848C0;
  if (*(_BYTE *)(*(_QWORD *)(a1[6] + 8) + 24))
    v9 = &stru_24C8848C0;
  else
    v9 = CFSTR("|");
  if ((isKindOfClass & 1) != 0)
  {
    v10 = (void *)a1[4];
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@_"), v5);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v10, "serializeFigaroEventProperties:withPrefix:", v17, v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "stringWithFormat:", CFSTR("%@%@"), v9, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    if (a1[5])
      v8 = (const __CFString *)a1[5];
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@%@%@:%@"), v9, v8, v5, v17);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    *(_BYTE *)(*(_QWORD *)(a1[6] + 8) + 24) = 0;
  }
  objc_msgSend(*(id *)(*(_QWORD *)(a1[7] + 8) + 40), "stringByAppendingString:", v13);
  v14 = objc_claimAutoreleasedReturnValue();
  v15 = *(_QWORD *)(a1[7] + 8);
  v16 = *(void **)(v15 + 40);
  *(_QWORD *)(v15 + 40) = v14;

}

- (void)setType:(int64_t)a3
{
  self->_type = a3;
}

- (void)setPayload:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSDictionary)payload
{
  return self->_payload;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_payload, 0);
}

- (BOOL)matchesWithKey:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  void *v17;
  char v18;

  v4 = (void *)MEMORY[0x24BDBCF20];
  v5 = a3;
  -[IAMFigaroEvent payload](self, "payload");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "allKeys");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setWithArray:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  -[IAMFigaroEvent decomposeKey:](self, "decomposeKey:", v5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = (void *)MEMORY[0x24BDBCF20];
  objc_msgSend(v9, "ruleDestructuredIdentifiers");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "allKeys");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setWithArray:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(v13, "count") || objc_msgSend(v9, "hasPredicates"))
    && objc_msgSend(v13, "isSubsetOfSet:", v8)
    && (objc_msgSend(v9, "ruleDestructuredIdentifiers"),
        v14 = (void *)objc_claimAutoreleasedReturnValue(),
        -[IAMFigaroEvent payload](self, "payload"),
        v15 = (void *)objc_claimAutoreleasedReturnValue(),
        v16 = objc_msgSend(v14, "isSubsetOfDictionary:", v15),
        v15,
        v14,
        v16))
  {
    -[IAMFigaroEvent payload](self, "payload");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v9, "predicatesMatchFigaroEventProperties:", v17);

  }
  else
  {
    v18 = 0;
  }

  return v18;
}

- (id)decomposeKey:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  const __CFString *v7;
  const __CFString *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  const __CFString *v16;
  const __CFString *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  IAMDecomposedKey *v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  void *v32;
  void *v33;
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  v27 = objc_alloc_init(IAMDecomposedKey);
  v24 = v3;
  objc_msgSend(v3, "componentsSeparatedByString:", CFSTR("|"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v28, v34, 16);
  if (v5)
  {
    v6 = v5;
    v7 = CFSTR("\\(");
    v8 = CFSTR("\\)");
    v9 = *(_QWORD *)v29;
    v25 = *(_QWORD *)v29;
    do
    {
      v10 = 0;
      v26 = v6;
      do
      {
        if (*(_QWORD *)v29 != v9)
          objc_enumerationMutation(v4);
        v11 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * v10);
        if (objc_msgSend(v11, "hasPrefix:", v7) && objc_msgSend(v11, "hasSuffix:", v8))
        {
          objc_msgSend(v11, "substringWithRange:", 2, objc_msgSend(v11, "length") - 4);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          -[IAMDecomposedKey addPredicateCondition:](v27, "addPredicateCondition:", v12);
        }
        else
        {
          objc_msgSend(v11, "componentsSeparatedByString:", CFSTR(":"));
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v12, "count") == 2)
          {
            objc_msgSend(v12, "objectAtIndexedSubscript:", 0);
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            if (objc_msgSend(v13, "containsString:", CFSTR("_")))
            {
              objc_msgSend(v13, "componentsSeparatedByString:", CFSTR("_"));
              v14 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v14, "objectAtIndexedSubscript:", 1);
              v15 = (void *)objc_claimAutoreleasedReturnValue();
              v32 = v15;
              objc_msgSend(v12, "objectAtIndexedSubscript:", 1);
              v16 = v8;
              v17 = v7;
              v18 = v4;
              v19 = (void *)objc_claimAutoreleasedReturnValue();
              v33 = v19;
              objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v33, &v32, 1);
              v20 = (void *)objc_claimAutoreleasedReturnValue();

              -[IAMDecomposedKey ruleDestructuredIdentifiers](v27, "ruleDestructuredIdentifiers");
              v21 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v14, "objectAtIndexedSubscript:", 0);
              v22 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v21, "setObject:forKeyedSubscript:", v20, v22);

              v9 = v25;
              v4 = v18;
              v7 = v17;
              v8 = v16;
              v6 = v26;
            }
            else
            {
              objc_msgSend(v12, "objectAtIndexedSubscript:", 1);
              v14 = (void *)objc_claimAutoreleasedReturnValue();
              -[IAMDecomposedKey ruleDestructuredIdentifiers](v27, "ruleDestructuredIdentifiers");
              v20 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v20, "setObject:forKeyedSubscript:", v14, v13);
            }

          }
        }

        ++v10;
      }
      while (v6 != v10);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v28, v34, 16);
    }
    while (v6);
  }

  return v27;
}

- (int64_t)type
{
  return self->_type;
}

@end
