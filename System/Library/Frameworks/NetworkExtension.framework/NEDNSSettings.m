@implementation NEDNSSettings

- (NEDNSProtocol)dnsProtocol
{
  return 1;
}

- (NEDNSSettings)initWithServers:(NSArray *)servers
{
  NSArray *v4;
  NEDNSSettings *v5;
  uint64_t v6;
  NSArray *v7;
  objc_super v9;

  v4 = servers;
  v9.receiver = self;
  v9.super_class = (Class)NEDNSSettings;
  v5 = -[NEDNSSettings init](&v9, sel_init);
  if (v5)
  {
    v6 = -[NSArray copy](v4, "copy");
    v7 = v5->_servers;
    v5->_servers = (NSArray *)v6;

  }
  return v5;
}

- (NEDNSSettings)initWithCoder:(id)a3
{
  id v4;
  NEDNSSettings *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  NSArray *servers;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  NSArray *searchDomains;
  uint64_t v16;
  NSString *domainName;
  void *v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  NSArray *matchDomains;
  uint64_t v23;
  NSUUID *proxyAgentUUID;
  objc_super v26;

  v4 = a3;
  v26.receiver = self;
  v26.super_class = (Class)NEDNSSettings;
  v5 = -[NEDNSSettings init](&v26, sel_init);
  if (v5)
  {
    v6 = (void *)MEMORY[0x1E0C99E60];
    v7 = objc_opt_class();
    objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v8, CFSTR("Servers"));
    v9 = objc_claimAutoreleasedReturnValue();
    servers = v5->_servers;
    v5->_servers = (NSArray *)v9;

    v11 = (void *)MEMORY[0x1E0C99E60];
    v12 = objc_opt_class();
    objc_msgSend(v11, "setWithObjects:", v12, objc_opt_class(), 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v13, CFSTR("SearchDomains"));
    v14 = objc_claimAutoreleasedReturnValue();
    searchDomains = v5->_searchDomains;
    v5->_searchDomains = (NSArray *)v14;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("domainName"));
    v16 = objc_claimAutoreleasedReturnValue();
    domainName = v5->_domainName;
    v5->_domainName = (NSString *)v16;

    v18 = (void *)MEMORY[0x1E0C99E60];
    v19 = objc_opt_class();
    objc_msgSend(v18, "setWithObjects:", v19, objc_opt_class(), 0);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v20, CFSTR("matchDomains"));
    v21 = objc_claimAutoreleasedReturnValue();
    matchDomains = v5->_matchDomains;
    v5->_matchDomains = (NSArray *)v21;

    v5->_matchDomainsNoSearch = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("matchDomainsNoSearch"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("ProxyAgentUUID"));
    v23 = objc_claimAutoreleasedReturnValue();
    proxyAgentUUID = v5->_proxyAgentUUID;
    v5->_proxyAgentUUID = (NSUUID *)v23;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v4 = a3;
  -[NEDNSSettings servers](self, "servers");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("Servers"));

  -[NEDNSSettings searchDomains](self, "searchDomains");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("SearchDomains"));

  -[NEDNSSettings domainName](self, "domainName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("domainName"));

  -[NEDNSSettings matchDomains](self, "matchDomains");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v8, CFSTR("matchDomains"));

  objc_msgSend(v4, "encodeBool:forKey:", -[NEDNSSettings matchDomainsNoSearch](self, "matchDomainsNoSearch"), CFSTR("matchDomainsNoSearch"));
  -[NEDNSSettings proxyAgentUUID](self, "proxyAgentUUID");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v9, CFSTR("ProxyAgentUUID"));

}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;
  void *v5;
  void *v6;

  v4 = (void *)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3);
  -[NEDNSSettings servers](self, "servers");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v4, "initWithServers:", v5);

  objc_msgSend(v6, "setSearchDomains:", self->_searchDomains);
  objc_msgSend(v6, "setDomainName:", self->_domainName);
  objc_msgSend(v6, "setMatchDomains:", self->_matchDomains);
  objc_msgSend(v6, "setMatchDomainsNoSearch:", self->_matchDomainsNoSearch);
  objc_msgSend(v6, "setProxyAgentUUID:", self->_proxyAgentUUID);
  return v6;
}

- (BOOL)checkValidityAndCollectErrors:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  char v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  id v15;
  __CFString *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t j;
  NEDNSSettings *v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _QWORD v29[2];
  int v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  _BYTE v35[128];
  _BYTE v36[128];
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (-[NEDNSSettings isMemberOfClass:](self, "isMemberOfClass:", objc_opt_class()))
  {
    -[NEDNSSettings servers](self, "servers");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {

    }
    else
    {
      -[NEDNSSettings searchDomains](self, "searchDomains");
      v6 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v6)
      {
        +[NEConfiguration addError:toList:]((uint64_t)NEConfiguration, CFSTR("Missing both DNS servers and DNS search domains"), v4);
        v7 = 0;
        goto LABEL_6;
      }
    }
  }
  v7 = 1;
