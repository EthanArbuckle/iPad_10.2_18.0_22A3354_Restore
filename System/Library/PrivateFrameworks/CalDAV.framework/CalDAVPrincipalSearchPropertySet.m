@implementation CalDAVPrincipalSearchPropertySet

- (CalDAVPrincipalSearchPropertySet)initWithSearchProperties:(id)a3
{
  id v4;
  CalDAVPrincipalSearchPropertySet *v5;
  CalDAVPrincipalSearchPropertySet *v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  CalDAVPrincipalSearchPropertySet *v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  objc_super v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v27.receiver = self;
  v27.super_class = (Class)CalDAVPrincipalSearchPropertySet;
  v5 = -[CalDAVPrincipalSearchPropertySet init](&v27, sel_init);
  v6 = v5;
  if (v5)
  {
    v22 = v5;
    objc_msgSend(MEMORY[0x24BDBCEF0], "setWithCapacity:", objc_msgSend(v4, "count"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = 0u;
    v24 = 0u;
    v25 = 0u;
    v26 = 0u;
    v8 = v4;
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v24;
      do
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v24 != v11)
            objc_enumerationMutation(v8);
          objc_msgSend(*(id *)(*((_QWORD *)&v23 + 1) + 8 * i), "prop");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "extraChildItems");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "lastObject");
          v15 = (void *)objc_claimAutoreleasedReturnValue();

          if (v15)
          {
            v16 = (void *)MEMORY[0x24BDD17C8];
            objc_msgSend(v15, "nameSpace");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v15, "name");
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v16, "CDVStringWithNameSpace:andName:", v17, v18);
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v7, "addObject:", v19);

          }
        }
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
      }
      while (v10);
    }

    v20 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCF20]), "initWithSet:", v7);
    v6 = v22;
    -[CalDAVPrincipalSearchPropertySet setStringProperties:](v22, "setStringProperties:", v20);

  }
  return v6;
}

- (CalDAVPrincipalSearchPropertySet)initWithStringProperties:(id)a3
{
  id v4;
  CalDAVPrincipalSearchPropertySet *v5;
  CalDAVPrincipalSearchPropertySet *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)CalDAVPrincipalSearchPropertySet;
  v5 = -[CalDAVPrincipalSearchPropertySet init](&v8, sel_init);
  v6 = v5;
  if (v5)
    -[CalDAVPrincipalSearchPropertySet setStringProperties:](v5, "setStringProperties:", v4);

  return v6;
}

+ (id)searchSetWithProperties:(id)a3
{
  id v3;
  CalDAVPrincipalSearchPropertySet *v4;

  v3 = a3;
  v4 = -[CalDAVPrincipalSearchPropertySet initWithSearchProperties:]([CalDAVPrincipalSearchPropertySet alloc], "initWithSearchProperties:", v3);

  return v4;
}

- (BOOL)supportsPropertyTypeWithNameSpace:(id)a3 andName:(id)a4
{
  void *v5;
  void *v6;
  char v7;

  objc_msgSend(MEMORY[0x24BDD17C8], "CDVStringWithNameSpace:andName:", a3, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CalDAVPrincipalSearchPropertySet stringProperties](self, "stringProperties");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "containsObject:", v5);

  return v7;
}

- (BOOL)supportsWellKnownType:(int)a3
{
  void *v4;
  void *v5;
  char v6;

  +[CalDAVPrincipalSearchSupport namespaceAndNameForWellKnownType:](CalDAVPrincipalSearchSupport, "namespaceAndNameForWellKnownType:", *(_QWORD *)&a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[CalDAVPrincipalSearchPropertySet stringProperties](self, "stringProperties");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "containsObject:", v4);

  return v6;
}

- (BOOL)supportsPropertySearch
{
  void *v2;
  BOOL v3;

  -[CalDAVPrincipalSearchPropertySet stringProperties](self, "stringProperties");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "count") != 0;

  return v3;
}

- (BOOL)isEqualToPropertySet:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[CalDAVPrincipalSearchPropertySet stringProperties](self, "stringProperties");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringProperties");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v4) = objc_msgSend(v5, "isEqualToSet:", v6);
  return (char)v4;
}

- (NSSet)stringProperties
{
  return self->_stringProperties;
}

- (void)setStringProperties:(id)a3
{
  objc_storeStrong((id *)&self->_stringProperties, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stringProperties, 0);
}

@end
