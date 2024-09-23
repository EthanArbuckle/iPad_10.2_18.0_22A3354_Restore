@implementation CalDAVSupportedCalendarComponentSet

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
  v4 = *MEMORY[0x24BE1AE18];
  objc_msgSend(MEMORY[0x24BE1AB88], "ruleWithMinimumNumber:maximumNumber:nameSpace:elementName:objectClass:setterMethod:", 0, 0x7FFFFFFFLL, *MEMORY[0x24BE1ACF8], *MEMORY[0x24BE1AE18], objc_opt_class(), sel_addComp_);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@:%@"), v3, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v2, "initWithObjectsAndKeys:", v5, v6, 0);

  return v7;
}

- (CalDAVSupportedCalendarComponentSet)init
{
  return -[CoreDAVItem initWithNameSpace:andName:](self, "initWithNameSpace:andName:", *MEMORY[0x24BE1ACF8], *MEMORY[0x24BE1AF60]);
}

- (id)componentsAsString
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  -[CalDAVSupportedCalendarComponentSet compNames](self, "compNames");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "allObjects");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "sortedArrayUsingSelector:", sel_compare_);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "componentsJoinedByString:", CFSTR("+"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
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

  -[CalDAVSupportedCalendarComponentSet componentsAsString](self, "componentsAsString");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "appendFormat:", CFSTR("SUPPORTED COMPONENTS: %@"), v7);

  return v6;
}

- (void)addComp:(id)a3
{
  id v4;
  NSMutableSet *comps;
  NSMutableSet *v6;
  NSMutableSet *v7;
  id v8;

  v4 = a3;
  comps = self->_comps;
  v8 = v4;
  if (!comps)
  {
    v6 = (NSMutableSet *)objc_alloc_init(MEMORY[0x24BDBCEF0]);
    v7 = self->_comps;
    self->_comps = v6;

    v4 = v8;
    comps = self->_comps;
  }
  -[NSMutableSet addObject:](comps, "addObject:", v4);

}

- (id)childrenToWrite
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  -[CalDAVSupportedCalendarComponentSet comps](self, "comps");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "allObjects");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[CoreDAVItem extraChildItems](self, "extraChildItems");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "arrayByAddingObjectsFromArray:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (NSSet)compNames
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v3 = objc_alloc(MEMORY[0x24BDBCEF0]);
  -[CalDAVSupportedCalendarComponentSet comps](self, "comps");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithCapacity:", objc_msgSend(v4, "count"));

  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  -[CalDAVSupportedCalendarComponentSet comps](self, "comps", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v14;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v14 != v9)
          objc_enumerationMutation(v6);
        objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * v10), "nameAttribute");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        if (v11)
          objc_msgSend(v5, "addObject:", v11);

        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v8);
  }

  return (NSSet *)v5;
}

- (NSMutableSet)comps
{
  return self->_comps;
}

- (void)setComps:(id)a3
{
  objc_storeStrong((id *)&self->_comps, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_comps, 0);
}

@end
