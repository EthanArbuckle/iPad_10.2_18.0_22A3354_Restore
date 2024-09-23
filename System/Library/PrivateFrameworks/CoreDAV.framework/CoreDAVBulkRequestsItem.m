@implementation CoreDAVBulkRequestsItem

- (CoreDAVBulkRequestsItem)init
{
  return -[CoreDAVItem initWithNameSpace:andName:](self, "initWithNameSpace:andName:", CFSTR("http://me.com/_namespace/"), CFSTR("crud"));
}

- (id)description
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v3 = objc_alloc_init(MEMORY[0x24BDD16A8]);
  v8.receiver = self;
  v8.super_class = (Class)CoreDAVBulkRequestsItem;
  -[CoreDAVItem description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("[%@]"), v4);

  -[CoreDAVItem payloadAsString](self->_maxResourcesItem, "payloadAsString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CoreDAVItem payloadAsString](self->_maxSizeItem, "payloadAsString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("\n  maxResources %@, maxSize %@"), v5, v6);

  return v3;
}

- (void)addSupportedItem:(id)a3
{
  id v4;
  NSMutableSet *supportedItems;
  NSMutableSet *v6;
  NSMutableSet *v7;
  id v8;

  v4 = a3;
  supportedItems = self->_supportedItems;
  v8 = v4;
  if (!supportedItems)
  {
    v6 = (NSMutableSet *)objc_alloc_init(MEMORY[0x24BDBCEF0]);
    v7 = self->_supportedItems;
    self->_supportedItems = v6;

    v4 = v8;
    supportedItems = self->_supportedItems;
  }
  -[NSMutableSet addObject:](supportedItems, "addObject:", v4);

}

+ (id)copyParseRules
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v15;

  +[CoreDAVItem parseRuleCache](CoreDAVItem, "parseRuleCache");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromClass((Class)a1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKey:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    v15 = objc_alloc(MEMORY[0x24BDBCE70]);
    +[CoreDAVParseRule ruleWithMinimumNumber:maximumNumber:nameSpace:elementName:objectClass:setterMethod:](CoreDAVParseRule, "ruleWithMinimumNumber:maximumNumber:nameSpace:elementName:objectClass:setterMethod:", 0, 1, CFSTR("http://me.com/_namespace/"), CFSTR("max-resources"), objc_opt_class(), sel_setMaxResourcesItem_);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@:%@"), CFSTR("http://me.com/_namespace/"), CFSTR("max-resources"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    +[CoreDAVParseRule ruleWithMinimumNumber:maximumNumber:nameSpace:elementName:objectClass:setterMethod:](CoreDAVParseRule, "ruleWithMinimumNumber:maximumNumber:nameSpace:elementName:objectClass:setterMethod:", 0, 1, CFSTR("http://me.com/_namespace/"), CFSTR("max-size"), objc_opt_class(), sel_setMaxSizeItem_);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@:%@"), CFSTR("http://me.com/_namespace/"), CFSTR("max-size"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    +[CoreDAVParseRule ruleWithMinimumNumber:maximumNumber:nameSpace:elementName:objectClass:setterMethod:](CoreDAVParseRule, "ruleWithMinimumNumber:maximumNumber:nameSpace:elementName:objectClass:setterMethod:", 0, 0x7FFFFFFFLL, CFSTR("http://me.com/_namespace/"), CFSTR("supported"), objc_opt_class(), sel_addSupportedItem_);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@:%@"), CFSTR("http://me.com/_namespace/"), CFSTR("supported"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (void *)objc_msgSend(v15, "initWithObjectsAndKeys:", v6, v7, v8, v9, v10, v11, 0);

    +[CoreDAVItem parseRuleCache](CoreDAVItem, "parseRuleCache");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromClass((Class)a1);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setObject:forKey:", v5, v13);

  }
  return v5;
}

- (NSDictionary)dictRepresentation
{
  id v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD16E0]), "initWithInteger:", -[CoreDAVBulkRequestsItem maxResources](self, "maxResources"));
  objc_msgSend(v3, "setObject:forKey:", v4, CFSTR("max-resources"));
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD16E0]), "initWithInteger:", -[CoreDAVBulkRequestsItem maxSize](self, "maxSize"));
  objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("max-size"));
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD16E0]), "initWithBool:", 1);
  if (-[CoreDAVBulkRequestsItem supportsInsert](self, "supportsInsert"))
    objc_msgSend(v3, "setObject:forKey:", v6, CFSTR("insert"));
  if (-[CoreDAVBulkRequestsItem supportsUpdate](self, "supportsUpdate"))
    objc_msgSend(v3, "setObject:forKey:", v6, CFSTR("update"));
  if (-[CoreDAVBulkRequestsItem supportsDelete](self, "supportsDelete"))
    objc_msgSend(v3, "setObject:forKey:", v6, CFSTR("delete"));

  return (NSDictionary *)v3;
}

- (int64_t)maxResources
{
  void *v2;
  int64_t v3;

  -[CoreDAVItem payloadAsString](self->_maxResourcesItem, "payloadAsString");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "integerValue");

  return v3;
}

- (int64_t)maxSize
{
  void *v2;
  int64_t v3;

  -[CoreDAVItem payloadAsString](self->_maxSizeItem, "payloadAsString");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "integerValue");

  return v3;
}

