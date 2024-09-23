@implementation CardDAVGetAccountPropertiesTaskGroup

- (id)description
{
  void *v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CardDAVGetAccountPropertiesTaskGroup;
  -[CoreDAVGetAccountPropertiesTaskGroup description](&v6, sel_description);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "mutableCopy");

  objc_msgSend(v4, "appendFormat:", CFSTR("\tAddressBook home urls: %@\n"), self->_addressBookHomes);
  objc_msgSend(v4, "appendFormat:", CFSTR("\tDirectory Gateway urls: %@\n"), self->_directoryGatewayURLs);
  return v4;
}

- (id)_copyAccountPropertiesPropFindElements
{
  id v2;
  void *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CardDAVGetAccountPropertiesTaskGroup;
  v2 = -[CoreDAVGetAccountPropertiesTaskGroup _copyAccountPropertiesPropFindElements](&v5, sel__copyAccountPropertiesPropFindElements);
  v3 = (void *)objc_msgSend(v2, "mutableCopy");
  objc_msgSend(v3, "CDVAddItemParserMappingWithNameSpace:name:parseClass:", CFSTR("urn:ietf:params:xml:ns:carddav"), CFSTR("addressbook-home-set"), objc_opt_class());
  objc_msgSend(v3, "CDVAddItemParserMappingWithNameSpace:name:parseClass:", CFSTR("urn:ietf:params:xml:ns:carddav"), CFSTR("directory-gateway"), objc_opt_class());

  return v3;
}

- (id)homeSet
{
  return self->_addressBookHomes;
}

- (void)_setPropertiesFromParsedResponses:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id obj;
  uint64_t v15;
  objc_super v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  obj = a3;
  v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v4)
  {
    v5 = v4;
    v15 = *(_QWORD *)v18;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v18 != v15)
          objc_enumerationMutation(obj);
        objc_msgSend(*(id *)(*((_QWORD *)&v17 + 1) + 8 * i), "successfulPropertiesToValues");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "CDVObjectForKeyWithNameSpace:andName:", CFSTR("urn:ietf:params:xml:ns:carddav"), CFSTR("addressbook-home-set"));
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "hrefsAsFullURLs");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v9, "count"))
          v10 = v9;
        else
          v10 = 0;
        objc_storeStrong((id *)&self->_addressBookHomes, v10);
        objc_msgSend(v7, "CDVObjectForKeyWithNameSpace:andName:", CFSTR("urn:ietf:params:xml:ns:carddav"), CFSTR("directory-gateway"));
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "hrefsAsFullURLs");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v12, "count"))
          v13 = v12;
        else
          v13 = 0;
        objc_storeStrong((id *)&self->_directoryGatewayURLs, v13);

      }
      v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v5);
  }
  v16.receiver = self;
  v16.super_class = (Class)CardDAVGetAccountPropertiesTaskGroup;
  -[CoreDAVGetAccountPropertiesTaskGroup _setPropertiesFromParsedResponses:](&v16, sel__setPropertiesFromParsedResponses_, obj);

}

- (id)directoryGatewayURL
{
  return -[NSSet anyObject](self->_directoryGatewayURLs, "anyObject");
}

- (NSSet)addressBookHomes
{
  return self->_addressBookHomes;
}

- (NSSet)directoryGatewayURLs
{
  return self->_directoryGatewayURLs;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_directoryGatewayURLs, 0);
  objc_storeStrong((id *)&self->_addressBookHomes, 0);
}

@end
