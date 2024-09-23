@implementation CoreDAVContainer

+ (id)copyPropertyMappingsForParser
{
  id v2;

  v2 = objc_alloc_init(MEMORY[0x24BDBCEF0]);
  objc_msgSend(v2, "CDVAddItemParserMappingWithNameSpace:name:parseClass:", CFSTR("DAV:"), CFSTR("resourcetype"), objc_opt_class());
  objc_msgSend(v2, "CDVAddItemParserMappingWithNameSpace:name:parseClass:", CFSTR("DAV:"), CFSTR("displayname"), objc_opt_class());
  objc_msgSend(v2, "CDVAddItemParserMappingWithNameSpace:name:parseClass:", CFSTR("DAV:"), CFSTR("owner"), objc_opt_class());
  objc_msgSend(v2, "CDVAddItemParserMappingWithNameSpace:name:parseClass:", CFSTR("DAV:"), CFSTR("current-user-privilege-set"), objc_opt_class());
  objc_msgSend(v2, "CDVAddItemParserMappingWithNameSpace:name:parseClass:", CFSTR("http://calendarserver.org/ns/"), CFSTR("pushkey"), objc_opt_class());
  objc_msgSend(v2, "CDVAddItemParserMappingWithNameSpace:name:parseClass:", CFSTR("http://calendarserver.org/ns/"), CFSTR("push-transports"), objc_opt_class());
  objc_msgSend(v2, "CDVAddItemParserMappingWithNameSpace:name:parseClass:", CFSTR("DAV:"), CFSTR("resource-id"), objc_opt_class());
  objc_msgSend(v2, "CDVAddItemParserMappingWithNameSpace:name:parseClass:", CFSTR("DAV:"), CFSTR("quota-available-bytes"), objc_opt_class());
  objc_msgSend(v2, "CDVAddItemParserMappingWithNameSpace:name:parseClass:", CFSTR("DAV:"), CFSTR("quota-used-bytes"), objc_opt_class());
  objc_msgSend(v2, "CDVAddItemParserMappingWithNameSpace:name:parseClass:", CFSTR("DAV:"), CFSTR("supported-report-set"), objc_opt_class());
  objc_msgSend(v2, "CDVAddItemParserMappingWithNameSpace:name:parseClass:", CFSTR("DAV:"), CFSTR("add-member"), objc_opt_class());
  objc_msgSend(v2, "CDVAddItemParserMappingWithNameSpace:name:parseClass:", CFSTR("http://me.com/_namespace/"), CFSTR("bulk-requests"), objc_opt_class());
  objc_msgSend(v2, "CDVAddItemParserMappingWithNameSpace:name:parseClass:", CFSTR("DAV:"), CFSTR("sync-token"), objc_opt_class());
  return v2;
}

- (CoreDAVContainer)initWithURL:(id)a3 andProperties:(id)a4
{
  id v7;
  id v8;
  CoreDAVContainer *v9;
  CoreDAVContainer *v10;

  v7 = a3;
  v8 = a4;
  v9 = -[CoreDAVContainer init](self, "init");
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_url, a3);
    -[CoreDAVContainer applyParsedProperties:](v10, "applyParsedProperties:", v8);
  }

  return v10;
}

