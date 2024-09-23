@implementation CoreDAVResponseItem

- (CoreDAVResponseItem)init
{
  return -[CoreDAVItem initWithNameSpace:andName:](self, "initWithNameSpace:andName:", CFSTR("DAV:"), CFSTR("response"));
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
  void *v11;
  void *v12;
  objc_super v14;

  v3 = objc_alloc_init(MEMORY[0x24BDD16A8]);
  v14.receiver = self;
  v14.super_class = (Class)CoreDAVResponseItem;
  -[CoreDAVItem description](&v14, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("[%@ "), v4);

  -[CoreDAVResponseItem hrefs](self, "hrefs");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("| Number of HREFs: [%lu]"), objc_msgSend(v5, "count"));

  -[CoreDAVResponseItem status](self, "status");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("| Status: [%@]"), v6);

  -[CoreDAVResponseItem propStats](self, "propStats");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("| Number of prop stats: [%lu]"), objc_msgSend(v7, "count"));

  -[CoreDAVResponseItem errorItem](self, "errorItem");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("| Error: [%@]"), v8);

  -[CoreDAVResponseItem responseDescription](self, "responseDescription");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("| Response description: [%@]"), v9);

  -[CoreDAVResponseItem location](self, "location");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("| Location: [%@]"), v10);

  -[CoreDAVResponseItem serverUID](self, "serverUID");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("| UID: [%@]"), v11);

  -[CoreDAVResponseItem matchResults](self, "matchResults");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("| Match-Results: [%@]"), v12);

  objc_msgSend(v3, "appendFormat:", CFSTR("]"));
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
  id v22;
  objc_class *v23;
  void *v24;
  void *v25;
  void *v26;

  +[CoreDAVItem parseRuleCache](CoreDAVItem, "parseRuleCache");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromClass((Class)a1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKey:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    v22 = objc_alloc(MEMORY[0x24BDBCE70]);
    v23 = (objc_class *)a1;
    +[CoreDAVParseRule ruleWithMinimumNumber:maximumNumber:nameSpace:elementName:objectClass:setterMethod:](CoreDAVParseRule, "ruleWithMinimumNumber:maximumNumber:nameSpace:elementName:objectClass:setterMethod:", 0, 0x7FFFFFFFLL, CFSTR("DAV:"), CFSTR("href"), objc_opt_class(), sel_addHref_);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@:%@"), CFSTR("DAV:"), CFSTR("href"));
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    +[CoreDAVParseRule ruleWithMinimumNumber:maximumNumber:nameSpace:elementName:objectClass:setterMethod:](CoreDAVParseRule, "ruleWithMinimumNumber:maximumNumber:nameSpace:elementName:objectClass:setterMethod:", 0, 1, CFSTR("DAV:"), CFSTR("status"), objc_opt_class(), sel_setStatus_);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@:%@"), CFSTR("DAV:"), CFSTR("status"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    +[CoreDAVParseRule ruleWithMinimumNumber:maximumNumber:nameSpace:elementName:objectClass:setterMethod:](CoreDAVParseRule, "ruleWithMinimumNumber:maximumNumber:nameSpace:elementName:objectClass:setterMethod:", 0, 0x7FFFFFFFLL, CFSTR("DAV:"), CFSTR("propstat"), objc_opt_class(), sel_addPropStat_);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@:%@"), CFSTR("DAV:"), CFSTR("propstat"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    +[CoreDAVParseRule ruleWithMinimumNumber:maximumNumber:nameSpace:elementName:objectClass:setterMethod:](CoreDAVParseRule, "ruleWithMinimumNumber:maximumNumber:nameSpace:elementName:objectClass:setterMethod:", 0, 1, CFSTR("DAV:"), CFSTR("error"), objc_opt_class(), sel_setErrorItem_);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@:%@"), CFSTR("DAV:"), CFSTR("error"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    +[CoreDAVParseRule ruleWithMinimumNumber:maximumNumber:nameSpace:elementName:objectClass:setterMethod:](CoreDAVParseRule, "ruleWithMinimumNumber:maximumNumber:nameSpace:elementName:objectClass:setterMethod:", 0, 1, CFSTR("DAV:"), CFSTR("responsedescription"), objc_opt_class(), sel_setResponseDescription_);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@:%@"), CFSTR("DAV:"), CFSTR("responsedescription"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    +[CoreDAVParseRule ruleWithMinimumNumber:maximumNumber:nameSpace:elementName:objectClass:setterMethod:](CoreDAVParseRule, "ruleWithMinimumNumber:maximumNumber:nameSpace:elementName:objectClass:setterMethod:", 0, 1, CFSTR("DAV:"), CFSTR("location"), objc_opt_class(), sel_setLocation_);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@:%@"), CFSTR("DAV:"), CFSTR("location"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    +[CoreDAVParseRule ruleWithMinimumNumber:maximumNumber:nameSpace:elementName:objectClass:setterMethod:](CoreDAVParseRule, "ruleWithMinimumNumber:maximumNumber:nameSpace:elementName:objectClass:setterMethod:", 0, 1, CFSTR("http://calendarserver.org/ns/"), CFSTR("uid"), objc_opt_class(), sel_setServerUID_);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@:%@"), CFSTR("http://calendarserver.org/ns/"), CFSTR("uid"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    +[CoreDAVParseRule ruleWithMinimumNumber:maximumNumber:nameSpace:elementName:objectClass:setterMethod:](CoreDAVParseRule, "ruleWithMinimumNumber:maximumNumber:nameSpace:elementName:objectClass:setterMethod:", 0, 1, CFSTR("http://calendarserver.org/ns/"), CFSTR("match-results"), objc_opt_class(), sel_setMatchResults_);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@:%@"), CFSTR("http://calendarserver.org/ns/"), CFSTR("match-results"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (void *)objc_msgSend(v22, "initWithObjectsAndKeys:", v26, v25, v24, v21, v20, v19, v18, v17, v16, v15, v14, v13, v12, v6, v7, v8, 0);

    +[CoreDAVItem parseRuleCache](CoreDAVItem, "parseRuleCache");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromClass(v23);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setObject:forKey:", v5, v10);

  }
  return v5;
}

