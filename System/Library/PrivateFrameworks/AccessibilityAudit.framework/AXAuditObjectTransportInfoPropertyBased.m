@implementation AXAuditObjectTransportInfoPropertyBased

- (AXAuditObjectTransportInfoPropertyBased)initWithClass:(Class)a3 transportKey:(id)a4
{
  AXAuditObjectTransportInfoPropertyBased *v5;
  AXAuditObjectTransportInfoPropertyBased *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)AXAuditObjectTransportInfoPropertyBased;
  v5 = -[AXAuditObjectTransportInfo initWithTransportKey:](&v8, sel_initWithTransportKey_, a4);
  v6 = v5;
  if (v5)
  {
    objc_storeStrong((id *)&v5->_entryClass, a3);
    -[AXAuditObjectTransportInfoPropertyBased _initializeBlocks](v6, "_initializeBlocks");
  }
  return v6;
}

- (NSArray)propertyEntries
{
  void *v2;
  void *v3;

  -[AXAuditObjectTransportInfoPropertyBased _propertyEntries](self, "_propertyEntries");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(v2, "copy");

  return (NSArray *)v3;
}

- (AXAuditObjectTransportInfoPropertyBased)init
{
  AXAuditObjectTransportInfoPropertyBased *v2;
  uint64_t v3;
  NSMutableArray *propertyEntries;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)AXAuditObjectTransportInfoPropertyBased;
  v2 = -[AXAuditObjectTransportInfoPropertyBased init](&v6, sel_init);
  if (v2)
  {
    v3 = objc_opt_new();
    propertyEntries = v2->__propertyEntries;
    v2->__propertyEntries = (NSMutableArray *)v3;

  }
  return v2;
}

- (void)_initializeBlocks
{
  uint64_t v3;
  _QWORD v4[4];
  id v5;
  _QWORD v6[4];
  id v7;
  _QWORD v8[5];
  id location;

  objc_initWeak(&location, self);
  v3 = MEMORY[0x24BDAC760];
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __60__AXAuditObjectTransportInfoPropertyBased__initializeBlocks__block_invoke;
  v8[3] = &unk_25071A6D0;
  v8[4] = self;
  -[AXAuditObjectTransportInfo setCanEncodeObjectBlock:](self, "setCanEncodeObjectBlock:", v8);
  v6[0] = v3;
  v6[1] = 3221225472;
  v6[2] = __60__AXAuditObjectTransportInfoPropertyBased__initializeBlocks__block_invoke_2;
  v6[3] = &unk_25071A6F8;
  objc_copyWeak(&v7, &location);
  -[AXAuditObjectTransportInfo setCreateLocalObjectBlock:](self, "setCreateLocalObjectBlock:", v6);
  v4[0] = v3;
  v4[1] = 3221225472;
  v4[2] = __60__AXAuditObjectTransportInfoPropertyBased__initializeBlocks__block_invoke_3;
  v4[3] = &unk_25071A720;
  objc_copyWeak(&v5, &location);
  -[AXAuditObjectTransportInfo setCreateTransportObjectBlock:](self, "setCreateTransportObjectBlock:", v4);
  objc_destroyWeak(&v5);
  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);
}

uint64_t __60__AXAuditObjectTransportInfoPropertyBased__initializeBlocks__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  char isKindOfClass;

  if (a2)
  {
    v2 = *(void **)(a1 + 32);
    v3 = a2;
    objc_msgSend(v2, "entryClass");
    isKindOfClass = objc_opt_isKindOfClass();

  }
  else
  {
    isKindOfClass = 0;
  }
  return isKindOfClass & 1;
}

objc_class *__60__AXAuditObjectTransportInfoPropertyBased__initializeBlocks__block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  id *v4;
  id WeakRetained;
  objc_class *v6;
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  void *v15;
  void (**v16)(_QWORD, _QWORD, _QWORD);
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v4 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v6 = (objc_class *)objc_msgSend(WeakRetained, "entryClass");

  if (v6)
  {
    v6 = (objc_class *)objc_alloc_init(v6);
    v18 = 0u;
    v19 = 0u;
    v20 = 0u;
    v21 = 0u;
    v7 = objc_loadWeakRetained(v4);
    objc_msgSend(v7, "propertyEntries", 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v19;
      do
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v19 != v11)
            objc_enumerationMutation(v8);
          v13 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * i);
          objc_msgSend(v13, "transportKey");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v3, "objectForKeyedSubscript:", v14);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "populateLocalObjectWithTransportValue");
          v16 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
          ((void (**)(_QWORD, objc_class *, void *))v16)[2](v16, v6, v15);

        }
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
      }
      while (v10);
    }

  }
  return v6;
}

id __60__AXAuditObjectTransportInfoPropertyBased__initializeBlocks__block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id WeakRetained;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void (**v12)(_QWORD, _QWORD);
  void *v13;
  void *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v4 = (void *)objc_opt_new();
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "propertyEntries", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v17;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v17 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
        objc_msgSend(v11, "localValueToTransportValue");
        v12 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
        ((void (**)(_QWORD, id))v12)[2](v12, v3);
        v13 = (void *)objc_claimAutoreleasedReturnValue();

        if (v13)
        {
          objc_msgSend(v11, "transportKey");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "setObject:forKeyedSubscript:", v13, v14);

        }
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v8);
  }

  return v4;
}

- (void)addPropertyEntry:(id)a3
{
  id v4;
  id v5;

  if (a3)
  {
    v4 = a3;
    -[AXAuditObjectTransportInfoPropertyBased _propertyEntries](self, "_propertyEntries");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObject:", v4);

  }
}

- (Class)entryClass
{
  return self->_entryClass;
}

- (void)setEntryClass:(Class)a3
{
  objc_storeStrong((id *)&self->_entryClass, a3);
}

- (NSMutableArray)_propertyEntries
{
  return self->__propertyEntries;
}

- (void)set_propertyEntries:(id)a3
{
  objc_storeStrong((id *)&self->__propertyEntries, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__propertyEntries, 0);
  objc_storeStrong((id *)&self->_entryClass, 0);
}

@end
