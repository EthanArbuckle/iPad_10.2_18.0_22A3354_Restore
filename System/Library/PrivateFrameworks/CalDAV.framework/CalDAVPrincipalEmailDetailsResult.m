@implementation CalDAVPrincipalEmailDetailsResult

+ (id)resultFromResponseItem:(id)a3
{
  id v3;
  CalDAVPrincipalEmailDetailsResult *v4;
  void *v5;
  void *v6;
  void *v7;
  void (**v8)(_QWORD, _QWORD);
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
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  void *v26;
  id v28;
  void *v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  _QWORD v38[4];
  id v39;
  _BYTE v40[128];
  _BYTE v41[128];
  uint64_t v42;

  v42 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  v4 = objc_alloc_init(CalDAVPrincipalEmailDetailsResult);
  objc_msgSend(v3, "firstHref");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "payloadAsFullURL");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[CalDAVPrincipalEmailDetailsResult setPrincipalURL:](v4, "setPrincipalURL:", v6);

  v29 = v3;
  objc_msgSend(v3, "successfulPropertiesToValues");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v38[0] = MEMORY[0x24BDAC760];
  v38[1] = 3221225472;
  v38[2] = __60__CalDAVPrincipalEmailDetailsResult_resultFromResponseItem___block_invoke;
  v38[3] = &unk_24C1FB5E8;
  v28 = v7;
  v39 = v28;
  v8 = (void (**)(_QWORD, _QWORD))MEMORY[0x20BD12C84](v38);
  v8[2](v8, 3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "payloadAsString");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[CalDAVPrincipalEmailDetailsResult setDisplayName:](v4, "setDisplayName:", v10);

  objc_msgSend(MEMORY[0x24BDBCEF0], "set");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v8[2](v8, 6);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v36 = 0u;
    v37 = 0u;
    v34 = 0u;
    v35 = 0u;
    objc_msgSend(v12, "hrefs");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v34, v41, 16);
    if (v14)
    {
      v15 = v14;
      v16 = *(_QWORD *)v35;
      do
      {
        v17 = 0;
        do
        {
          if (*(_QWORD *)v35 != v16)
            objc_enumerationMutation(v13);
          +[CalDAVCalendarUserAddressItemTranslator calDAVUserAddressForItem:](CalDAVCalendarUserAddressItemTranslator, "calDAVUserAddressForItem:", *(_QWORD *)(*((_QWORD *)&v34 + 1) + 8 * v17));
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          if (v18)
            objc_msgSend(v11, "addObject:", v18);

          ++v17;
        }
        while (v15 != v17);
        v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v34, v41, 16);
      }
      while (v15);
    }

  }
  v8[2](v8, 4);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v32 = 0u;
    v33 = 0u;
    v30 = 0u;
    v31 = 0u;
    objc_msgSend(v19, "emailAddresses");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v30, v40, 16);
    if (v21)
    {
      v22 = v21;
      v23 = *(_QWORD *)v31;
      do
      {
        v24 = 0;
        do
        {
          if (*(_QWORD *)v31 != v23)
            objc_enumerationMutation(v20);
          +[CalDAVCalendarUserAddressItemTranslator calDAVUserAddressForItem:prependMailTo:](CalDAVCalendarUserAddressItemTranslator, "calDAVUserAddressForItem:prependMailTo:", *(_QWORD *)(*((_QWORD *)&v30 + 1) + 8 * v24), 1);
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          if (v25)
            objc_msgSend(v11, "addObject:", v25);

          ++v24;
        }
        while (v22 != v24);
        v22 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v30, v40, 16);
      }
      while (v22);
    }

  }
  objc_msgSend(MEMORY[0x24BDBCF20], "setWithSet:", v11);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  -[CalDAVPrincipalEmailDetailsResult setPreferredAddresses:](v4, "setPreferredAddresses:", v26);

  return v4;
}

id __60__CalDAVPrincipalEmailDetailsResult_resultFromResponseItem___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v2;
  void *v3;
  void *v4;

  v2 = *(void **)(a1 + 32);
  +[CalDAVPrincipalSearchSupport namespaceAndNameForWellKnownType:](CalDAVPrincipalSearchSupport, "namespaceAndNameForWellKnownType:", a2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)addresses
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v3 = (void *)objc_opt_new();
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  -[CalDAVPrincipalEmailDetailsResult preferredAddresses](self, "preferredAddresses", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v13;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v13 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * v8), "address");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "absoluteString");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "addObject:", v10);

        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v6);
  }

  return v3;
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CalDAVPrincipalEmailDetailsResult displayName](self, "displayName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[CalDAVPrincipalEmailDetailsResult addresses](self, "addresses");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@ %p: '%@' addresses: (%lu)>"), v5, self, v6, objc_msgSend(v7, "count"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (NSURL)principalURL
{
  return self->_principalURL;
}

- (void)setPrincipalURL:(id)a3
{
  objc_storeStrong((id *)&self->_principalURL, a3);
}

- (NSString)displayName
{
  return self->_displayName;
}

- (void)setDisplayName:(id)a3
{
  objc_storeStrong((id *)&self->_displayName, a3);
}

- (NSSet)preferredAddresses
{
  return self->_preferredAddresses;
}

- (void)setPreferredAddresses:(id)a3
{
  objc_storeStrong((id *)&self->_preferredAddresses, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_preferredAddresses, 0);
  objc_storeStrong((id *)&self->_displayName, 0);
  objc_storeStrong((id *)&self->_principalURL, 0);
}

@end