- (id)description
{
  void *v3;
  void *v4;
  objc_class *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _BOOL4 v10;
  const __CFString *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  objc_super v23;

  v23.receiver = self;
  v23.super_class = (Class)CoreDAVContainer;
  -[CoreDAVContainer description](&v23, sel_description);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)MEMORY[0x24BDD16A8];
  v5 = (objc_class *)objc_opt_class();
  NSStringFromClass(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", CFSTR("%@ %p: "), v6, self);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "appendFormat:", CFSTR(" PARENT CLASS: %@"), v3);
  -[CoreDAVContainer url](self, "url");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "appendFormat:", CFSTR("\n\turl: %@"), v8);

  -[CoreDAVContainer resourceType](self, "resourceType");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "appendFormat:", CFSTR("\n\tresourceType: %@"), v9);

  v10 = -[CoreDAVContainer isUnauthenticated](self, "isUnauthenticated");
  v11 = CFSTR("NO");
  if (v10)
    v11 = CFSTR("YES");
  objc_msgSend(v7, "appendFormat:", CFSTR("\n\tisUnauthenticated: %@"), v11);
  -[CoreDAVContainer containerTitle](self, "containerTitle");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "appendFormat:", CFSTR("\n\tcontainerTitle: %@"), v12);

  -[CoreDAVContainer privilegesAsStringSet](self, "privilegesAsStringSet");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "appendFormat:", CFSTR("\n\tprivileges: %@"), v13);

  -[CoreDAVContainer pushKey](self, "pushKey");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "appendFormat:", CFSTR("\n\tpushKey: %@"), v14);

  -[CoreDAVContainer resourceID](self, "resourceID");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "appendFormat:", CFSTR("\n\tresourceID: %@"), v15);

  -[CoreDAVContainer quotaAvailable](self, "quotaAvailable");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "appendFormat:", CFSTR("\n\tquotaAvailable: %@"), v16);

  -[CoreDAVContainer quotaUsed](self, "quotaUsed");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "appendFormat:", CFSTR("\n\tquotaUsed: %@"), v17);

  -[CoreDAVContainer supportedReportsAsStringSet](self, "supportedReportsAsStringSet");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "appendFormat:", CFSTR("\n\tsupportedReports: %@"), v18);

  -[CoreDAVContainer pushTransports](self, "pushTransports");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "appendFormat:", CFSTR("\n\tpushTransports: %@"), v19);

  -[CoreDAVContainer bulkRequests](self, "bulkRequests");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "appendFormat:", CFSTR("\n\tbulkRequests: %@"), v20);

  -[CoreDAVContainer syncToken](self, "syncToken");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "appendFormat:", CFSTR("\n\tsyncToken: %@"), v21);

  return v7;
}

- (void)applyParsedProperties:(id)a3
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
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  id v33;

  v4 = a3;
  objc_msgSend(v4, "CDVObjectForKeyWithNameSpace:andName:", CFSTR("DAV:"), CFSTR("resourcetype"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CoreDAVContainer setResourceType:](self, "setResourceType:", v5);

  -[CoreDAVContainer resourceType](self, "resourceType");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "unauthenticated");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[CoreDAVContainer setIsUnauthenticated:](self, "setIsUnauthenticated:", v7 != 0);

  objc_msgSend(v4, "CDVObjectForKeyWithNameSpace:andName:", CFSTR("DAV:"), CFSTR("displayname"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "payloadAsString");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[CoreDAVContainer setContainerTitle:](self, "setContainerTitle:", v9);

  objc_msgSend(v4, "CDVObjectForKeyWithNameSpace:andName:", CFSTR("DAV:"), CFSTR("current-user-privilege-set"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "privileges");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[CoreDAVContainer setPrivileges:](self, "setPrivileges:", v11);

  objc_msgSend(v4, "CDVObjectForKeyWithNameSpace:andName:", CFSTR("http://calendarserver.org/ns/"), CFSTR("pushkey"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "payloadAsString");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[CoreDAVContainer setPushKey:](self, "setPushKey:", v13);

  objc_msgSend(v4, "CDVObjectForKeyWithNameSpace:andName:", CFSTR("DAV:"), CFSTR("resource-id"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "href");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "payloadAsFullURL");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[CoreDAVContainer setResourceID:](self, "setResourceID:", v16);

  objc_msgSend(v4, "CDVObjectForKeyWithNameSpace:andName:", CFSTR("DAV:"), CFSTR("quota-available-bytes"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "payloadAsString");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[CoreDAVContainer setQuotaAvailable:](self, "setQuotaAvailable:", v18);

  objc_msgSend(v4, "CDVObjectForKeyWithNameSpace:andName:", CFSTR("DAV:"), CFSTR("quota-used-bytes"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "payloadAsString");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[CoreDAVContainer setQuotaUsed:](self, "setQuotaUsed:", v20);

  objc_msgSend(v4, "CDVObjectForKeyWithNameSpace:andName:", CFSTR("DAV:"), CFSTR("supported-report-set"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[CoreDAVContainer setSupportedReportSetItem:](self, "setSupportedReportSetItem:", v21);

  objc_msgSend(v4, "CDVObjectForKeyWithNameSpace:andName:", CFSTR("DAV:"), CFSTR("owner"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "href");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "payloadAsFullURL");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  -[CoreDAVContainer setOwner:](self, "setOwner:", v24);

  objc_msgSend(v4, "CDVObjectForKeyWithNameSpace:andName:", CFSTR("DAV:"), CFSTR("add-member"));
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "href");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "payloadAsFullURL");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  -[CoreDAVContainer setAddMemberURL:](self, "setAddMemberURL:", v27);

  objc_msgSend(v4, "CDVObjectForKeyWithNameSpace:andName:", CFSTR("http://calendarserver.org/ns/"), CFSTR("push-transports"));
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  +[CoreDAVContainer convertPushTransportsForNSServerNotificationCenter:](CoreDAVContainer, "convertPushTransportsForNSServerNotificationCenter:", v28);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  -[CoreDAVContainer setPushTransports:](self, "setPushTransports:", v29);

  objc_msgSend(v4, "CDVObjectForKeyWithNameSpace:andName:", CFSTR("http://me.com/_namespace/"), CFSTR("bulk-requests"));
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "dictRepresentation");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  -[CoreDAVContainer setBulkRequests:](self, "setBulkRequests:", v31);

  objc_msgSend(v4, "CDVObjectForKeyWithNameSpace:andName:", CFSTR("DAV:"), CFSTR("sync-token"));
  v33 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v33, "payloadAsString");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  -[CoreDAVContainer setSyncToken:](self, "setSyncToken:", v32);

}

- (NSSet)supportedReports
{
  void *v2;
  void *v3;

  -[CoreDAVContainer supportedReportSetItem](self, "supportedReportSetItem");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "supportedReports");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSSet *)v3;
}

