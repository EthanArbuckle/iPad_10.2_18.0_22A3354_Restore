@implementation CalDAVGetAccountPropertiesTaskGroup

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)CalDAVGetAccountPropertiesTaskGroup;
  -[CoreDAVGetAccountPropertiesTaskGroup description](&v7, sel_description);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "mutableCopy");

  objc_msgSend(v4, "appendFormat:", CFSTR("\tCalendar home paths: %@\n"), self->_calendarHomes);
  objc_msgSend(v4, "appendFormat:", CFSTR("\tInbox path: %@\n"), self->_inboxURL);
  objc_msgSend(v4, "appendFormat:", CFSTR("\tOutbox path: %@\n"), self->_outboxURL);
  objc_msgSend(v4, "appendFormat:", CFSTR("\tDropbox path: %@\n"), self->_dropboxURL);
  objc_msgSend(v4, "appendFormat:", CFSTR("\tNotification path: %@\n"), self->_notificationURL);
  -[CalDAVGetAccountPropertiesTaskGroup userAddresses](self, "userAddresses");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "appendFormat:", CFSTR("\tUser addresses: %@\n"), v5);

  objc_msgSend(v4, "appendFormat:", CFSTR("\tServer version: %@\n"), self->_serverVersion);
  objc_msgSend(v4, "appendFormat:", CFSTR("\tNew Principal URL: %@\n"), self->_updatedPrincipalURL);
  return v4;
}

- (id)_copyAccountPropertiesPropFindElements
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  id WeakRetained;
  void *v8;
  int v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)CalDAVGetAccountPropertiesTaskGroup;
  v3 = -[CoreDAVGetAccountPropertiesTaskGroup _copyAccountPropertiesPropFindElements](&v11, sel__copyAccountPropertiesPropFindElements);
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEF0]), "initWithSet:", v3);
  objc_msgSend(v4, "CDVAddItemParserMappingWithNameSpace:name:parseClass:", *MEMORY[0x24BE1AE30], *MEMORY[0x24BE1AE28], objc_opt_class());
  v5 = *MEMORY[0x24BE1ACF8];
  objc_msgSend(v4, "CDVAddItemParserMappingWithNameSpace:name:parseClass:", *MEMORY[0x24BE1ACF8], *MEMORY[0x24BE1ACB0], objc_opt_class());
  objc_msgSend(v4, "CDVAddItemParserMappingWithNameSpace:name:parseClass:", v5, *MEMORY[0x24BE1AD00], objc_opt_class());
  objc_msgSend(v4, "CDVAddItemParserMappingWithNameSpace:name:parseClass:", v5, *MEMORY[0x24BE1ACD0], objc_opt_class());
  objc_msgSend(v4, "CDVAddItemParserMappingWithNameSpace:name:parseClass:", v5, *MEMORY[0x24BE1ACE8], objc_opt_class());
  objc_msgSend(v4, "CDVAddItemParserMappingWithNameSpace:name:parseClass:", v5, *MEMORY[0x24BE1AEC8], objc_opt_class());
  v6 = *MEMORY[0x24BE1ADC8];
  objc_msgSend(v4, "CDVAddItemParserMappingWithNameSpace:name:parseClass:", *MEMORY[0x24BE1ADC8], *MEMORY[0x24BE1AD58], objc_opt_class());
  objc_msgSend(v4, "CDVAddItemParserMappingWithNameSpace:name:parseClass:", v6, *MEMORY[0x24BE1AD78], objc_opt_class());
  WeakRetained = objc_loadWeakRetained((id *)((char *)&self->super.super.super.isa + (int)*MEMORY[0x24BE1AC80]));
  objc_msgSend(WeakRetained, "host");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "hasSuffix:", CFSTR("me.com"));

  if (v9)
    objc_msgSend(v4, "CDVAddItemParserMappingWithNameSpace:name:parseClass:", *MEMORY[0x24BE1AEC0], *MEMORY[0x24BE1AEA0], objc_opt_class());

  return v4;
}

- (void)startTaskGroup
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  id WeakRetained;
  id v9;
  id v10;

  v10 = -[CalDAVGetAccountPropertiesTaskGroup _copyAccountPropertiesPropFindElements](self, "_copyAccountPropertiesPropFindElements");
  -[CalDAVGetAccountPropertiesTaskGroup delegatePrincipalURL](self, "delegatePrincipalURL");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v5 = v3;
  }
  else
  {
    -[CoreDAVTaskGroup accountInfoProvider](self, "accountInfoProvider");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "principalURL");
    v5 = (id)objc_claimAutoreleasedReturnValue();

  }
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE1ABA0]), "initWithPropertiesToFind:atURL:withDepth:", v10, v5, 2);
  objc_msgSend(*(id *)((char *)&self->super.super.super.isa + (int)*MEMORY[0x24BE1AC90]), "addObject:", v7);
  objc_msgSend(v7, "setDelegate:", self);
  WeakRetained = objc_loadWeakRetained((id *)((char *)&self->super.super.super.isa + (int)*MEMORY[0x24BE1AC80]));
  objc_msgSend(v7, "setAccountInfoProvider:", WeakRetained);

  v9 = objc_loadWeakRetained((id *)((char *)&self->super.super.super.isa + (int)*MEMORY[0x24BE1AC98]));
  objc_msgSend(v9, "submitQueuedCoreDAVTask:", v7);

}

