@implementation CoreDAVSupportedReportSetItem

- (CoreDAVSupportedReportSetItem)init
{
  return -[CoreDAVItem initWithNameSpace:andName:](self, "initWithNameSpace:andName:", CFSTR("DAV:"), CFSTR("supported-report-set"));
}

- (id)description
{
  id v3;
  void *v4;
  void *v5;
  objc_super v7;

  v3 = objc_alloc_init(MEMORY[0x24BDD16A8]);
  v7.receiver = self;
  v7.super_class = (Class)CoreDAVSupportedReportSetItem;
  -[CoreDAVItem description](&v7, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("[%@]"), v4);

  -[CoreDAVSupportedReportSetItem supportedReports](self, "supportedReports");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("\n  Number of supported reports: [%lu]"), objc_msgSend(v5, "count"));

  return v3;
}

+ (id)copyParseRules
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  +[CoreDAVItem parseRuleCache](CoreDAVItem, "parseRuleCache");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromClass((Class)a1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKey:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    v6 = objc_alloc(MEMORY[0x24BDBCE70]);
    +[CoreDAVParseRule ruleWithMinimumNumber:maximumNumber:nameSpace:elementName:objectClass:setterMethod:](CoreDAVParseRule, "ruleWithMinimumNumber:maximumNumber:nameSpace:elementName:objectClass:setterMethod:", 0, 0x7FFFFFFFLL, CFSTR("DAV:"), CFSTR("supported-report"), objc_opt_class(), sel_addSupportedReport_);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@:%@"), CFSTR("DAV:"), CFSTR("supported-report"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (void *)objc_msgSend(v6, "initWithObjectsAndKeys:", v7, v8, 0);

    +[CoreDAVItem parseRuleCache](CoreDAVItem, "parseRuleCache");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromClass((Class)a1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setObject:forKey:", v5, v10);

  }
  return v5;
}

- (void)addSupportedReport:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;

  v4 = a3;
  -[CoreDAVSupportedReportSetItem supportedReports](self, "supportedReports");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    v6 = objc_alloc_init(MEMORY[0x24BDBCEF0]);
    -[CoreDAVSupportedReportSetItem setSupportedReports:](self, "setSupportedReports:", v6);

  }
  -[CoreDAVSupportedReportSetItem supportedReports](self, "supportedReports");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addObject:", v4);

}

- (BOOL)supportsReportWithNameSpace:(id)a3 andName:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t j;
  void *v18;
  void *v19;
  void *v20;
  char v21;
  BOOL v22;
  uint64_t v24;
  uint64_t v25;
  void *v26;
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
  v6 = a3;
  v7 = a4;
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  -[CoreDAVSupportedReportSetItem supportedReports](self, "supportedReports");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v31, v36, 16);
  if (v25)
  {
    v9 = *(_QWORD *)v32;
    v26 = v8;
    v24 = *(_QWORD *)v32;
    do
    {
      for (i = 0; i != v25; ++i)
      {
        if (*(_QWORD *)v32 != v9)
          objc_enumerationMutation(v8);
        v11 = *(void **)(*((_QWORD *)&v31 + 1) + 8 * i);
        v27 = 0u;
        v28 = 0u;
        v29 = 0u;
        v30 = 0u;
        objc_msgSend(v11, "report");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "extraChildItems");
        v13 = (void *)objc_claimAutoreleasedReturnValue();

        v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v27, v35, 16);
        if (v14)
        {
          v15 = v14;
          v16 = *(_QWORD *)v28;
          do
          {
            for (j = 0; j != v15; ++j)
            {
              if (*(_QWORD *)v28 != v16)
                objc_enumerationMutation(v13);
              v18 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * j);
              objc_msgSend(v18, "nameSpace");
              v19 = (void *)objc_claimAutoreleasedReturnValue();
              if ((objc_msgSend(v19, "isEqualToString:", v6) & 1) != 0)
              {
                objc_msgSend(v18, "name");
                v20 = (void *)objc_claimAutoreleasedReturnValue();
                v21 = objc_msgSend(v20, "isEqualToString:", v7);

                if ((v21 & 1) != 0)
                {

                  v22 = 1;
                  v8 = v26;
                  goto LABEL_21;
                }
              }
              else
              {

              }
            }
            v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v27, v35, 16);
          }
          while (v15);
        }

        v8 = v26;
        v9 = v24;
      }
      v22 = 0;
      v25 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v31, v36, 16);
    }
    while (v25);
  }
  else
  {
    v22 = 0;
  }
LABEL_21:

  return v22;
}

- (NSMutableSet)supportedReports
{
  return self->_supportedReports;
}

- (void)setSupportedReports:(id)a3
{
  objc_storeStrong((id *)&self->_supportedReports, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_supportedReports, 0);
}

@end