- (NSSet)resourceTypeAsStringSet
{
  void *v2;
  void *v3;

  -[CoreDAVContainer resourceType](self, "resourceType");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringSet");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSSet *)v3;
}

- (BOOL)isPrincipal
{
  void *v3;
  void *v4;
  void *v5;
  BOOL v6;

  -[CoreDAVContainer resourceType](self, "resourceType");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[CoreDAVContainer resourceType](self, "resourceType");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "principal");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5 != 0;

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (NSSet)privilegesAsStringSet
{
  id v3;
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  id obj;
  uint64_t v18;
  uint64_t v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  v3 = objc_alloc_init(MEMORY[0x24BDBCEF0]);
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  -[CoreDAVContainer privileges](self, "privileges");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
  if (v19)
  {
    v18 = *(_QWORD *)v25;
    do
    {
      v4 = 0;
      do
      {
        if (*(_QWORD *)v25 != v18)
          objc_enumerationMutation(obj);
        v5 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * v4);
        v20 = 0u;
        v21 = 0u;
        v22 = 0u;
        v23 = 0u;
        objc_msgSend(v5, "extraChildItems");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v20, v28, 16);
        if (v7)
        {
          v8 = v7;
          v9 = *(_QWORD *)v21;
          do
          {
            v10 = 0;
            do
            {
              if (*(_QWORD *)v21 != v9)
                objc_enumerationMutation(v6);
              v11 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * v10);
              v12 = objc_alloc(MEMORY[0x24BDD17C8]);
              objc_msgSend(v11, "nameSpace");
              v13 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v11, "name");
              v14 = (void *)objc_claimAutoreleasedReturnValue();
              v15 = (void *)objc_msgSend(v12, "initWithCDVNameSpace:andName:", v13, v14);

              objc_msgSend(v3, "addObject:", v15);
              ++v10;
            }
            while (v8 != v10);
            v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v20, v28, 16);
          }
          while (v8);
        }

        ++v4;
      }
      while (v4 != v19);
      v19 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
    }
    while (v19);
  }

  if (!objc_msgSend(v3, "count"))
  {

    v3 = 0;
  }
  return (NSSet *)v3;
}

- (BOOL)_anyPrivilegesMatches:(id)a3
{
  uint64_t (**v4)(id, _QWORD);
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t j;
  BOOL v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v4 = (uint64_t (**)(id, _QWORD))a3;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  -[CoreDAVContainer privileges](self, "privileges");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v23;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v23 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * i);
        v18 = 0u;
        v19 = 0u;
        v20 = 0u;
        v21 = 0u;
        objc_msgSend(v10, "extraChildItems", 0);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v18, v26, 16);
        if (v12)
        {
          v13 = v12;
          v14 = *(_QWORD *)v19;
          while (2)
          {
            for (j = 0; j != v13; ++j)
            {
              if (*(_QWORD *)v19 != v14)
                objc_enumerationMutation(v11);
              if ((v4[2](v4, *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * j)) & 1) != 0)
              {

                v16 = 1;
                goto LABEL_19;
              }
            }
            v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v18, v26, 16);
            if (v13)
              continue;
            break;
          }
        }

      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
      v16 = 0;
    }
    while (v7);
  }
  else
  {
    v16 = 0;
  }