- (id)homeSet
{
  return self->_calendarHomes;
}

- (void)_setPropertiesFromParsedResponses:(id)a3
{
  __int128 v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  NSSet *v11;
  NSSet *preferredUserAddresses;
  void *v13;
  NSSet *v14;
  NSSet *calendarHomes;
  void *v16;
  void *v17;
  NSURL *v18;
  NSURL *inboxURL;
  void *v20;
  void *v21;
  NSURL *v22;
  NSURL *notificationURL;
  void *v24;
  void *v25;
  NSURL *v26;
  NSURL *outboxURL;
  void *v28;
  void *v29;
  NSURL *v30;
  NSURL *dropboxURL;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  id v36;
  NSObject *v37;
  NSObject *v38;
  const char *v39;
  uint32_t v40;
  id WeakRetained;
  void *v42;
  void *v43;
  void *v44;
  NSURL *v45;
  NSURL *v46;
  void *v47;
  id v48;
  NSObject *v49;
  NSObject *v50;
  const char *v51;
  void *v52;
  NSURL *v53;
  NSURL *updatedPrincipalURL;
  id v55;
  id v56;
  void *v57;
  __int128 v58;
  uint64_t v59;
  id obj;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  objc_super v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  uint8_t buf[4];
  void *v79;
  _BYTE v80[128];
  uint64_t v81;

  v81 = *MEMORY[0x24BDAC8D0];
  v74 = 0u;
  v75 = 0u;
  v76 = 0u;
  v77 = 0u;
  obj = a3;
  v71 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v74, v80, 16);
  if (v71)
  {
    v70 = *(_QWORD *)v75;
    v5 = *MEMORY[0x24BE1ACF8];
    v69 = *MEMORY[0x24BE1AD00];
    v68 = *MEMORY[0x24BE1ACB0];
    v67 = *MEMORY[0x24BE1ACD0];
    v6 = *MEMORY[0x24BE1ADC8];
    v65 = *MEMORY[0x24BE1AD78];
    v64 = *MEMORY[0x24BE1ACE8];
    v63 = *MEMORY[0x24BE1AD58];
    v7 = *MEMORY[0x24BE1AE30];
    v62 = *MEMORY[0x24BE1AE28];
    v59 = *MEMORY[0x24BE1AEF8];
    v61 = *MEMORY[0x24BE1AF68];
    *(_QWORD *)&v4 = 138412290;
    v58 = v4;
    v66 = *MEMORY[0x24BE1ADC8];
    v72 = *MEMORY[0x24BE1AE30];
    do
    {
      for (i = 0; i != v71; ++i)
      {
        if (*(_QWORD *)v75 != v70)
          objc_enumerationMutation(obj);
        objc_msgSend(*(id *)(*((_QWORD *)&v74 + 1) + 8 * i), "successfulPropertiesToValues", v58);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "CDVObjectForKeyWithNameSpace:andName:", v5, v69);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        +[CalDAVCalendarUserAddressItemTranslator userAddressesForAddressSetItem:](CalDAVCalendarUserAddressItemTranslator, "userAddressesForAddressSetItem:", v10);
        v11 = (NSSet *)objc_claimAutoreleasedReturnValue();
        preferredUserAddresses = self->_preferredUserAddresses;
        self->_preferredUserAddresses = v11;

        objc_msgSend(v9, "CDVObjectForKeyWithNameSpace:andName:", v5, v68);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "hrefsAsFullURLs");
        v14 = (NSSet *)objc_claimAutoreleasedReturnValue();
        calendarHomes = self->_calendarHomes;
        self->_calendarHomes = v14;

        objc_msgSend(v9, "CDVObjectForKeyWithNameSpace:andName:", v5, v67);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "href");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "payloadAsFullURL");
        v18 = (NSURL *)objc_claimAutoreleasedReturnValue();
        inboxURL = self->_inboxURL;
        self->_inboxURL = v18;

        objc_msgSend(v9, "CDVObjectForKeyWithNameSpace:andName:", v6, v65);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "href");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "payloadAsFullURL");
        v22 = (NSURL *)objc_claimAutoreleasedReturnValue();
        notificationURL = self->_notificationURL;
        self->_notificationURL = v22;

        objc_msgSend(v9, "CDVObjectForKeyWithNameSpace:andName:", v5, v64);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "href");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "payloadAsFullURL");
        v26 = (NSURL *)objc_claimAutoreleasedReturnValue();
        outboxURL = self->_outboxURL;
        self->_outboxURL = v26;

        objc_msgSend(v9, "CDVObjectForKeyWithNameSpace:andName:", v6, v63);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "href");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "payloadAsFullURL");
        v30 = (NSURL *)objc_claimAutoreleasedReturnValue();
        dropboxURL = self->_dropboxURL;
        self->_dropboxURL = v30;

        objc_msgSend(v9, "CDVObjectForKeyWithNameSpace:andName:", v7, v62);
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        v33 = v32;
        if (!v32)
        {
          objc_msgSend(MEMORY[0x24BE1AB50], "sharedLogging");
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          WeakRetained = objc_loadWeakRetained((id *)((char *)&self->super.super.super.isa + (int)*MEMORY[0x24BE1AC80]));
          objc_msgSend(v35, "logHandleForAccountInfoProvider:", WeakRetained);
          v37 = objc_claimAutoreleasedReturnValue();

          if (v37 && os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = v58;
            v79 = v9;
            v38 = v37;
            v39 = "Could not find the current user principal. Found properties: [%@]";
            goto LABEL_14;
          }
LABEL_16:

          v7 = v72;
          goto LABEL_17;
        }
        objc_msgSend(v32, "unauthenticated");
        v34 = (void *)objc_claimAutoreleasedReturnValue();

        if (v34)
        {
          objc_msgSend(MEMORY[0x24BE1AB50], "sharedLogging");
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          v36 = objc_loadWeakRetained((id *)((char *)&self->super.super.super.isa + (int)*MEMORY[0x24BE1AC80]));
          objc_msgSend(v35, "logHandleForAccountInfoProvider:", v36);
          v37 = objc_claimAutoreleasedReturnValue();

          if (!v37 || !os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
            goto LABEL_16;
          *(_WORD *)buf = 0;
          v38 = v37;
          v39 = "Not authenticated to get current user principal";
          v40 = 2;
          goto LABEL_15;
        }
        objc_msgSend(v33, "href");
        v52 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v52, "payloadAsFullURL");
        v53 = (NSURL *)objc_claimAutoreleasedReturnValue();
        updatedPrincipalURL = self->_updatedPrincipalURL;
        self->_updatedPrincipalURL = v53;

        if (!self->_updatedPrincipalURL)
        {
          objc_msgSend(MEMORY[0x24BE1AB50], "sharedLogging");
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          v55 = objc_loadWeakRetained((id *)((char *)&self->super.super.super.isa + (int)*MEMORY[0x24BE1AC80]));
          objc_msgSend(v35, "logHandleForAccountInfoProvider:", v55);
          v37 = objc_claimAutoreleasedReturnValue();

          if (!v37 || !os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
            goto LABEL_16;
          *(_DWORD *)buf = v58;
          v79 = v33;
          v38 = v37;
          v39 = "Could not find the current user principal's HREF.  Current user principal: [%@]";
LABEL_14:
          v40 = 12;
LABEL_15:
          _os_log_impl(&dword_2096EB000, v38, OS_LOG_TYPE_DEFAULT, v39, buf, v40);
          goto LABEL_16;
        }
LABEL_17:
        if (self->_updatedPrincipalURL)
          goto LABEL_33;
        objc_msgSend(v9, "CDVObjectForKeyWithNameSpace:andName:", v7, v59);
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        v43 = v42;
        if (!v42)
        {
          objc_msgSend(MEMORY[0x24BE1AB50], "sharedLogging");
          v47 = (void *)objc_claimAutoreleasedReturnValue();
          v56 = objc_loadWeakRetained((id *)((char *)&self->super.super.super.isa + (int)*MEMORY[0x24BE1AC80]));
          objc_msgSend(v47, "logHandleForAccountInfoProvider:", v56);
          v49 = objc_claimAutoreleasedReturnValue();

          if (v49 && os_log_type_enabled(v49, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = v58;
            v79 = v9;
            v50 = v49;
            v51 = "Could not find the user's principal URL. Found properties: [%@]";
LABEL_30:
            _os_log_impl(&dword_2096EB000, v50, OS_LOG_TYPE_DEFAULT, v51, buf, 0xCu);
          }
LABEL_31:

          v7 = v72;
          goto LABEL_32;
        }
        objc_msgSend(v42, "href");
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v44, "payloadAsFullURL");
        v45 = (NSURL *)objc_claimAutoreleasedReturnValue();
        v46 = self->_updatedPrincipalURL;
        self->_updatedPrincipalURL = v45;

        if (!self->_updatedPrincipalURL)
        {
          objc_msgSend(MEMORY[0x24BE1AB50], "sharedLogging");
          v47 = (void *)objc_claimAutoreleasedReturnValue();
          v48 = objc_loadWeakRetained((id *)((char *)&self->super.super.super.isa + (int)*MEMORY[0x24BE1AC80]));
          objc_msgSend(v47, "logHandleForAccountInfoProvider:", v48);
          v49 = objc_claimAutoreleasedReturnValue();

          if (v49 && os_log_type_enabled(v49, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = v58;
            v79 = v9;
            v50 = v49;
            v51 = "Could not find the href of the user's principal URL. Found properties: [%@]";
            goto LABEL_30;
          }
          goto LABEL_31;
        }
LABEL_32:

LABEL_33:
        objc_msgSend(v9, "CDVObjectForKeyWithNameSpace:andName:", v7, v61);
        v57 = (void *)objc_claimAutoreleasedReturnValue();
        v6 = v66;
        self->_supportsCalendarUserSearch = objc_msgSend(v57, "supportsReportWithNameSpace:andName:", v66, CFSTR("calendarserver-principal-search"));

      }
      v71 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v74, v80, 16);
    }
    while (v71);
  }
  v73.receiver = self;
  v73.super_class = (Class)CalDAVGetAccountPropertiesTaskGroup;
  -[CoreDAVGetAccountPropertiesTaskGroup _setPropertiesFromParsedResponses:](&v73, sel__setPropertiesFromParsedResponses_, obj);

}

