@implementation MTURLDeresAction

- (MTURLDeresAction)initWithField:(id)a3 configDictionary:(id)a4
{
  id v6;
  MTURLDeresAction *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  objc_super v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v6 = a4;
  v24.receiver = self;
  v24.super_class = (Class)MTURLDeresAction;
  v7 = -[MTTreatmentAction initWithField:configDictionary:](&v24, sel_initWithField_configDictionary_, a3, v6);
  if (v7)
  {
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("scope"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[MTURLDeresAction setScope:](v7, "setScope:", v8);

    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("allowedParams"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v10 = v9;
      objc_msgSend(MEMORY[0x24BDBCED8], "dictionaryWithCapacity:", objc_msgSend(v10, "count"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = 0u;
      v21 = 0u;
      v22 = 0u;
      v23 = 0u;
      v12 = v10;
      v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
      if (v13)
      {
        v14 = v13;
        v15 = *(_QWORD *)v21;
        v16 = MEMORY[0x24BDBD1B8];
        do
        {
          v17 = 0;
          do
          {
            if (*(_QWORD *)v21 != v15)
              objc_enumerationMutation(v12);
            objc_msgSend(v11, "setObject:forKeyedSubscript:", v16, *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * v17++), (_QWORD)v20);
          }
          while (v14 != v17);
          v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
        }
        while (v14);
      }

      v18 = (void *)objc_msgSend(v11, "copy");
      -[MTURLDeresAction setAllowedParams:](v7, "setAllowedParams:", v18);

    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        -[MTURLDeresAction setAllowedParams:](v7, "setAllowedParams:", v9);
    }

  }
  return v7;
}

- (id)performAction:(id)a3 context:(id)a4
{
  void *v5;
  void *v6;
  void *v7;
  int v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  void *v15;
  void *v17;
  void *v18;
  int v19;
  void *v20;
  void *v21;
  objc_super v22;

  v22.receiver = self;
  v22.super_class = (Class)MTURLDeresAction;
  -[MTTreatmentAction performAction:context:](&v22, sel_performAction_context_, a3, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD1808], "componentsWithString:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[MTURLDeresAction scope](self, "scope");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "isEqualToString:", CFSTR("hostname"));

    if (v8)
    {
      objc_msgSend(v6, "host");
      v9 = objc_claimAutoreleasedReturnValue();
LABEL_10:
      v10 = (void *)v9;

      goto LABEL_11;
    }
    objc_msgSend(v6, "setPassword:", 0);
    objc_msgSend(v6, "setUser:", 0);
    -[MTURLDeresAction scope](self, "scope");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v11, "isEqualToString:", CFSTR("urlWithoutParams")))
    {

    }
    else
    {
      -[MTURLDeresAction scope](self, "scope");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v12, "isEqualToString:", CFSTR("fullWithoutParams"));

      if (!v13)
      {
        -[MTURLDeresAction scope](self, "scope");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v17, "isEqualToString:", CFSTR("urlWithoutPath")))
        {

        }
        else
        {
          -[MTURLDeresAction scope](self, "scope");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          v19 = objc_msgSend(v18, "isEqualToString:", CFSTR("fullWithoutPath"));

          if (!v19)
            goto LABEL_9;
        }
        objc_msgSend(v6, "setFragment:", 0);
        objc_msgSend(v6, "queryItems");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        -[MTURLDeresAction allowedQueryItemsFromItems:](self, "allowedQueryItemsFromItems:", v20);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "setQueryItems:", v21);

        objc_msgSend(v6, "setPath:", 0);
        goto LABEL_9;
      }
    }
    objc_msgSend(v6, "setFragment:", 0);
    objc_msgSend(v6, "queryItems");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[MTURLDeresAction allowedQueryItemsFromItems:](self, "allowedQueryItemsFromItems:", v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setQueryItems:", v15);

LABEL_9:
    objc_msgSend(v6, "string");
    v9 = objc_claimAutoreleasedReturnValue();
    goto LABEL_10;
  }
  v10 = 0;
LABEL_11:

  return v10;
}

- (id)allowedQueryItemsFromItems:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  _QWORD v12[5];

  v4 = a3;
  -[MTURLDeresAction allowedParams](self, "allowedParams");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v5, "count"))
  {

    goto LABEL_8;
  }
  v6 = objc_msgSend(v4, "count");

  if (!v6)
  {
LABEL_8:
    v10 = 0;
    goto LABEL_9;
  }
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __47__MTURLDeresAction_allowedQueryItemsFromItems___block_invoke;
  v12[3] = &unk_24C7A0D90;
  v12[4] = self;
  objc_msgSend(MEMORY[0x24BDD1758], "predicateWithBlock:", v12);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "filteredArrayUsingPredicate:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v8, "count"))
    v9 = v8;
  else
    v9 = 0;
  v10 = v9;

  v4 = v8;
LABEL_9:

  return v10;
}

uint64_t __47__MTURLDeresAction_allowedQueryItemsFromItems___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "allowedParams");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("allowedValues"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v3, "value");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v7, "containsObject:", v8);

    }
    else
    {
      v9 = 1;
    }

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (NSString)scope
{
  return self->_scope;
}

- (void)setScope:(id)a3
{
  objc_storeStrong((id *)&self->_scope, a3);
}

- (NSDictionary)allowedParams
{
  return self->_allowedParams;
}

- (void)setAllowedParams:(id)a3
{
  objc_storeStrong((id *)&self->_allowedParams, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_allowedParams, 0);
  objc_storeStrong((id *)&self->_scope, 0);
}

@end
