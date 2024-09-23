@implementation CalDAVPrincipalPropertySearchTask

- (CalDAVPrincipalPropertySearchTask)initWithSearchStrings:(id)a3 searchTypes:(id)a4 serverSupportSet:(id)a5 atURL:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  CalDAVPrincipalPropertySearchTask *v15;
  void *v16;
  objc_super v18;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  +[CalDAVPrincipalSearchSupport parserMappingsWithServerSupportSet:includeEmail:](CalDAVPrincipalSearchSupport, "parserMappingsWithServerSupportSet:includeEmail:", v12, 1);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v18.receiver = self;
  v18.super_class = (Class)CalDAVPrincipalPropertySearchTask;
  v15 = -[CoreDAVPrincipalPropertySearchTask initWithPropertiesToFind:atURL:](&v18, sel_initWithPropertiesToFind_atURL_, v14, v13);

  if (v15)
  {
    -[CalDAVPrincipalPropertySearchTask setSearchStrings:](v15, "setSearchStrings:", v10);
    -[CalDAVPrincipalPropertySearchTask setServerSupportSet:](v15, "setServerSupportSet:", v12);
    if (objc_msgSend(v11, "count"))
    {
      -[CalDAVPrincipalPropertySearchTask setSearchTypes:](v15, "setSearchTypes:", v11);
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDBCF20], "setWithObjects:", CalDAVPrincipalResultType_Person, CalDAVPrincipalResultType_Group, CalDAVPrincipalResultType_Resource, CalDAVPrincipalResultType_Room, CalDAVPrincipalResultType_Unknown, 0);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[CalDAVPrincipalPropertySearchTask setSearchTypes:](v15, "setSearchTypes:", v16);

    }
  }

  return v15;
}

- (id)extraAttributes
{
  void *v3;
  unint64_t v4;
  void *v5;
  void *v6;
  void *v7;

  -[CalDAVPrincipalPropertySearchTask searchTypes](self, "searchTypes");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  if (v4 < 2)
  {
    -[CalDAVPrincipalPropertySearchTask searchTypes](self, "searchTypes");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "anyObject");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjectsAndKeys:", *MEMORY[0x24BE1ADD8], *MEMORY[0x24BE1AE08], v7, CFSTR("type"), 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObject:forKey:", *MEMORY[0x24BE1ADD8], *MEMORY[0x24BE1AE08]);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v5;
}

- (id)searchItems
{
  void *v3;
  void *v4;
  char v5;
  id v6;
  void (**v7)(_QWORD, _QWORD);
  void *v8;
  int v9;
  id v10;
  _QWORD v12[5];
  id v13;
  char v14;

  objc_msgSend(MEMORY[0x24BDBCEF0], "set");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CalDAVPrincipalPropertySearchTask searchTypes](self, "searchTypes");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "containsObject:", CalDAVPrincipalResultType_Room);

  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __48__CalDAVPrincipalPropertySearchTask_searchItems__block_invoke;
  v12[3] = &unk_24C1FB598;
  v12[4] = self;
  v14 = v5;
  v6 = v3;
  v13 = v6;
  v7 = (void (**)(_QWORD, _QWORD))MEMORY[0x20BD12C84](v12);
  v7[2](v7, 3);
  v7[2](v7, 4);
  -[CalDAVPrincipalPropertySearchTask searchTypes](self, "searchTypes");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "containsObject:", CalDAVPrincipalResultType_Person);

  if (v9)
  {
    v7[2](v7, 1);
    v7[2](v7, 2);
  }
  v10 = v6;

  return v10;
}

void __48__CalDAVPrincipalPropertySearchTask_searchItems__block_invoke(uint64_t a1, uint64_t a2)
{
  void *v4;
  int v5;
  const __CFString *v6;
  BOOL v7;
  const __CFString *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  id obj;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "serverSupportSet");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "supportsWellKnownType:", a2);

  if (v5)
  {
    v6 = CFSTR("starts-with");
    if ((_DWORD)a2 == 6)
      v6 = CFSTR("equals");
    if (*(_BYTE *)(a1 + 48))
      v7 = (_DWORD)a2 == 3;
    else
      v7 = 0;
    if (v7)
      v8 = CFSTR("contains");
    else
      v8 = v6;
    v17 = 0u;
    v18 = 0u;
    v19 = 0u;
    v20 = 0u;
    objc_msgSend(*(id *)(a1 + 32), "searchStrings");
    obj = (id)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    if (v9)
    {
      v10 = v9;
      v11 = 0;
      v12 = *(_QWORD *)v18;
      do
      {
        v13 = 0;
        v14 = v11;
        do
        {
          if (*(_QWORD *)v18 != v12)
            objc_enumerationMutation(obj);
          v15 = *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * v13);
          +[CalDAVPrincipalSearchSupport propertySearchItemForWellKnownType:](CalDAVPrincipalSearchSupport, "propertySearchItemForWellKnownType:", a2);
          v11 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v11, "setMatchTypeAttribute:", v8);
          objc_msgSend(v11, "setMatch:", v15);
          objc_msgSend(*(id *)(a1 + 40), "addObject:", v11);
          ++v13;
          v14 = v11;
        }
        while (v10 != v13);
        v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      }
      while (v10);

    }
  }
}

- (id)searchContext
{
  return self->_searchContext;
}

- (void)setSearchContext:(id)a3
{
  objc_storeStrong(&self->_searchContext, a3);
}

- (NSSet)searchTypes
{
  return self->_searchTypes;
}

- (void)setSearchTypes:(id)a3
{
  objc_storeStrong((id *)&self->_searchTypes, a3);
}

- (NSSet)searchStrings
{
  return self->_searchStrings;
}

- (void)setSearchStrings:(id)a3
{
  objc_storeStrong((id *)&self->_searchStrings, a3);
}

- (CalDAVPrincipalSearchPropertySet)serverSupportSet
{
  return self->_serverSupportSet;
}

- (void)setServerSupportSet:(id)a3
{
  objc_storeStrong((id *)&self->_serverSupportSet, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serverSupportSet, 0);
  objc_storeStrong((id *)&self->_searchStrings, 0);
  objc_storeStrong((id *)&self->_searchTypes, 0);
  objc_storeStrong(&self->_searchContext, 0);
}

@end
