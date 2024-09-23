@implementation CoreDAVExpandPropertiesTask

- (CoreDAVExpandPropertiesTask)initWithPropertiesToFind:(id)a3 atURL:(id)a4 expandedName:(id)a5 expandedNameSpace:(id)a6
{
  id v10;
  id v11;
  id v12;
  CoreDAVExpandPropertiesTask *v13;
  void *v14;
  objc_super v16;

  v10 = a3;
  v11 = a5;
  v12 = a6;
  v16.receiver = self;
  v16.super_class = (Class)CoreDAVExpandPropertiesTask;
  v13 = -[CoreDAVPropertyFindBaseTask initWithPropertiesToFind:atURL:](&v16, sel_initWithPropertiesToFind_atURL_, 0, a4);
  if (v13)
  {
    objc_msgSend(MEMORY[0x24BDBCEF0], "set");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[CoreDAVExpandPropertiesTask setPropertiesToExpand:](v13, "setPropertiesToExpand:", v14);

    -[CoreDAVExpandPropertiesTask addPropertyToExpandWithPropertiesToFind:expandedName:expandedNameSpace:](v13, "addPropertyToExpandWithPropertiesToFind:expandedName:expandedNameSpace:", v10, v11, v12);
  }

  return v13;
}

- (void)addPropertyToExpandWithPropertiesToFind:(id)a3 expandedName:(id)a4 expandedNameSpace:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  CoreDAVExpandProperty *v12;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  v12 = -[CoreDAVExpandProperty initWithPropertiesToFind:expandedName:expandedNameSpace:]([CoreDAVExpandProperty alloc], "initWithPropertiesToFind:expandedName:expandedNameSpace:", v10, v9, v8);

  -[CoreDAVExpandPropertiesTask propertiesToExpand](self, "propertiesToExpand");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "addObject:", v12);

}

- (id)description
{
  id v3;
  void *v4;
  void *v5;
  objc_super v7;

  v3 = objc_alloc_init(MEMORY[0x24BDD16A8]);
  v7.receiver = self;
  v7.super_class = (Class)CoreDAVExpandPropertiesTask;
  -[CoreDAVPropertyFindBaseTask description](&v7, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("[%@]"), v4);

  -[CoreDAVExpandPropertiesTask propertiesToExpand](self, "propertiesToExpand");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("\n  Number of properties to expand: [%lu]"), objc_msgSend(v5, "count"));

  return v3;
}

- (id)httpMethod
{
  return CFSTR("REPORT");
}

- (id)requestBody
{
  CoreDAVXMLData *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  CoreDAVXMLData *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id obj;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _BYTE v33[128];
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x24BDAC8D0];
  v3 = objc_alloc_init(CoreDAVXMLData);
  -[CoreDAVExpandPropertiesTask propertiesToExpand](self, "propertiesToExpand");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count");

  if (v5)
  {
    -[CoreDAVXMLData startElement:inNamespace:withAttributes:](v3, "startElement:inNamespace:withAttributes:");
    v31 = 0u;
    v32 = 0u;
    v29 = 0u;
    v30 = 0u;
    -[CoreDAVExpandPropertiesTask propertiesToExpand](self, "propertiesToExpand");
    obj = (id)objc_claimAutoreleasedReturnValue();
    v23 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v29, v34, 16);
    if (v23)
    {
      v22 = *(_QWORD *)v30;
      do
      {
        v6 = 0;
        do
        {
          if (*(_QWORD *)v30 != v22)
            objc_enumerationMutation(obj);
          v24 = v6;
          v7 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * v6);
          objc_msgSend(v7, "expandedName");
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "expandedNameSpace");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          v10 = v3;
          -[CoreDAVXMLData startElement:inNamespace:withAttributeNamesAndValues:](v3, "startElement:inNamespace:withAttributeNamesAndValues:", CFSTR("property"), CFSTR("DAV:"), CFSTR("name"), v8, CFSTR("namespace"), v9, 0);

          v27 = 0u;
          v28 = 0u;
          v25 = 0u;
          v26 = 0u;
          objc_msgSend(v7, "propertiesToFind");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v25, v33, 16);
          if (v12)
          {
            v13 = v12;
            v14 = *(_QWORD *)v26;
            do
            {
              for (i = 0; i != v13; ++i)
              {
                if (*(_QWORD *)v26 != v14)
                  objc_enumerationMutation(v11);
                v16 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * i);
                objc_msgSend(v16, "name");
                v17 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v16, "nameSpace");
                v18 = (void *)objc_claimAutoreleasedReturnValue();
                -[CoreDAVXMLData appendElement:inNamespace:withStringContent:withAttributeNamesAndValues:](v10, "appendElement:inNamespace:withStringContent:withAttributeNamesAndValues:", CFSTR("property"), CFSTR("DAV:"), 0, CFSTR("name"), v17, CFSTR("namespace"), v18, 0);

              }
              v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v25, v33, 16);
            }
            while (v13);
          }

          v3 = v10;
          -[CoreDAVXMLData endElement:inNamespace:](v10, "endElement:inNamespace:", CFSTR("property"), CFSTR("DAV:"));
          v6 = v24 + 1;
        }
        while (v24 + 1 != v23);
        v23 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v29, v34, 16);
      }
      while (v23);
    }

    -[CoreDAVXMLData endElement:inNamespace:](v3, "endElement:inNamespace:", CFSTR("expand-property"), CFSTR("DAV:"));
  }
  -[CoreDAVXMLData data](v3, "data");
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  return v19;
}

