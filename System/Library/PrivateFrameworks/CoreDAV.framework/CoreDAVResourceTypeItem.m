@implementation CoreDAVResourceTypeItem

- (CoreDAVResourceTypeItem)init
{
  return -[CoreDAVItem initWithNameSpace:andName:](self, "initWithNameSpace:andName:", CFSTR("DAV:"), CFSTR("resourcetype"));
}

- (id)description
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  objc_super v12;

  v3 = objc_alloc_init(MEMORY[0x24BDD16A8]);
  v12.receiver = self;
  v12.super_class = (Class)CoreDAVResourceTypeItem;
  -[CoreDAVItem description](&v12, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("[%@]"), v4);

  -[CoreDAVResourceTypeItem addressBook](self, "addressBook");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("\n  Address book: [%@]"), v5);

  -[CoreDAVResourceTypeItem searchAddressBook](self, "searchAddressBook");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("\n  Search address book: [%@]"), v6);

  -[CoreDAVResourceTypeItem shared](self, "shared");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("\n  Shared: [%@]"), v7);

  -[CoreDAVResourceTypeItem principal](self, "principal");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("\n  Principal: [%@]"), v8);

  -[CoreDAVResourceTypeItem collection](self, "collection");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("\n  Collection: [%@]"), v9);

  -[CoreDAVResourceTypeItem unauthenticated](self, "unauthenticated");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("\n  Unauthenticated: [%@]"), v10);

  return v3;
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
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;

  +[CoreDAVItem parseRuleCache](CoreDAVItem, "parseRuleCache");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromClass((Class)a1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKey:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    v19 = objc_alloc(MEMORY[0x24BDBCE70]);
    +[CoreDAVParseRule ruleWithMinimumNumber:maximumNumber:nameSpace:elementName:objectClass:setterMethod:](CoreDAVParseRule, "ruleWithMinimumNumber:maximumNumber:nameSpace:elementName:objectClass:setterMethod:", 0, 1, CFSTR("urn:ietf:params:xml:ns:carddav"), CFSTR("addressbook"), objc_opt_class(), sel_setAddressBook_);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@:%@"), CFSTR("urn:ietf:params:xml:ns:carddav"), CFSTR("addressbook"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    +[CoreDAVParseRule ruleWithMinimumNumber:maximumNumber:nameSpace:elementName:objectClass:setterMethod:](CoreDAVParseRule, "ruleWithMinimumNumber:maximumNumber:nameSpace:elementName:objectClass:setterMethod:", 0, 1, CFSTR("urn:ietf:params:xml:ns:carddav"), CFSTR("searchaddressbook"), objc_opt_class(), sel_setSearchAddressBook_);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@:%@"), CFSTR("urn:ietf:params:xml:ns:carddav"), CFSTR("searchaddressbook"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    +[CoreDAVParseRule ruleWithMinimumNumber:maximumNumber:nameSpace:elementName:objectClass:setterMethod:](CoreDAVParseRule, "ruleWithMinimumNumber:maximumNumber:nameSpace:elementName:objectClass:setterMethod:", 0, 1, CFSTR("http://calendarserver.org/ns/"), CFSTR("shared"), objc_opt_class(), sel_setShared_);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@:%@"), CFSTR("http://calendarserver.org/ns/"), CFSTR("shared"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    +[CoreDAVParseRule ruleWithMinimumNumber:maximumNumber:nameSpace:elementName:objectClass:setterMethod:](CoreDAVParseRule, "ruleWithMinimumNumber:maximumNumber:nameSpace:elementName:objectClass:setterMethod:", 0, 1, CFSTR("DAV:"), CFSTR("principal"), objc_opt_class(), sel_setPrincipal_);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@:%@"), CFSTR("DAV:"), CFSTR("principal"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    +[CoreDAVParseRule ruleWithMinimumNumber:maximumNumber:nameSpace:elementName:objectClass:setterMethod:](CoreDAVParseRule, "ruleWithMinimumNumber:maximumNumber:nameSpace:elementName:objectClass:setterMethod:", 0, 1, CFSTR("DAV:"), CFSTR("collection"), objc_opt_class(), sel_setCollection_);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@:%@"), CFSTR("DAV:"), CFSTR("collection"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    +[CoreDAVParseRule ruleWithMinimumNumber:maximumNumber:nameSpace:elementName:objectClass:setterMethod:](CoreDAVParseRule, "ruleWithMinimumNumber:maximumNumber:nameSpace:elementName:objectClass:setterMethod:", 0, 1, CFSTR("DAV:"), CFSTR("unauthenticated"), objc_opt_class(), sel_setUnauthenticated_);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@:%@"), CFSTR("DAV:"), CFSTR("unauthenticated"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (void *)objc_msgSend(v19, "initWithObjectsAndKeys:", v21, v20, v18, v17, v16, v15, v14, v6, v13, v7, v8, v9, 0);

    +[CoreDAVItem parseRuleCache](CoreDAVItem, "parseRuleCache");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromClass((Class)a1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setObject:forKey:", v5, v11);

  }
  return v5;
}