LABEL_6:
  -[NEDNSSettings servers](self, "servers");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v8)
    goto LABEL_21;
  v33 = 0u;
  v34 = 0u;
  v31 = 0u;
  v32 = 0u;
  v24 = self;
  -[NEDNSSettings servers](self, "servers");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v31, v36, 16);
  if (!v10)
    goto LABEL_20;
  v11 = v10;
  v12 = *(_QWORD *)v32;
  do
  {
    for (i = 0; i != v11; ++i)
    {
      if (*(_QWORD *)v32 != v12)
        objc_enumerationMutation(v9);
      v14 = *(void **)(*((_QWORD *)&v31 + 1) + 8 * i);
      if ((isa_nsstring(v14) & 1) == 0)
      {
        v16 = CFSTR("Non-string for DNS server");
        goto LABEL_17;
      }
      v30 = 0;
      v29[0] = 0;
      v29[1] = 0;
      v15 = objc_retainAutorelease(v14);
      if (!inet_pton(2, (const char *)objc_msgSend(v15, "UTF8String"), &v30)
        && !inet_pton(30, (const char *)objc_msgSend(objc_retainAutorelease(v15), "UTF8String"), v29))
      {
        v16 = CFSTR("Invalid DNS server");
LABEL_17:
        +[NEConfiguration addError:toList:]((uint64_t)NEConfiguration, v16, v4);
        v7 = 0;
        continue;
      }
    }
    v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v31, v36, 16);
  }
  while (v11);
LABEL_20:

  self = v24;
LABEL_21:
  -[NEDNSSettings searchDomains](self, "searchDomains");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (v17)
  {
    v27 = 0u;
    v28 = 0u;
    v25 = 0u;
    v26 = 0u;
    -[NEDNSSettings searchDomains](self, "searchDomains");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v25, v35, 16);
    if (v19)
    {
      v20 = v19;
      v21 = *(_QWORD *)v26;
      do
      {
        for (j = 0; j != v20; ++j)
        {
          if (*(_QWORD *)v26 != v21)
            objc_enumerationMutation(v18);
          if ((isa_nsstring(*(void **)(*((_QWORD *)&v25 + 1) + 8 * j)) & 1) == 0)
          {
            +[NEConfiguration addError:toList:]((uint64_t)NEConfiguration, CFSTR("Non-string for DNS search domain"), v4);
            v7 = 0;
          }
        }
        v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v25, v35, 16);
      }
      while (v20);
    }

  }
  return v7 & 1;
}

- (id)descriptionWithIndent:(int)a3 options:(unint64_t)a4
{
  uint64_t v5;
  void *v7;
  unint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v5 = *(_QWORD *)&a3;
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37A0]), "initWithCapacity:", 0);
  v8 = -[NEDNSSettings dnsProtocol](self, "dnsProtocol") - 1;
  if (v8 <= 2)
    objc_msgSend(v7, "appendPrettyObject:withName:andIndent:options:", off_1E3CBFDC8[v8], CFSTR("protocol"), v5, a4);
  -[NEDNSSettings servers](self, "servers");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "appendPrettyObject:withName:andIndent:options:", v9, CFSTR("server"), v5, a4 | 1);

  -[NEDNSSettings domainName](self, "domainName");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "appendPrettyObject:withName:andIndent:options:", v10, CFSTR("domainName"), v5, a4 | 1);

  -[NEDNSSettings searchDomains](self, "searchDomains");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "appendPrettyObject:withName:andIndent:options:", v11, CFSTR("searchDomains"), v5, a4 | 1);

  -[NEDNSSettings matchDomains](self, "matchDomains");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "appendPrettyObject:withName:andIndent:options:", v12, CFSTR("matchDomains"), v5, a4 | 1);

  objc_msgSend(v7, "appendPrettyBOOL:withName:andIndent:options:", -[NEDNSSettings matchDomainsNoSearch](self, "matchDomainsNoSearch"), CFSTR("matchDomainsNoSearch"), v5, a4);
  return v7;
}

- (id)copyLegacyDictionary
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v3 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  -[NEDNSSettings servers](self, "servers");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[NEDNSSettings servers](self, "servers");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, *MEMORY[0x1E0CE8C28]);

  }
  -[NEDNSSettings searchDomains](self, "searchDomains");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[NEDNSSettings searchDomains](self, "searchDomains");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, *MEMORY[0x1E0CE8C20]);

  }
  -[NEDNSSettings domainName](self, "domainName");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[NEDNSSettings domainName](self, "domainName");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, *MEMORY[0x1E0CE8C18]);

  }
  -[NEDNSSettings matchDomains](self, "matchDomains");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    -[NEDNSSettings matchDomains](self, "matchDomains");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v11, *MEMORY[0x1E0CE8C40]);

  }
  if (-[NEDNSSettings matchDomainsNoSearch](self, "matchDomainsNoSearch"))
    objc_msgSend(v3, "setObject:forKeyedSubscript:", &unk_1E3D03598, *MEMORY[0x1E0CE8C48]);
  return v3;
}

