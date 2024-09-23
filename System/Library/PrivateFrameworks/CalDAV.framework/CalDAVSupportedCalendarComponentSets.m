@implementation CalDAVSupportedCalendarComponentSets

- (id)copyParseRules
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;

  v2 = objc_alloc(MEMORY[0x24BDBCE70]);
  v3 = *MEMORY[0x24BE1ACF8];
  v4 = *MEMORY[0x24BE1AF60];
  objc_msgSend(MEMORY[0x24BE1AB88], "ruleWithMinimumNumber:maximumNumber:nameSpace:elementName:objectClass:setterMethod:", 0, 0x7FFFFFFFLL, *MEMORY[0x24BE1ACF8], *MEMORY[0x24BE1AF60], objc_opt_class(), sel_addCompSet_);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@:%@"), v3, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v2, "initWithObjectsAndKeys:", v5, v6, 0);

  return v7;
}

- (CalDAVSupportedCalendarComponentSets)init
{
  return -[CoreDAVItem initWithNameSpace:andName:](self, "initWithNameSpace:andName:", *MEMORY[0x24BE1ACF8], CFSTR("supported-calendar-component-sets"));
}

- (id)componentsAsString
{
  void *v3;
  NSMutableSet *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  if (!-[NSMutableSet count](self->_componentSets, "count"))
    return 0;
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", -[NSMutableSet count](self->_componentSets, "count"));
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v4 = self->_componentSets;
  v5 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v14;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v14 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * i), "componentsAsString", (_QWORD)v13);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "addObject:", v9);

      }
      v6 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v6);
  }

  objc_msgSend(v3, "sortedArrayUsingSelector:", sel_compare_);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "componentsJoinedByString:", CFSTR(","));
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x24BDD16A8];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %p: "), v5, self);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[CalDAVSupportedCalendarComponentSets componentsAsString](self, "componentsAsString");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "appendFormat:", CFSTR("ALLOWED COMPONENTS: %@"), v7);

  return v6;
}

+ (BOOL)allowedCalendars:(id)a3 contains:(id)a4
{
  id v5;
  id v6;
  BOOL v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = a4;
  if (objc_msgSend(v5, "length"))
  {
    if ((objc_msgSend(v5, "isEqualToString:", CFSTR("kCalDAVDoesNotSupportCalendarCreation")) & 1) != 0)
    {
      v7 = 0;
    }
    else
    {
      objc_msgSend(v5, "componentsSeparatedByString:", CFSTR(","));
      v15 = 0u;
      v16 = 0u;
      v17 = 0u;
      v18 = 0u;
      v8 = (id)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      if (v9)
      {
        v10 = v9;
        v11 = *(_QWORD *)v16;
        while (2)
        {
          for (i = 0; i != v10; ++i)
          {
            if (*(_QWORD *)v16 != v11)
              objc_enumerationMutation(v8);
            v13 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * i);
            if ((objc_msgSend(v13, "isEqualToString:", v6, (_QWORD)v15) & 1) != 0
              || (objc_msgSend(v13, "isEqualToString:", CFSTR("*")) & 1) != 0)
            {
              v7 = 1;
              goto LABEL_17;
            }
          }
          v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
          v7 = 0;
          if (v10)
            continue;
          break;
        }
      }
      else
      {
        v7 = 0;
      }
LABEL_17:

    }
  }
  else
  {
    v7 = 1;
  }

  return v7;
}

- (void)addCompSet:(id)a3
{
  id v4;
  NSMutableSet *componentSets;
  NSMutableSet *v6;
  NSMutableSet *v7;
  id v8;

  v4 = a3;
  componentSets = self->_componentSets;
  v8 = v4;
  if (!componentSets)
  {
    v6 = (NSMutableSet *)objc_alloc_init(MEMORY[0x24BDBCEF0]);
    v7 = self->_componentSets;
    self->_componentSets = v6;

    v4 = v8;
    componentSets = self->_componentSets;
  }
  -[NSMutableSet addObject:](componentSets, "addObject:", v4);

}

- (id)childrenToWrite
{
  void *v3;
  void *v4;
  void *v5;

  -[NSMutableSet allObjects](self->_componentSets, "allObjects");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CoreDAVItem extraChildItems](self, "extraChildItems");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "arrayByAddingObjectsFromArray:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_componentSets, 0);
}

@end
