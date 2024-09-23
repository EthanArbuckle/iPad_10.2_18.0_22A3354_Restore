@implementation CalDAVCalendarUserSearchTask

- (CalDAVCalendarUserSearchTask)initWithSearchStrings:(id)a3 atURL:(id)a4
{
  id v6;
  id v7;
  void *v8;
  CalDAVCalendarUserSearchTask *v9;
  objc_super v11;

  v6 = a3;
  v7 = a4;
  +[CalDAVPrincipalSearchSupport parserMappingsWithServerSupportSet:includeEmail:](CalDAVPrincipalSearchSupport, "parserMappingsWithServerSupportSet:includeEmail:", 0, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11.receiver = self;
  v11.super_class = (Class)CalDAVCalendarUserSearchTask;
  v9 = -[CoreDAVPropertyFindBaseTask initWithPropertiesToFind:atURL:](&v11, sel_initWithPropertiesToFind_atURL_, v8, v7);

  if (v9)
    -[CalDAVCalendarUserSearchTask setSearchStrings:](v9, "setSearchStrings:", v6);

  return v9;
}

- (id)httpMethod
{
  return CFSTR("REPORT");
}

+ (BOOL)tokensAreLegal:(id)a3
{
  id v3;
  uint64_t v4;
  unint64_t v5;
  char v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v3 = a3;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v4)
  {
    v5 = 0;
    v6 = 0;
    v7 = *(_QWORD *)v12;
    while (2)
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v12 != v7)
          objc_enumerationMutation(v3);
        v9 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * i);
        v5 += objc_msgSend(v9, "length", (_QWORD)v11);
        v6 |= (unint64_t)objc_msgSend(v9, "length") > 1;
        if ((v6 & 1) != 0 && v5 > 2)
        {
          LOBYTE(v4) = 1;
          goto LABEL_12;
        }
      }
      v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      if (v4)
        continue;
      break;
    }
  }
LABEL_12:

  return v4;
}

- (id)extraAttributes
{
  int64_t v3;
  void *v4;
  void *v5;
  __CFString **v6;
  void *v7;
  id WeakRetained;
  void *v9;
  NSObject *v10;
  id v11;
  id result;
  int v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v3 = -[CalDAVCalendarUserSearchTask searchType](self, "searchType");
  v4 = 0;
  switch(v3)
  {
    case 0:
      goto LABEL_13;
    case 1:
      v5 = (void *)MEMORY[0x24BDBCE70];
      v6 = cdXMLCalendarServerAttendee;
      goto LABEL_12;
    case 2:
      v5 = (void *)MEMORY[0x24BDBCE70];
      v6 = (__CFString **)MEMORY[0x24BE1AE90];
      goto LABEL_12;
    case 3:
      v5 = (void *)MEMORY[0x24BDBCE70];
      v6 = cdXMLCalendarServerUser;
      goto LABEL_12;
    case 4:
      v5 = (void *)MEMORY[0x24BDBCE70];
      v6 = cdXMLCalendarServerGroup;
      goto LABEL_12;
    case 5:
      v5 = (void *)MEMORY[0x24BDBCE70];
      v6 = cdXMLCalendarServerResource;
LABEL_12:
      objc_msgSend(v5, "dictionaryWithObject:forKey:", *v6, CFSTR("context"));
      v4 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_13:
      result = v4;
      break;
    default:
      objc_msgSend(MEMORY[0x24BE1AB50], "sharedLogging");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      WeakRetained = objc_loadWeakRetained((id *)((char *)&self->super.super.super.isa + (int)*MEMORY[0x24BE1AC70]));
      objc_msgSend(v7, "logHandleForAccountInfoProvider:", WeakRetained);
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      if (v9)
      {
        v10 = v9;
        if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
        {
          v13 = 138543362;
          v14 = (id)objc_opt_class();
          v11 = v14;
          _os_log_impl(&dword_2096EB000, v10, OS_LOG_TYPE_ERROR, "%{public}@ shouldn't be created finding nothing. Finding all instead.", (uint8_t *)&v13, 0xCu);

        }
      }

      result = 0;
      break;
  }
  return result;
}

- (id)searchItems
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
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
  objc_msgSend(MEMORY[0x24BDBCEF0], "set");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  -[CalDAVCalendarUserSearchTask searchStrings](self, "searchStrings", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v14;
    v8 = *MEMORY[0x24BE1ADC8];
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v14 != v7)
          objc_enumerationMutation(v4);
        v10 = *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * v9);
        v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE1AB18]), "initWithNameSpace:andName:", v8, CFSTR("search-token"));
        objc_msgSend(v11, "setPayloadAsString:", v10);
        objc_msgSend(v3, "addObject:", v11);

        ++v9;
      }
      while (v6 != v9);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v6);
  }

  return v3;
}