- (void)addPropStat:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;

  v4 = a3;
  -[CoreDAVResponseItem propStats](self, "propStats");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    v6 = objc_alloc_init(MEMORY[0x24BDBCEF0]);
    -[CoreDAVResponseItem setPropStats:](self, "setPropStats:", v6);

  }
  -[CoreDAVResponseItem propStats](self, "propStats");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addObject:", v4);

}

- (void)addHref:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;

  v4 = a3;
  -[CoreDAVResponseItem hrefs](self, "hrefs");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    v6 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
    -[CoreDAVResponseItem setHrefs:](self, "setHrefs:", v6);

  }
  -[CoreDAVResponseItem hrefs](self, "hrefs");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addObject:", v4);

}

- (id)firstHref
{
  void *v2;
  void *v3;

  -[CoreDAVResponseItem hrefs](self, "hrefs");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectAtIndex:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)successfulPropertiesToValues
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v23;
  uint64_t v24;
  id obj;
  uint64_t v26;
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
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  -[CoreDAVResponseItem propStats](self, "propStats");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v31, v36, 16);
  if (v2)
  {
    v3 = v2;
    v4 = 0;
    v5 = *(_QWORD *)v32;
    v23 = *(_QWORD *)v32;
    do
    {
      v6 = 0;
      v24 = v3;
      do
      {
        if (*(_QWORD *)v32 != v5)
          objc_enumerationMutation(obj);
        v7 = *(void **)(*((_QWORD *)&v31 + 1) + 8 * v6);
        objc_msgSend(v7, "status", v23);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "payloadAsString");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = objc_msgSend(v9, "CDVIsHTTPStatusLineWithStatusCode:", 200);

        if (v10)
        {
          v26 = v6;
          if (!v4)
          {
            objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
            v4 = (void *)objc_claimAutoreleasedReturnValue();
          }
          v29 = 0u;
          v30 = 0u;
          v27 = 0u;
          v28 = 0u;
          objc_msgSend(v7, "prop");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "extraChildItems");
          v12 = (void *)objc_claimAutoreleasedReturnValue();

          v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v27, v35, 16);
          if (v13)
          {
            v14 = v13;
            v15 = *(_QWORD *)v28;
            do
            {
              for (i = 0; i != v14; ++i)
              {
                if (*(_QWORD *)v28 != v15)
                  objc_enumerationMutation(v12);
                v17 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * i);
                v18 = (void *)MEMORY[0x24BDD17C8];
                objc_msgSend(v17, "nameSpace");
                v19 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v17, "name");
                v20 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v18, "CDVStringWithNameSpace:andName:", v19, v20);
                v21 = (void *)objc_claimAutoreleasedReturnValue();

                objc_msgSend(v4, "setObject:forKey:", v17, v21);
              }
              v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v27, v35, 16);
            }
            while (v14);
          }

          v5 = v23;
          v3 = v24;
          v6 = v26;
        }
        ++v6;
      }
      while (v6 != v3);
      v3 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v31, v36, 16);
    }
    while (v3);
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (BOOL)hasPropertyError
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  int v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  -[CoreDAVResponseItem errorItem](self, "errorItem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
    goto LABEL_2;
  -[CoreDAVResponseItem propStats](self, "propStats");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count");

  if (v6
    || (-[CoreDAVResponseItem status](self, "status"),
        v7 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v7, "payloadAsString"),
        v8 = (void *)objc_claimAutoreleasedReturnValue(),
        v9 = objc_msgSend(v8, "CDVIsHTTPStatusLineWithStatusCode:", 200),
        v8,
        v7,
        v9))
  {
    v19 = 0u;
    v20 = 0u;
    v17 = 0u;
    v18 = 0u;
    -[CoreDAVResponseItem propStats](self, "propStats", 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    if (v4)
    {
      v11 = *(_QWORD *)v18;
      while (2)
      {
        for (i = 0; i != v4; ++i)
        {
          if (*(_QWORD *)v18 != v11)
            objc_enumerationMutation(v10);
          objc_msgSend(*(id *)(*((_QWORD *)&v17 + 1) + 8 * i), "status");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "payloadAsString");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v15 = objc_msgSend(v14, "CDVIsHTTPStatusLineWithStatusCode:", 200);

          if (!v15)
          {
            LOBYTE(v4) = 1;
            goto LABEL_15;
          }
        }
        v4 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
        if (v4)
          continue;
        break;
      }
    }
LABEL_15:

  }
  else
  {
LABEL_2:
    LOBYTE(v4) = 1;
  }
  return v4;
}