- (id)userAddresses
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
  -[CalDAVGetAccountPropertiesTaskGroup preferredUserAddresses](self, "preferredUserAddresses", 0);
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

- (BOOL)forceOptionsRequest
{
  return 1;
}

- (void)processPrincipalHeaders:(id)a3
{
  id v4;
  CalDAVServerVersion *v5;
  CalDAVServerVersion *serverVersion;
  objc_super v7;

  v4 = a3;
  +[CalDAVServerVersion versionWithHTTPHeaders:](CalDAVServerVersion, "versionWithHTTPHeaders:", v4);
  v5 = (CalDAVServerVersion *)objc_claimAutoreleasedReturnValue();
  serverVersion = self->_serverVersion;
  self->_serverVersion = v5;

  if (-[CoreDAVGetAccountPropertiesTaskGroup fetchPrincipalSearchProperties](self, "fetchPrincipalSearchProperties"))
    -[CoreDAVGetAccountPropertiesTaskGroup setFetchPrincipalSearchProperties:](self, "setFetchPrincipalSearchProperties:", -[CalDAVServerVersion supportsPrincipalPropertySearch](self->_serverVersion, "supportsPrincipalPropertySearch"));
  v7.receiver = self;
  v7.super_class = (Class)CalDAVGetAccountPropertiesTaskGroup;
  -[CoreDAVGetAccountPropertiesTaskGroup processPrincipalHeaders:](&v7, sel_processPrincipalHeaders_, v4);

}

