@implementation CCSerializedSetEnumerator

- (CCSerializedSetEnumerator)init
{
  id v2;

  objc_msgSend(MEMORY[0x24BDBCE88], "exceptionWithName:reason:userInfo:", *MEMORY[0x24BDBCAB0], CFSTR("init unsupported"), MEMORY[0x24BDBD1B8]);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v2);
}

- (CCSerializedSetEnumerator)initWithSerializedSetData:(id)a3
{
  id v5;
  CCSerializedSetEnumerator *v6;
  CCSerializedSetEnumerator *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CCSerializedSetEnumerator;
  v6 = -[CCSerializedSetEnumerator init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_serializedSetData, a3);

  return v7;
}

- (CCSerializedSetEnumerator)initWithSerializedSets:(id)a3
{
  id v5;
  CCSerializedSetEnumerator *v6;
  CCSerializedSetEnumerator *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CCSerializedSetEnumerator;
  v6 = -[CCSerializedSetEnumerator init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_serializedSets, a3);

  return v7;
}

- (BOOL)enumerateAllSets:(id *)a3 usingBlock:(id)a4
{
  return -[CCSerializedSetEnumerator enumerateAllSets:itemType:usingBlock:](self, "enumerateAllSets:itemType:usingBlock:", a3, (unsigned __int16)CCTypeIdentifierUnknown, a4);
}

- (BOOL)enumerateAllSets:(id *)a3 itemType:(unsigned __int16)a4 usingBlock:(id)a5
{
  int v5;
  void (**v8)(id, void *);
  NSArray *v9;
  NSArray *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  CCSerializedSet *v15;
  CCSerializedSet *v16;
  NSArray *serializedSets;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t j;
  void *v22;
  void *v23;
  BOOL v25;
  CCSerializedSetEnumerator *v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  _BYTE v36[128];
  _BYTE v37[128];
  uint64_t v38;

  v5 = a4;
  v38 = *MEMORY[0x24BDAC8D0];
  v8 = (void (**)(id, void *))a5;
  if (self->_serializedSetData)
  {
    v9 = (NSArray *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", -[NSArray count](self->_serializedSetData, "count"));
    v32 = 0u;
    v33 = 0u;
    v34 = 0u;
    v35 = 0u;
    v27 = self;
    v10 = self->_serializedSetData;
    v11 = -[NSArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v32, v37, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v33;
      while (2)
      {
        for (i = 0; i != v12; ++i)
        {
          if (*(_QWORD *)v33 != v13)
            objc_enumerationMutation(v10);
          v15 = -[CCSerializedSet initWithData:error:]([CCSerializedSet alloc], "initWithData:error:", *(_QWORD *)(*((_QWORD *)&v32 + 1) + 8 * i), a3);
          if (!v15)
          {

            v25 = 0;
            goto LABEL_26;
          }
          v16 = v15;
          -[NSArray addObject:](v9, "addObject:", v15);

        }
        v12 = -[NSArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v32, v37, 16);
        if (v12)
          continue;
        break;
      }
    }

    self = v27;
    serializedSets = v27->_serializedSets;
    v27->_serializedSets = v9;

  }
  v30 = 0u;
  v31 = 0u;
  v28 = 0u;
  v29 = 0u;
  v9 = self->_serializedSets;
  v18 = -[NSArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v28, v36, 16);
  if (v18)
  {
    v19 = v18;
    v20 = *(_QWORD *)v29;
    do
    {
      for (j = 0; j != v19; ++j)
      {
        if (*(_QWORD *)v29 != v20)
          objc_enumerationMutation(v9);
        v22 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * j);
        v23 = (void *)MEMORY[0x23B82079C]();
        if (objc_msgSend(v22, "itemType") == v5 || (unsigned __int16)CCTypeIdentifierUnknown == v5)
          v8[2](v8, v22);
        objc_autoreleasePoolPop(v23);
      }
      v19 = -[NSArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v28, v36, 16);
    }
    while (v19);
  }
  v25 = 1;
LABEL_26:

  return v25;
}

- (id)allSets:(id *)a3
{
  return -[CCSerializedSetEnumerator allSetsWithItemType:error:](self, "allSetsWithItemType:error:", (unsigned __int16)CCTypeIdentifierUnknown, a3);
}

- (id)allSetsWithItemType:(unsigned __int16)a3 error:(id *)a4
{
  uint64_t v5;
  id v7;
  id v8;
  id v9;
  _QWORD v11[4];
  id v12;

  v5 = a3;
  v7 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __55__CCSerializedSetEnumerator_allSetsWithItemType_error___block_invoke;
  v11[3] = &unk_250990328;
  v8 = v7;
  v12 = v8;
  LODWORD(a4) = -[CCSerializedSetEnumerator enumerateAllSets:itemType:usingBlock:](self, "enumerateAllSets:itemType:usingBlock:", a4, v5, v11);

  if ((_DWORD)a4)
    v9 = v8;
  else
    v9 = 0;

  return v9;
}

uint64_t __55__CCSerializedSetEnumerator_allSetsWithItemType_error___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "addObject:", a2);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serializedSets, 0);
  objc_storeStrong((id *)&self->_serializedSetData, 0);
}

@end