LABEL_19:

  return v16;
}

- (BOOL)hasReadPrivileges
{
  void *v3;
  id v4;
  _QWORD v6[4];
  id v7;

  objc_msgSend(MEMORY[0x24BDBCF20], "setWithObjects:", CFSTR("all"), CFSTR("read"), 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __37__CoreDAVContainer_hasReadPrivileges__block_invoke;
  v6[3] = &unk_24C1D9A18;
  v7 = v3;
  v4 = v3;
  LOBYTE(self) = -[CoreDAVContainer _anyPrivilegesMatches:](self, "_anyPrivilegesMatches:", v6);

  return (char)self;
}

uint64_t __37__CoreDAVContainer_hasReadPrivileges__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;

  v3 = a2;
  objc_msgSend(v3, "nameSpace");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(CFSTR("DAV:"), "isEqualToString:", v4))
  {
    v5 = *(void **)(a1 + 32);
    objc_msgSend(v3, "name");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v5, "containsObject:", v6);

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (BOOL)hasWriteContentPrivileges
{
  void *v3;
  id v4;
  _QWORD v6[4];
  id v7;

  objc_msgSend(MEMORY[0x24BDBCF20], "setWithObjects:", CFSTR("all"), CFSTR("write"), CFSTR("write-content"), 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __45__CoreDAVContainer_hasWriteContentPrivileges__block_invoke;
  v6[3] = &unk_24C1D9A18;
  v7 = v3;
  v4 = v3;
  LOBYTE(self) = -[CoreDAVContainer _anyPrivilegesMatches:](self, "_anyPrivilegesMatches:", v6);

  return (char)self;
}

uint64_t __45__CoreDAVContainer_hasWriteContentPrivileges__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;

  v3 = a2;
  objc_msgSend(v3, "nameSpace");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(CFSTR("DAV:"), "isEqualToString:", v4))
  {
    v5 = *(void **)(a1 + 32);
    objc_msgSend(v3, "name");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v5, "containsObject:", v6);

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (BOOL)hasWritePropertiesPrivileges
{
  void *v3;
  id v4;
  _QWORD v6[4];
  id v7;

  objc_msgSend(MEMORY[0x24BDBCF20], "setWithObjects:", CFSTR("all"), CFSTR("write"), CFSTR("write-properties"), 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __48__CoreDAVContainer_hasWritePropertiesPrivileges__block_invoke;
  v6[3] = &unk_24C1D9A18;
  v7 = v3;
  v4 = v3;
  LOBYTE(self) = -[CoreDAVContainer _anyPrivilegesMatches:](self, "_anyPrivilegesMatches:", v6);

  return (char)self;
}

uint64_t __48__CoreDAVContainer_hasWritePropertiesPrivileges__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;

  v3 = a2;
  objc_msgSend(v3, "nameSpace");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(CFSTR("DAV:"), "isEqualToString:", v4))
  {
    v5 = *(void **)(a1 + 32);
    objc_msgSend(v3, "name");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v5, "containsObject:", v6);

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (BOOL)hasBindPrivileges
{
  void *v3;
  id v4;
  _QWORD v6[4];
  id v7;

  objc_msgSend(MEMORY[0x24BDBCF20], "setWithObjects:", CFSTR("all"), CFSTR("write"), CFSTR("bind"), 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __37__CoreDAVContainer_hasBindPrivileges__block_invoke;
  v6[3] = &unk_24C1D9A18;
  v7 = v3;
  v4 = v3;
  LOBYTE(self) = -[CoreDAVContainer _anyPrivilegesMatches:](self, "_anyPrivilegesMatches:", v6);

  return (char)self;
}

uint64_t __37__CoreDAVContainer_hasBindPrivileges__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;

  v3 = a2;
  objc_msgSend(v3, "nameSpace");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(CFSTR("DAV:"), "isEqualToString:", v4))
  {
    v5 = *(void **)(a1 + 32);
    objc_msgSend(v3, "name");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v5, "containsObject:", v6);

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (BOOL)hasUnbindPrivileges
{
  void *v3;
  id v4;
  _QWORD v6[4];
  id v7;

  objc_msgSend(MEMORY[0x24BDBCF20], "setWithObjects:", CFSTR("all"), CFSTR("write"), CFSTR("unbind"), 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __39__CoreDAVContainer_hasUnbindPrivileges__block_invoke;
  v6[3] = &unk_24C1D9A18;
  v7 = v3;
  v4 = v3;
  LOBYTE(self) = -[CoreDAVContainer _anyPrivilegesMatches:](self, "_anyPrivilegesMatches:", v6);

  return (char)self;
}

uint64_t __39__CoreDAVContainer_hasUnbindPrivileges__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;

  v3 = a2;
  objc_msgSend(v3, "nameSpace");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(CFSTR("DAV:"), "isEqualToString:", v4))
  {
    v5 = *(void **)(a1 + 32);
    objc_msgSend(v3, "name");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v5, "containsObject:", v6);

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (NSSet)supportedReportsAsStringSet
{
  id v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  id obj;
  uint64_t v19;
  uint64_t v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  v3 = objc_alloc_init(MEMORY[0x24BDBCEF0]);
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  -[CoreDAVContainer supportedReports](self, "supportedReports");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
  if (v20)
  {
    v19 = *(_QWORD *)v26;
    do
    {
      v4 = 0;
      do
      {
        if (*(_QWORD *)v26 != v19)
          objc_enumerationMutation(obj);
        v5 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * v4);
        v21 = 0u;
        v22 = 0u;
        v23 = 0u;
        v24 = 0u;
        objc_msgSend(v5, "report");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "extraChildItems");
        v7 = (void *)objc_claimAutoreleasedReturnValue();

        v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
        if (v8)
        {
          v9 = v8;
          v10 = *(_QWORD *)v22;
          do
          {
            v11 = 0;
            do
            {
              if (*(_QWORD *)v22 != v10)
                objc_enumerationMutation(v7);
              v12 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * v11);
              v13 = objc_alloc(MEMORY[0x24BDD17C8]);
              objc_msgSend(v12, "nameSpace");
              v14 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v12, "name");
              v15 = (void *)objc_claimAutoreleasedReturnValue();
              v16 = (void *)objc_msgSend(v13, "initWithCDVNameSpace:andName:", v14, v15);

              objc_msgSend(v3, "addObject:", v16);
              ++v11;
            }
            while (v9 != v11);
            v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
          }
          while (v9);
        }

        ++v4;
      }
      while (v4 != v20);
      v20 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
    }
    while (v20);
  }

  if (!objc_msgSend(v3, "count"))
  {

    v3 = 0;
  }
  return (NSSet *)v3;
}