- (NSURL)delegatePrincipalURL
{
  return self->_delegatePrincipalURL;
}

- (void)setDelegatePrincipalURL:(id)a3
{
  objc_storeStrong((id *)&self->_delegatePrincipalURL, a3);
}

- (NSURL)homeURL
{
  return self->_homeURL;
}

- (void)setHomeURL:(id)a3
{
  objc_storeStrong((id *)&self->_homeURL, a3);
}

- (NSSet)calendarHomes
{
  return self->_calendarHomes;
}

- (NSSet)preferredUserAddresses
{
  return self->_preferredUserAddresses;
}

- (NSURL)inboxURL
{
  return self->_inboxURL;
}

- (NSURL)outboxURL
{
  return self->_outboxURL;
}

- (NSURL)dropboxURL
{
  return self->_dropboxURL;
}

- (NSURL)notificationURL
{
  return self->_notificationURL;
}

- (NSURL)updatedPrincipalURL
{
  return self->_updatedPrincipalURL;
}

- (CalDAVServerVersion)serverVersion
{
  return self->_serverVersion;
}

- (BOOL)supportsCalendarUserSearch
{
  return self->_supportsCalendarUserSearch;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serverVersion, 0);
  objc_storeStrong((id *)&self->_updatedPrincipalURL, 0);
  objc_storeStrong((id *)&self->_notificationURL, 0);
  objc_storeStrong((id *)&self->_dropboxURL, 0);
  objc_storeStrong((id *)&self->_outboxURL, 0);
  objc_storeStrong((id *)&self->_inboxURL, 0);
  objc_storeStrong((id *)&self->_preferredUserAddresses, 0);
  objc_storeStrong((id *)&self->_calendarHomes, 0);
  objc_storeStrong((id *)&self->_homeURL, 0);
  objc_storeStrong((id *)&self->_delegatePrincipalURL, 0);
}

@end