- (void)write:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[CoreDAVItem name](self, "name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CoreDAVItem nameSpace](self, "nameSpace");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "startElement:inNamespace:withAttributeNamesAndValues:", v5, v6, 0);

  -[CoreDAVResourceTypeItem addressBook](self, "addressBook");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "write:", v4);

  -[CoreDAVResourceTypeItem searchAddressBook](self, "searchAddressBook");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "write:", v4);

  -[CoreDAVResourceTypeItem shared](self, "shared");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "write:", v4);

  -[CoreDAVResourceTypeItem principal](self, "principal");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "write:", v4);

  -[CoreDAVResourceTypeItem collection](self, "collection");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "write:", v4);

  -[CoreDAVResourceTypeItem unauthenticated](self, "unauthenticated");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "write:", v4);

  v22 = 0u;
  v23 = 0u;
  v20 = 0u;
  v21 = 0u;
  -[CoreDAVItem extraChildItems](self, "extraChildItems", 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v21;
    do
    {
      v17 = 0;
      do
      {
        if (*(_QWORD *)v21 != v16)
          objc_enumerationMutation(v13);
        objc_msgSend(*(id *)(*((_QWORD *)&v20 + 1) + 8 * v17++), "write:", v4);
      }
      while (v15 != v17);
      v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    }
    while (v15);
  }

  -[CoreDAVItem name](self, "name");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[CoreDAVItem nameSpace](self, "nameSpace");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "endElement:inNamespace:", v18, v19);

}

- (NSSet)stringSet
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  id v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  void *v44;
  id v45;
  void *v46;
  void *v47;
  void *v48;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  _BYTE v54[128];
  uint64_t v55;

  v55 = *MEMORY[0x24BDAC8D0];
  v3 = objc_alloc_init(MEMORY[0x24BDBCEF0]);
  -[CoreDAVResourceTypeItem addressBook](self, "addressBook");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    v5 = objc_alloc(MEMORY[0x24BDD17C8]);
    -[CoreDAVResourceTypeItem addressBook](self, "addressBook");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "nameSpace");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[CoreDAVResourceTypeItem addressBook](self, "addressBook");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "name");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)objc_msgSend(v5, "initWithCDVNameSpace:andName:", v7, v9);

    objc_msgSend(v3, "addObject:", v10);
  }
  -[CoreDAVResourceTypeItem searchAddressBook](self, "searchAddressBook");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    v12 = objc_alloc(MEMORY[0x24BDD17C8]);
    -[CoreDAVResourceTypeItem searchAddressBook](self, "searchAddressBook");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "nameSpace");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[CoreDAVResourceTypeItem searchAddressBook](self, "searchAddressBook");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "name");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = (void *)objc_msgSend(v12, "initWithCDVNameSpace:andName:", v14, v16);

    objc_msgSend(v3, "addObject:", v17);
  }
  -[CoreDAVResourceTypeItem shared](self, "shared");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (v18)
  {
    v19 = objc_alloc(MEMORY[0x24BDD17C8]);
    -[CoreDAVResourceTypeItem shared](self, "shared");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "nameSpace");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[CoreDAVResourceTypeItem shared](self, "shared");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "name");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = (void *)objc_msgSend(v19, "initWithCDVNameSpace:andName:", v21, v23);

    objc_msgSend(v3, "addObject:", v24);
  }
  -[CoreDAVResourceTypeItem principal](self, "principal");
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  if (v25)
  {
    v26 = objc_alloc(MEMORY[0x24BDD17C8]);
    -[CoreDAVResourceTypeItem principal](self, "principal");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "nameSpace");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    -[CoreDAVResourceTypeItem principal](self, "principal");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "name");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = (void *)objc_msgSend(v26, "initWithCDVNameSpace:andName:", v28, v30);

    objc_msgSend(v3, "addObject:", v31);
  }
  -[CoreDAVResourceTypeItem collection](self, "collection");
  v32 = (void *)objc_claimAutoreleasedReturnValue();

  if (v32)
  {
    v33 = objc_alloc(MEMORY[0x24BDD17C8]);
    -[CoreDAVResourceTypeItem collection](self, "collection");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "nameSpace");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    -[CoreDAVResourceTypeItem collection](self, "collection");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "name");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v38 = (void *)objc_msgSend(v33, "initWithCDVNameSpace:andName:", v35, v37);

    objc_msgSend(v3, "addObject:", v38);
  }
  v52 = 0u;
  v53 = 0u;
  v50 = 0u;
  v51 = 0u;
  -[CoreDAVItem extraChildItems](self, "extraChildItems", 0);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  v40 = objc_msgSend(v39, "countByEnumeratingWithState:objects:count:", &v50, v54, 16);
  if (v40)
  {
    v41 = v40;
    v42 = *(_QWORD *)v51;
    do
    {
      v43 = 0;
      do
      {
        if (*(_QWORD *)v51 != v42)
          objc_enumerationMutation(v39);
        v44 = *(void **)(*((_QWORD *)&v50 + 1) + 8 * v43);
        v45 = objc_alloc(MEMORY[0x24BDD17C8]);
        objc_msgSend(v44, "nameSpace");
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v44, "name");
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        v48 = (void *)objc_msgSend(v45, "initWithCDVNameSpace:andName:", v46, v47);

        objc_msgSend(v3, "addObject:", v48);
        ++v43;
      }
      while (v41 != v43);
      v41 = objc_msgSend(v39, "countByEnumeratingWithState:objects:count:", &v50, v54, 16);
    }
    while (v41);
  }

  if (!objc_msgSend(v3, "count"))
  {

    v3 = 0;
  }
  return (NSSet *)v3;
}