- (BOOL)supportsItemWithNameSpace:(id)a3 name:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t i;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t j;
  void *v16;
  id v17;
  void *v18;
  uint64_t v19;
  void *v20;
  id v21;
  void *v22;
  int v23;
  void *v24;
  int v25;
  int v26;
  char v27;
  void *v28;
  void *v29;
  void *v30;
  id v32;
  id v33;
  NSMutableSet *obj;
  char v35;
  uint64_t v36;
  uint64_t v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  _BYTE v46[128];
  _BYTE v47[128];
  uint64_t v48;

  v48 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  if (!-[NSMutableSet count](self->_supportedItems, "count"))
  {
    if (!objc_msgSend(v6, "isEqualToString:", CFSTR("http://me.com/_namespace/")))
    {
      v27 = 0;
      goto LABEL_36;
    }
    v21 = v6;
    v22 = v7;
    v23 = objc_msgSend(v7, "isEqualToString:", CFSTR("insert"));
    -[CoreDAVItem name](self, "name");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = objc_msgSend(v24, "isEqualToString:", CFSTR("crud"));
    v26 = v25;
    if (v23)
    {
      if ((v25 & 1) != 0)
      {
        v27 = 1;
      }
      else
      {
        -[CoreDAVItem name](self, "name");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        v27 = objc_msgSend(v29, "isEqualToString:", CFSTR("simple"));

      }
    }
    else
    {

      if (!v26)
      {
        v7 = v22;
        if (objc_msgSend(v22, "isEqualToString:", CFSTR("delete")))
        {
          -[CoreDAVItem name](self, "name");
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          v27 = objc_msgSend(v30, "isEqualToString:", CFSTR("crud"));

        }
        else
        {
          v27 = 0;
        }
        v6 = v21;
        goto LABEL_36;
      }
      -[CoreDAVItem name](self, "name");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = objc_msgSend(CFSTR("crud"), "isEqualToString:", v28);

    }
    v6 = v21;
    v7 = v22;
    goto LABEL_36;
  }
  v32 = v7;
  v33 = v6;
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithCDVNameSpace:andName:", v6, v7);
  v42 = 0u;
  v43 = 0u;
  v44 = 0u;
  v45 = 0u;
  obj = self->_supportedItems;
  v37 = -[NSMutableSet countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v42, v47, 16);
  if (v37)
  {
    v35 = 0;
    v36 = *(_QWORD *)v43;
    do
    {
      for (i = 0; i != v37; ++i)
      {
        if (*(_QWORD *)v43 != v36)
          objc_enumerationMutation(obj);
        v10 = *(void **)(*((_QWORD *)&v42 + 1) + 8 * i);
        v38 = 0u;
        v39 = 0u;
        v40 = 0u;
        v41 = 0u;
        objc_msgSend(v10, "extraChildItems");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v38, v46, 16);
        if (v12)
        {
          v13 = v12;
          v14 = *(_QWORD *)v39;
          while (2)
          {
            for (j = 0; j != v13; ++j)
            {
              if (*(_QWORD *)v39 != v14)
                objc_enumerationMutation(v11);
              v16 = *(void **)(*((_QWORD *)&v38 + 1) + 8 * j);
              v17 = objc_alloc(MEMORY[0x24BDD17C8]);
              objc_msgSend(v16, "nameSpace");
              v18 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v16, "name");
              v19 = objc_claimAutoreleasedReturnValue();
              v20 = (void *)objc_msgSend(v17, "initWithCDVNameSpace:andName:", v18, v19);

              LOBYTE(v19) = objc_msgSend(v8, "isEqualToString:", v20);
              if ((v19 & 1) != 0)
              {
                v35 = 1;
                goto LABEL_17;
              }
            }
            v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v38, v46, 16);
            if (v13)
              continue;
            break;
          }
        }
LABEL_17:

      }
      v37 = -[NSMutableSet countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v42, v47, 16);
    }
    while (v37);
  }
  else
  {
    v35 = 0;
  }

  v27 = v35 & 1;
  v7 = v32;
  v6 = v33;
LABEL_36:

  return v27;
}

- (BOOL)supportsInsert
{
  return -[CoreDAVBulkRequestsItem supportsItemWithNameSpace:name:](self, "supportsItemWithNameSpace:name:", CFSTR("http://me.com/_namespace/"), CFSTR("insert"));
}

- (BOOL)supportsUpdate
{
  return -[CoreDAVBulkRequestsItem supportsItemWithNameSpace:name:](self, "supportsItemWithNameSpace:name:", CFSTR("http://me.com/_namespace/"), CFSTR("update"));
}

- (BOOL)supportsDelete
{
  return -[CoreDAVBulkRequestsItem supportsItemWithNameSpace:name:](self, "supportsItemWithNameSpace:name:", CFSTR("http://me.com/_namespace/"), CFSTR("delete"));
}

- (CoreDAVLeafItem)maxResourcesItem
{
  return self->_maxResourcesItem;
}

- (void)setMaxResourcesItem:(id)a3
{
  objc_storeStrong((id *)&self->_maxResourcesItem, a3);
}

- (CoreDAVLeafItem)maxSizeItem
{
  return self->_maxSizeItem;
}

- (void)setMaxSizeItem:(id)a3
{
  objc_storeStrong((id *)&self->_maxSizeItem, a3);
}

- (NSSet)supportedItems
{
  return &self->_supportedItems->super;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_supportedItems, 0);
  objc_storeStrong((id *)&self->_maxSizeItem, 0);
  objc_storeStrong((id *)&self->_maxResourcesItem, 0);
}

@end