- (BOOL)supportsPrincipalPropertySearchReport
{
  void *v2;
  char v3;

  -[CoreDAVContainer supportedReportSetItem](self, "supportedReportSetItem");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "supportsReportWithNameSpace:andName:", CFSTR("DAV:"), CFSTR("principal-property-search"));

  return v3;
}

- (BOOL)supportsSyncCollectionReport
{
  void *v2;
  char v3;

  -[CoreDAVContainer supportedReportSetItem](self, "supportedReportSetItem");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "supportsReportWithNameSpace:andName:", CFSTR("DAV:"), CFSTR("sync-collection"));

  return v3;
}

+ (id)convertPushTransportsForNSServerNotificationCenter:(id)a3
{
  uint64_t i;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  char v12;
  uint64_t v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  uint64_t v29;
  void *v30;
  uint64_t v31;
  void *v32;
  uint64_t v33;
  void *v34;
  void *v35;
  void *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t j;
  void *v41;
  void *v42;
  void *v43;
  id v44;
  id v46;
  id obj;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  id v56;
  uint64_t v57;
  uint64_t v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  _BYTE v71[128];
  _BYTE v72[128];
  _BYTE v73[128];
  uint64_t v74;

  v74 = *MEMORY[0x24BDAC8D0];
  v67 = 0u;
  v68 = 0u;
  v69 = 0u;
  v70 = 0u;
  v46 = a3;
  objc_msgSend(v46, "transports");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v58 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v67, v73, 16);
  if (v58)
  {
    v56 = 0;
    v57 = *(_QWORD *)v68;
    do
    {
      for (i = 0; i != v58; ++i)
      {
        if (*(_QWORD *)v68 != v57)
          objc_enumerationMutation(obj);
        v4 = *(void **)(*((_QWORD *)&v67 + 1) + 8 * i);
        v63 = 0u;
        v64 = 0u;
        v65 = 0u;
        v66 = 0u;
        objc_msgSend(v4, "attributes");
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v63, v72, 16);
        if (v6)
        {
          v7 = v6;
          v8 = *(_QWORD *)v64;
LABEL_8:
          v9 = 0;
          while (1)
          {
            if (*(_QWORD *)v64 != v8)
              objc_enumerationMutation(v5);
            v10 = *(void **)(*((_QWORD *)&v63 + 1) + 8 * v9);
            objc_msgSend(v10, "name");
            v11 = (void *)objc_claimAutoreleasedReturnValue();
            v12 = objc_msgSend(v11, "isEqualToString:", CFSTR("type"));

            if ((v12 & 1) != 0)
              break;
            if (v7 == ++v9)
            {
              v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v63, v72, 16);
              if (v7)
                goto LABEL_8;
              goto LABEL_44;
            }
          }
          objc_msgSend(v10, "value");
          v13 = objc_claimAutoreleasedReturnValue();

          if (!v13)
            continue;
          v55 = (void *)v13;
          v14 = objc_alloc_init(MEMORY[0x24BDBCED8]);
          objc_msgSend(v4, "subscriptionURL");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "href");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "payloadAsFullURL");
          v17 = (void *)objc_claimAutoreleasedReturnValue();

          if (v17)
          {
            objc_msgSend(v17, "absoluteString");
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v14, "setObject:forKey:", v18, CFSTR("subscription-url"));

          }
          objc_msgSend(v4, "tokenURL");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "href");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "payloadAsFullURL");
          v21 = (void *)objc_claimAutoreleasedReturnValue();

          if (v21)
          {
            objc_msgSend(v21, "absoluteString");
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v14, "setObject:forKey:", v22, CFSTR("token-url"));

          }
          objc_msgSend(v4, "apsBundleID");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v23, "payloadAsString");
          v24 = objc_claimAutoreleasedReturnValue();

          if (v24)
            objc_msgSend(v14, "setObject:forKey:", v24, CFSTR("apsbundleid"));
          v53 = v21;
          objc_msgSend(v4, "courierServer");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v25, "payloadAsString");
          v26 = objc_claimAutoreleasedReturnValue();

          if (v26)
            objc_msgSend(v14, "setObject:forKey:", v26, CFSTR("courierserver"));
          v27 = v17;
          objc_msgSend(v4, "apsEnv");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v28, "payloadAsString");
          v29 = objc_claimAutoreleasedReturnValue();

          if (v29)
            objc_msgSend(v14, "setObject:forKey:", v29, CFSTR("env"));
          objc_msgSend(v4, "refreshInterval");
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v30, "payloadAsString");
          v31 = objc_claimAutoreleasedReturnValue();

          if (v31)
            objc_msgSend(v14, "setObject:forKey:", v31, CFSTR("refresh-interval"));
          v49 = (void *)v31;
          v52 = (void *)v24;
          v54 = v27;
          objc_msgSend(v4, "xmppServer");
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v32, "payloadAsString");
          v33 = objc_claimAutoreleasedReturnValue();

          if (v33)
            objc_msgSend(v14, "setObject:forKey:", v33, CFSTR("xmpp-server"));
          v48 = (void *)v33;
          v50 = (void *)v29;
          v51 = (void *)v26;
          objc_msgSend(v4, "xmppURI");
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v34, "payloadAsString");
          v35 = (void *)objc_claimAutoreleasedReturnValue();

          if (v35)
            objc_msgSend(v14, "setObject:forKey:", v35, CFSTR("xmpp-uri"));
          v61 = 0u;
          v62 = 0u;
          v59 = 0u;
          v60 = 0u;
          objc_msgSend(v4, "extraChildItems");
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          v37 = objc_msgSend(v36, "countByEnumeratingWithState:objects:count:", &v59, v71, 16);
          if (v37)
          {
            v38 = v37;
            v39 = *(_QWORD *)v60;
            do
            {
              for (j = 0; j != v38; ++j)
              {
                if (*(_QWORD *)v60 != v39)
                  objc_enumerationMutation(v36);
                v41 = *(void **)(*((_QWORD *)&v59 + 1) + 8 * j);
                objc_msgSend(v41, "payloadAsString");
                v42 = (void *)objc_claimAutoreleasedReturnValue();
                if (v42)
                {
                  objc_msgSend(v41, "name");
                  v43 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v14, "setObject:forKey:", v42, v43);

                }
              }
              v38 = objc_msgSend(v36, "countByEnumeratingWithState:objects:count:", &v59, v71, 16);
            }
            while (v38);
          }

          v44 = v56;
          if (!v56)
            v44 = objc_alloc_init(MEMORY[0x24BDBCED8]);
          v56 = v44;
          objc_msgSend(v44, "setObject:forKey:", v14, v55);

          v5 = v55;
        }