- (BOOL)isTypeWithNameSpace:(id)a3 andName:(id)a4
{
  id v6;
  id v7;
  void *v8;
  BOOL v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  void *v17;
  char v18;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  if (objc_msgSend(v6, "isEqualToString:", CFSTR("DAV:")))
  {
    if (objc_msgSend(v7, "isEqualToString:", CFSTR("principal")))
    {
      -[CoreDAVResourceTypeItem principal](self, "principal");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_16:
      v9 = v8 != 0;

      goto LABEL_29;
    }
    if (objc_msgSend(v7, "isEqualToString:", CFSTR("collection")))
    {
      -[CoreDAVResourceTypeItem collection](self, "collection");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_16;
    }
    if (objc_msgSend(v7, "isEqualToString:", CFSTR("unauthenticated")))
    {
      -[CoreDAVResourceTypeItem unauthenticated](self, "unauthenticated");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_16;
    }
  }
  else if (objc_msgSend(v6, "isEqualToString:", CFSTR("urn:ietf:params:xml:ns:carddav")))
  {
    if (objc_msgSend(v7, "isEqualToString:", CFSTR("addressbook")))
    {
      -[CoreDAVResourceTypeItem addressBook](self, "addressBook");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_16;
    }
    if (objc_msgSend(v7, "isEqualToString:", CFSTR("searchaddressbook")))
    {
      -[CoreDAVResourceTypeItem searchAddressBook](self, "searchAddressBook");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_16;
    }
  }
  else if (objc_msgSend(v6, "isEqualToString:", CFSTR("http://calendarserver.org/ns/"))
         && objc_msgSend(v7, "isEqualToString:", CFSTR("shared")))
  {
    -[CoreDAVResourceTypeItem shared](self, "shared");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_16;
  }
  v22 = 0u;
  v23 = 0u;
  v20 = 0u;
  v21 = 0u;
  -[CoreDAVItem extraChildItems](self, "extraChildItems", 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v21;
    do
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v21 != v13)
          objc_enumerationMutation(v10);
        v15 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * i);
        objc_msgSend(v15, "nameSpace");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(v16, "isEqualToString:", v6) & 1) != 0)
        {
          objc_msgSend(v15, "name");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v18 = objc_msgSend(v17, "isEqualToString:", v7);

          if ((v18 & 1) != 0)
          {

            v9 = 1;
            goto LABEL_29;
          }
        }
        else
        {

        }
      }
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    }
    while (v12);
  }

  v9 = 0;
LABEL_29:

  return v9;
}

- (CoreDAVItemWithNoChildren)addressBook
{
  return self->_addressBook;
}

- (void)setAddressBook:(id)a3
{
  objc_storeStrong((id *)&self->_addressBook, a3);
}

- (CoreDAVItemWithNoChildren)searchAddressBook
{
  return self->_searchAddressBook;
}

- (void)setSearchAddressBook:(id)a3
{
  objc_storeStrong((id *)&self->_searchAddressBook, a3);
}

- (CoreDAVItemWithNoChildren)shared
{
  return self->_shared;
}

- (void)setShared:(id)a3
{
  objc_storeStrong((id *)&self->_shared, a3);
}

- (CoreDAVItemWithNoChildren)principal
{
  return self->_principal;
}

- (void)setPrincipal:(id)a3
{
  objc_storeStrong((id *)&self->_principal, a3);
}

- (CoreDAVItemWithNoChildren)collection
{
  return self->_collection;
}

- (void)setCollection:(id)a3
{
  objc_storeStrong((id *)&self->_collection, a3);
}

- (CoreDAVItemWithNoChildren)unauthenticated
{
  return self->_unauthenticated;
}

- (void)setUnauthenticated:(id)a3
{
  objc_storeStrong((id *)&self->_unauthenticated, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_unauthenticated, 0);
  objc_storeStrong((id *)&self->_collection, 0);
  objc_storeStrong((id *)&self->_principal, 0);
  objc_storeStrong((id *)&self->_shared, 0);
  objc_storeStrong((id *)&self->_searchAddressBook, 0);
  objc_storeStrong((id *)&self->_addressBook, 0);
}

@end
