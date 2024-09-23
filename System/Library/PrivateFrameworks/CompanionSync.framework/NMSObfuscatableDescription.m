@implementation NMSObfuscatableDescription

- (NMSObfuscatableDescription)init
{
  NMSObfuscatableDescription *v2;
  NSMutableArray *v3;
  NSMutableArray *items;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)NMSObfuscatableDescription;
  v2 = -[NMSObfuscatableDescription init](&v6, sel_init);
  if (v2)
  {
    v3 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    items = v2->_items;
    v2->_items = v3;

  }
  return v2;
}

- (void)addDescription:(id)a3 value:(id)a4
{
  id v6;
  id v7;
  NMSObfuscatableDescriptionItem *v8;
  id v9;

  v6 = a4;
  v7 = a3;
  -[NMSObfuscatableDescription items](self, "items");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  v8 = -[NMSObfuscatableDescriptionItem initWithPrefix:value:obfuscated:]([NMSObfuscatableDescriptionItem alloc], "initWithPrefix:value:obfuscated:", v7, v6, 0);

  objc_msgSend(v9, "addObject:", v8);
}

- (void)addObfuscatedDescription:(id)a3 value:(id)a4
{
  id v6;
  id v7;
  NMSObfuscatableDescriptionItem *v8;
  id v9;

  v6 = a4;
  v7 = a3;
  -[NMSObfuscatableDescription items](self, "items");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  v8 = -[NMSObfuscatableDescriptionItem initWithPrefix:value:obfuscated:]([NMSObfuscatableDescriptionItem alloc], "initWithPrefix:value:obfuscated:", v7, v6, 1);

  objc_msgSend(v9, "addObject:", v8);
}

- (id)_descriptionObfuscated:(BOOL)a3
{
  _BOOL4 v3;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  BOOL v17;
  void *v18;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v3 = a3;
  v25 = *MEMORY[0x24BDAC8D0];
  v5 = objc_alloc_init(MEMORY[0x24BDD16A8]);
  -[NMSObfuscatableDescription prefixString](self, "prefixString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[NMSObfuscatableDescription prefixString](self, "prefixString");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "appendFormat:", CFSTR("%@\n"), v7);

  }
  objc_msgSend(v5, "appendString:", CFSTR("{\n"));
  v22 = 0u;
  v23 = 0u;
  v20 = 0u;
  v21 = 0u;
  -[NMSObfuscatableDescription items](self, "items");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v21;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v21 != v11)
          objc_enumerationMutation(v8);
        v13 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * v12);
        objc_msgSend(v5, "appendString:", CFSTR("    "));
        objc_msgSend(v13, "prefix");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "appendString:", v14);

        LODWORD(v14) = objc_msgSend(v13, "obfuscated");
        objc_msgSend(v13, "value");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = v15;
        if ((_DWORD)v14)
          v17 = !v3;
        else
          v17 = 1;
        if (v17)
        {
          objc_msgSend(v5, "appendFormat:", CFSTR(": %@\n"), v15);
        }
        else
        {
          _SYObfuscate(v15);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "appendFormat:", CFSTR(": %@\n"), v18);

        }
        ++v12;
      }
      while (v10 != v12);
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    }
    while (v10);
  }

  objc_msgSend(v5, "appendString:", CFSTR("}"));
  return v5;
}

- (id)description
{
  return -[NMSObfuscatableDescription _descriptionObfuscated:](self, "_descriptionObfuscated:", 0);
}

- (id)CPSafeDescription
{
  return -[NMSObfuscatableDescription _descriptionObfuscated:](self, "_descriptionObfuscated:", 1);
}

- (NSString)prefixString
{
  return self->_prefixString;
}

- (void)setPrefixString:(id)a3
{
  objc_storeStrong((id *)&self->_prefixString, a3);
}

- (NSMutableArray)items
{
  return self->_items;
}

- (void)setItems:(id)a3
{
  objc_storeStrong((id *)&self->_items, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_items, 0);
  objc_storeStrong((id *)&self->_prefixString, 0);
}

@end