- (id)parseHints
{
  void *v3;
  char *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t j;
  void *v23;
  CoreDAVItemParserMapping *v24;
  void *v25;
  void *v26;
  CoreDAVItemParserMapping *v27;
  CoreDAVExpandPropertiesTask *v29;
  id obj;
  uint64_t v31;
  uint64_t v32;
  char *v33;
  id v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  _BYTE v47[128];
  _BYTE v48[128];
  _BYTE v49[128];
  uint64_t v50;

  v50 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v43 = 0u;
  v44 = 0u;
  v45 = 0u;
  v46 = 0u;
  v29 = self;
  -[CoreDAVExpandPropertiesTask propertiesToExpand](self, "propertiesToExpand");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v32 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v43, v49, 16);
  if (v32)
  {
    v31 = *(_QWORD *)v44;
    do
    {
      v4 = 0;
      do
      {
        if (*(_QWORD *)v44 != v31)
          objc_enumerationMutation(obj);
        v33 = v4;
        v5 = *(void **)(*((_QWORD *)&v43 + 1) + 8 * (_QWORD)v4);
        v39 = 0u;
        v40 = 0u;
        v41 = 0u;
        v42 = 0u;
        objc_msgSend(v5, "propertiesToFind");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v39, v48, 16);
        if (v7)
        {
          v8 = v7;
          v9 = *(_QWORD *)v40;
          do
          {
            for (i = 0; i != v8; ++i)
            {
              if (*(_QWORD *)v40 != v9)
                objc_enumerationMutation(v6);
              v11 = *(void **)(*((_QWORD *)&v39 + 1) + 8 * i);
              v12 = (void *)MEMORY[0x24BDD17C8];
              objc_msgSend(v11, "nameSpace");
              v13 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v11, "name");
              v14 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v12, "CDVStringWithNameSpace:andName:", v13, v14);
              v15 = (void *)objc_claimAutoreleasedReturnValue();

              objc_msgSend(v3, "setObject:forKey:", v11, v15);
            }
            v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v39, v48, 16);
          }
          while (v8);
        }

        v4 = v33 + 1;
      }
      while (v33 + 1 != (char *)v32);
      v32 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v43, v49, 16);
    }
    while (v32);
  }

  v16 = (void *)MEMORY[0x24BDBCEF0];
  objc_msgSend(v3, "allValues");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setWithArray:", v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  v37 = 0u;
  v38 = 0u;
  v35 = 0u;
  v36 = 0u;
  -[CoreDAVExpandPropertiesTask propertiesToExpand](v29, "propertiesToExpand");
  v34 = (id)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v34, "countByEnumeratingWithState:objects:count:", &v35, v47, 16);
  if (v19)
  {
    v20 = v19;
    v21 = *(_QWORD *)v36;
    do
    {
      for (j = 0; j != v20; ++j)
      {
        if (*(_QWORD *)v36 != v21)
          objc_enumerationMutation(v34);
        v23 = *(void **)(*((_QWORD *)&v35 + 1) + 8 * j);
        v24 = [CoreDAVItemParserMapping alloc];
        objc_msgSend(v23, "expandedNameSpace");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "expandedName");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        v27 = -[CoreDAVItemParserMapping initWithNameSpace:name:parseClass:](v24, "initWithNameSpace:name:parseClass:", v25, v26, objc_opt_class());

        objc_msgSend(v18, "addObject:", v27);
      }
      v20 = objc_msgSend(v34, "countByEnumeratingWithState:objects:count:", &v35, v47, 16);
    }
    while (v20);
  }

  return v18;
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
  v8.super_class = (Class)CoreDAVExpandPropertiesTask;
  -[CoreDAVPropertyFindBaseTask finishCoreDAVTaskWithError:](&v8, sel_finishCoreDAVTaskWithError_, v6);

}

- (NSMutableSet)propertiesToExpand
{
  return self->_propertiesToExpand;
}

- (void)setPropertiesToExpand:(id)a3
{
  objc_storeStrong((id *)&self->_propertiesToExpand, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_propertiesToExpand, 0);
}

@end