- (id)requestBody
{
  void *v3;
  void *v4;
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t j;
  void *v23;
  void *v24;
  void *v25;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  _BYTE v35[128];
  _BYTE v36[128];
  uint64_t v37;

  v37 = *MEMORY[0x24BDAC8D0];
  -[CoreDAVPropertyFindBaseTask propertiesToFind](self, "propertiesToFind");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "count");

  if (v4)
  {
    v5 = objc_alloc_init(MEMORY[0x24BE1ABD8]);
    v6 = *MEMORY[0x24BE1ADC8];
    -[CalDAVCalendarUserSearchTask extraAttributes](self, "extraAttributes");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "startElement:inNamespace:withAttributes:", CFSTR("calendarserver-principal-search"), v6, v7);

    v33 = 0u;
    v34 = 0u;
    v31 = 0u;
    v32 = 0u;
    -[CalDAVCalendarUserSearchTask searchItems](self, "searchItems");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v31, v36, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v32;
      do
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v32 != v11)
            objc_enumerationMutation(v8);
          objc_msgSend(*(id *)(*((_QWORD *)&v31 + 1) + 8 * i), "write:", v5);
        }
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v31, v36, 16);
      }
      while (v10);
    }

    if (-[CalDAVCalendarUserSearchTask resultLimit](self, "resultLimit"))
    {
      v13 = *MEMORY[0x24BE1ADE0];
      objc_msgSend(v5, "startElement:inNamespace:withAttributeNamesAndValues:", *MEMORY[0x24BE1ADE0], v6, 0);
      v14 = *MEMORY[0x24BE1ADF8];
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%d"), -[CalDAVCalendarUserSearchTask resultLimit](self, "resultLimit"));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "appendElement:inNamespace:withStringContent:withAttributeNamesAndValues:", v14, v6, v15, 0);

      objc_msgSend(v5, "endElement:inNamespace:", v13, v6);
    }
    v16 = *MEMORY[0x24BE1AF00];
    v17 = *MEMORY[0x24BE1AE30];
    objc_msgSend(v5, "startElement:inNamespace:withAttributeNamesAndValues:", *MEMORY[0x24BE1AF00], *MEMORY[0x24BE1AE30], 0);
    v29 = 0u;
    v30 = 0u;
    v27 = 0u;
    v28 = 0u;
    -[CoreDAVPropertyFindBaseTask propertiesToFind](self, "propertiesToFind");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v27, v35, 16);
    if (v19)
    {
      v20 = v19;
      v21 = *(_QWORD *)v28;
      do
      {
        for (j = 0; j != v20; ++j)
        {
          if (*(_QWORD *)v28 != v21)
            objc_enumerationMutation(v18);
          v23 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * j);
          objc_msgSend(v23, "name");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v23, "nameSpace");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "appendElement:inNamespace:withStringContent:withAttributeNamesAndValues:", v24, v25, 0, 0);

        }
        v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v27, v35, 16);
      }
      while (v20);
    }

    objc_msgSend(v5, "endElement:inNamespace:", v16, v17);
    objc_msgSend(v5, "endElement:inNamespace:", CFSTR("calendarserver-principal-search"), v6);
    objc_msgSend(v5, "data");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v4;
}

- (void)finishCoreDAVTaskWithError:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  objc_super v8;

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    v6 = v4;
  }
  else
  {
    -[CoreDAVPropertyFindBaseTask getTotalFailureError](self, "getTotalFailureError");
    v6 = (id)objc_claimAutoreleasedReturnValue();
  }
  v7 = v6;
  v8.receiver = self;
  v8.super_class = (Class)CalDAVCalendarUserSearchTask;
  -[CoreDAVPropertyFindBaseTask finishCoreDAVTaskWithError:](&v8, sel_finishCoreDAVTaskWithError_, v6);

}

- (int64_t)searchType
{
  return self->_searchType;
}

- (void)setSearchType:(int64_t)a3
{
  self->_searchType = a3;
}

- (unint64_t)resultLimit
{
  return self->_resultLimit;
}

- (void)setResultLimit:(unint64_t)a3
{
  self->_resultLimit = a3;
}

- (BOOL)findAttendees
{
  return self->_findAttendees;
}

- (void)setFindAttendees:(BOOL)a3
{
  self->_findAttendees = a3;
}

- (BOOL)findLocations
{
  return self->_findLocations;
}

- (void)setFindLocations:(BOOL)a3
{
  self->_findLocations = a3;
}

- (BOOL)findUsers
{
  return self->_findUsers;
}

- (void)setFindUsers:(BOOL)a3
{
  self->_findUsers = a3;
}

- (BOOL)findGroups
{
  return self->_findGroups;
}

- (void)setFindGroups:(BOOL)a3
{
  self->_findGroups = a3;
}

- (BOOL)findResources
{
  return self->_findResources;
}

- (void)setFindResources:(BOOL)a3
{
  self->_findResources = a3;
}

- (NSSet)searchStrings
{
  return self->_searchStrings;
}

- (void)setSearchStrings:(id)a3
{
  objc_storeStrong((id *)&self->_searchStrings, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_searchStrings, 0);
}

@end