- (id)initFromLegacyDictionary:(id)a3
{
  id v4;
  NEDNSSettings *v5;
  uint64_t v6;
  void *v7;
  int v8;
  void *v9;
  uint64_t v10;
  NSArray *servers;
  uint64_t v12;
  void *v13;
  int v14;
  void *v15;
  uint64_t v16;
  NSArray *searchDomains;
  uint64_t v18;
  void *v19;
  int v20;
  uint64_t v21;
  NSString *domainName;
  uint64_t v23;
  void *v24;
  int v25;
  void *v26;
  uint64_t v27;
  NSArray *matchDomains;
  uint64_t v29;
  void *v30;
  int v31;
  void *v32;
  objc_super v34;

  v4 = a3;
  v34.receiver = self;
  v34.super_class = (Class)NEDNSSettings;
  v5 = -[NEDNSSettings init](&v34, sel_init);
  if (v5)
  {
    v6 = *MEMORY[0x1E0CE8C28];
    objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x1E0CE8C28]);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = isa_nsarray(v7);

    if (v8)
    {
      objc_msgSend(v4, "objectForKeyedSubscript:", v6);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v9, "copy");
      servers = v5->_servers;
      v5->_servers = (NSArray *)v10;

    }
    v12 = *MEMORY[0x1E0CE8C20];
    objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x1E0CE8C20]);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = isa_nsarray(v13);

    if (v14)
    {
      objc_msgSend(v4, "objectForKeyedSubscript:", v12);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_msgSend(v15, "copy");
      searchDomains = v5->_searchDomains;
      v5->_searchDomains = (NSArray *)v16;

    }
    v18 = *MEMORY[0x1E0CE8C18];
    objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x1E0CE8C18]);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = isa_nsstring(v19);

    if (v20)
    {
      objc_msgSend(v4, "objectForKeyedSubscript:", v18);
      v21 = objc_claimAutoreleasedReturnValue();
      domainName = v5->_domainName;
      v5->_domainName = (NSString *)v21;

    }
    v23 = *MEMORY[0x1E0CE8C40];
    objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x1E0CE8C40]);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = isa_nsarray(v24);

    if (v25)
    {
      objc_msgSend(v4, "objectForKeyedSubscript:", v23);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = objc_msgSend(v26, "copy");
      matchDomains = v5->_matchDomains;
      v5->_matchDomains = (NSArray *)v27;

    }
    v29 = *MEMORY[0x1E0CE8C48];
    objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x1E0CE8C48]);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = isa_nsnumber(v30);

    if (v31)
    {
      objc_msgSend(v4, "objectForKeyedSubscript:", v29);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      v5->_matchDomainsNoSearch = objc_msgSend(v32, "BOOLValue");

    }
  }

  return v5;
}

- (BOOL)useForAllDomains
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  BOOL v8;

  -[NEDNSSettings matchDomains](self, "matchDomains");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[NEDNSSettings matchDomains](self, "matchDomains");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v4, "count"))
    {
      -[NEDNSSettings matchDomains](self, "matchDomains");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v5, "count") == 1)
      {
        -[NEDNSSettings matchDomains](self, "matchDomains");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "objectAtIndexedSubscript:", 0);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v8 = objc_msgSend(v7, "length") == 0;

      }
      else
      {
        v8 = 0;
      }

    }
    else
    {
      v8 = 1;
    }

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (NSArray)servers
{
  return (NSArray *)objc_getProperty(self, a2, 16, 1);
}

- (NSArray)searchDomains
{
  return (NSArray *)objc_getProperty(self, a2, 24, 1);
}

- (void)setSearchDomains:(NSArray *)searchDomains
{
  objc_setProperty_atomic_copy(self, a2, searchDomains, 24);
}

- (NSString)domainName
{
  return (NSString *)objc_getProperty(self, a2, 32, 1);
}

- (void)setDomainName:(NSString *)domainName
{
  objc_setProperty_atomic_copy(self, a2, domainName, 32);
}

- (NSArray)matchDomains
{
  return (NSArray *)objc_getProperty(self, a2, 40, 1);
}

- (void)setMatchDomains:(NSArray *)matchDomains
{
  objc_setProperty_atomic_copy(self, a2, matchDomains, 40);
}

- (BOOL)matchDomainsNoSearch
{
  return self->_matchDomainsNoSearch;
}

- (void)setMatchDomainsNoSearch:(BOOL)matchDomainsNoSearch
{
  self->_matchDomainsNoSearch = matchDomainsNoSearch;
}

- (NSUUID)proxyAgentUUID
{
  return self->_proxyAgentUUID;
}

- (void)setProxyAgentUUID:(id)a3
{
  objc_storeStrong((id *)&self->_proxyAgentUUID, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_proxyAgentUUID, 0);
  objc_storeStrong((id *)&self->_matchDomains, 0);
  objc_storeStrong((id *)&self->_domainName, 0);
  objc_storeStrong((id *)&self->_searchDomains, 0);
  objc_storeStrong((id *)&self->_servers, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