LABEL_44:

      }
      v58 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v67, v73, 16);
    }
    while (v58);
  }
  else
  {
    v56 = 0;
  }

  return v56;
}

- (NSURL)url
{
  return self->_url;
}

- (void)setUrl:(id)a3
{
  objc_storeStrong((id *)&self->_url, a3);
}

- (BOOL)isUnauthenticated
{
  return self->_isUnauthenticated;
}

- (void)setIsUnauthenticated:(BOOL)a3
{
  self->_isUnauthenticated = a3;
}

- (NSString)containerTitle
{
  return self->_containerTitle;
}

- (void)setContainerTitle:(id)a3
{
  objc_storeStrong((id *)&self->_containerTitle, a3);
}

- (NSSet)privileges
{
  return self->_privileges;
}

- (void)setPrivileges:(id)a3
{
  objc_storeStrong((id *)&self->_privileges, a3);
}

- (NSString)pushKey
{
  return self->_pushKey;
}

- (void)setPushKey:(id)a3
{
  objc_storeStrong((id *)&self->_pushKey, a3);
}

- (NSDictionary)pushTransports
{
  return self->_pushTransports;
}

- (void)setPushTransports:(id)a3
{
  objc_storeStrong((id *)&self->_pushTransports, a3);
}

- (NSURL)resourceID
{
  return self->_resourceID;
}