- (void)setErrorItem:(id)a3
{
  CoreDAVErrorItem **p_errorItem;
  CoreDAVErrorItem *v6;

  p_errorItem = &self->_errorItem;
  v6 = (CoreDAVErrorItem *)a3;
  if (*p_errorItem != v6)
  {
    objc_storeStrong((id *)&self->_errorItem, a3);
    if (self->_status)
      -[CoreDAVErrorItem setStatus:](*p_errorItem, "setStatus:");
  }

}

- (NSMutableArray)hrefs
{
  return self->_hrefs;
}

- (void)setHrefs:(id)a3
{
  objc_storeStrong((id *)&self->_hrefs, a3);
}

- (CoreDAVLeafItem)status
{
  return self->_status;
}

- (void)setStatus:(id)a3
{
  objc_storeStrong((id *)&self->_status, a3);
}

- (NSMutableSet)propStats
{
  return self->_propStats;
}

- (void)setPropStats:(id)a3
{
  objc_storeStrong((id *)&self->_propStats, a3);
}

- (CoreDAVErrorItem)errorItem
{
  return self->_errorItem;
}

- (CoreDAVLeafItem)responseDescription
{
  return self->_responseDescription;
}

- (void)setResponseDescription:(id)a3
{
  objc_storeStrong((id *)&self->_responseDescription, a3);
}

- (CoreDAVItemWithHrefChildItem)location
{
  return self->_location;
}

- (void)setLocation:(id)a3
{
  objc_storeStrong((id *)&self->_location, a3);
}

- (CoreDAVLeafItem)serverUID
{
  return self->_serverUID;
}

- (void)setServerUID:(id)a3
{
  objc_storeStrong((id *)&self->_serverUID, a3);
}

- (CoreDAVMatchResultsItem)matchResults
{
  return self->_matchResults;
}

- (void)setMatchResults:(id)a3
{
  objc_storeStrong((id *)&self->_matchResults, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_matchResults, 0);
  objc_storeStrong((id *)&self->_serverUID, 0);
  objc_storeStrong((id *)&self->_location, 0);
  objc_storeStrong((id *)&self->_responseDescription, 0);
  objc_storeStrong((id *)&self->_errorItem, 0);
  objc_storeStrong((id *)&self->_propStats, 0);
  objc_storeStrong((id *)&self->_status, 0);
  objc_storeStrong((id *)&self->_hrefs, 0);
}

@end