- (void)setResourceID:(id)a3
{
  objc_storeStrong((id *)&self->_resourceID, a3);
}

- (NSString)quotaAvailable
{
  return self->_quotaAvailable;
}

- (void)setQuotaAvailable:(id)a3
{
  objc_storeStrong((id *)&self->_quotaAvailable, a3);
}

- (NSString)quotaUsed
{
  return self->_quotaUsed;
}

- (void)setQuotaUsed:(id)a3
{
  objc_storeStrong((id *)&self->_quotaUsed, a3);
}

- (CoreDAVSupportedReportSetItem)supportedReportSetItem
{
  return self->_supportedReportSetItem;
}

- (void)setSupportedReportSetItem:(id)a3
{
  objc_storeStrong((id *)&self->_supportedReportSetItem, a3);
}

- (CoreDAVResourceTypeItem)resourceType
{
  return self->_resourceType;
}

- (void)setResourceType:(id)a3
{
  objc_storeStrong((id *)&self->_resourceType, a3);
}

- (NSURL)owner
{
  return self->_owner;
}

- (void)setOwner:(id)a3
{
  objc_storeStrong((id *)&self->_owner, a3);
}

- (NSURL)addMemberURL
{
  return self->_addMemberURL;
}

- (void)setAddMemberURL:(id)a3
{
  objc_storeStrong((id *)&self->_addMemberURL, a3);
}

- (NSDictionary)bulkRequests
{
  return self->_bulkRequests;
}

- (void)setBulkRequests:(id)a3
{
  objc_storeStrong((id *)&self->_bulkRequests, a3);
}

- (NSString)syncToken
{
  return self->_syncToken;
}

- (void)setSyncToken:(id)a3
{
  objc_storeStrong((id *)&self->_syncToken, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_syncToken, 0);
  objc_storeStrong((id *)&self->_bulkRequests, 0);
  objc_storeStrong((id *)&self->_addMemberURL, 0);
  objc_storeStrong((id *)&self->_owner, 0);
  objc_storeStrong((id *)&self->_quotaUsed, 0);
  objc_storeStrong((id *)&self->_quotaAvailable, 0);
  objc_storeStrong((id *)&self->_supportedReportSetItem, 0);
  objc_storeStrong((id *)&self->_resourceID, 0);
  objc_storeStrong((id *)&self->_pushTransports, 0);
  objc_storeStrong((id *)&self->_pushKey, 0);
  objc_storeStrong((id *)&self->_privileges, 0);
  objc_storeStrong((id *)&self->_containerTitle, 0);
  objc_storeStrong((id *)&self->_resourceType, 0);
  objc_storeStrong((id *)&self->_url, 0);
}

@end
