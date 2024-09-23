@implementation CoreDAVBulkChangeTask

- (CoreDAVBulkChangeTask)initWithURL:(id)a3 checkCTag:(id)a4 simple:(BOOL)a5 returnChangedData:(BOOL)a6 uuidsToAddActions:(id)a7 hrefsToModDeleteActions:(id)a8
{
  id v13;
  id v14;
  void *v15;
  CoreDAVBulkChangeTask *v16;
  CoreDAVBulkChangeTask *v17;
  CoreDAVBulkChangeTask *v18;
  objc_super v20;

  v13 = a3;
  v14 = a4;
  if (-[CoreDAVBulkChangeTask isMemberOfClass:](self, "isMemberOfClass:", objc_opt_class()))
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CoreDAVBulkChangeTask.m"), 44, CFSTR("You instantiated a class that doesn't want to be instantiated.  Please choose a concrete subclass of %@"), objc_opt_class());

    v16 = 0;
  }
  else
  {
    v20.receiver = self;
    v20.super_class = (Class)CoreDAVBulkChangeTask;
    v17 = -[CoreDAVTask initWithURL:](&v20, sel_initWithURL_, v13);
    v18 = v17;
    if (v17)
    {
      objc_storeStrong((id *)&v17->_checkCTag, a4);
      v18->_simple = a5;
      v18->_returnChangedData = a6;
    }
    self = v18;
    v16 = self;
  }

  return v16;
}

- (id)additionalHeaderValues
{
  id v3;
  void *v4;
  NSString *requestDataContentType;
  void *v6;
  objc_super v8;

  v3 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  v8.receiver = self;
  v8.super_class = (Class)CoreDAVBulkChangeTask;
  -[CoreDAVTask additionalHeaderValues](&v8, sel_additionalHeaderValues);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addEntriesFromDictionary:", v4);

  requestDataContentType = self->_requestDataContentType;
  if (requestDataContentType)
    objc_msgSend(v3, "setObject:forKey:", requestDataContentType, CFSTR("Content-Type"));
  if (self->_returnChangedData)
    objc_msgSend(v3, "setObject:forKey:", CFSTR("return-changed-data"), CFSTR("X-MobileMe-DAV-Options"));
  if (self->_checkCTag)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "CDVPreconditionHeaderValueWithCTag:");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
      objc_msgSend(v3, "setObject:forKey:", v6, CFSTR("If"));

  }
  return v3;
}

- (id)httpMethod
{
  return CFSTR("POST");
}

- (id)requestBody
{
  return self->_pushedData;
}

- (void)fillOutDataWithUUIDsToAddActions:(id)a3 hrefsToModDeleteActions:(id)a4
{
  id v7;
  id v8;
  NSData *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  void *v17;
  CoreDAVXMLData *pushedData;
  uint64_t j;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  void *v24;
  id v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  id v36;
  void *v37;
  void *v38;
  uint64_t v39;
  NSData *v40;
  void *v41;
  id v42;
  void *v43;
  uint64_t v44;
  uint64_t v45;
  id v46;
  uint64_t v47;
  uint64_t v48;
  CoreDAVBulkChangeTask *v49;
  id obj;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  _BYTE v63[128];
  _BYTE v64[128];
  _BYTE v65[128];
  uint64_t v66;

  v66 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = a4;
  if (self->_pushedData)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CoreDAVBulkChangeTask.m"), 92, CFSTR("%s _pushedData is not nil. self = %@"), "-[CoreDAVBulkChangeTask fillOutDataWithUUIDsToAddActions:hrefsToModDeleteActions:]", self);

  }
  v49 = self;
  if (self->_simple)
  {
    v9 = (NSData *)objc_alloc_init(MEMORY[0x24BDBCEC8]);
    v59 = 0u;
    v60 = 0u;
    v61 = 0u;
    v62 = 0u;
    v10 = v7;
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v59, v65, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v60;
      do
      {
        for (i = 0; i != v12; ++i)
        {
          if (*(_QWORD *)v60 != v13)
            objc_enumerationMutation(v10);
          objc_msgSend(v10, "objectForKey:", *(_QWORD *)(*((_QWORD *)&v59 + 1) + 8 * i));
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "context");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "dataPayload");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSData appendData:](v9, "appendData:", v17);

        }
        v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v59, v65, 16);
      }
      while (v12);
    }

    pushedData = (CoreDAVXMLData *)v49->_pushedData;
    v49->_pushedData = v9;
  }
  else
  {
    v43 = v8;
    pushedData = objc_alloc_init(CoreDAVXMLData);
    -[CoreDAVXMLData startElement:inNamespace:withAttributes:](pushedData, "startElement:inNamespace:withAttributes:");
    v57 = 0u;
    v58 = 0u;
    v55 = 0u;
    v56 = 0u;
    v42 = v7;
    obj = v7;
    v47 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v55, v64, 16);
    if (v47)
    {
      v45 = *(_QWORD *)v56;
      do
      {
        for (j = 0; j != v47; ++j)
        {
          if (*(_QWORD *)v56 != v45)
            objc_enumerationMutation(obj);
          objc_msgSend(obj, "objectForKey:", *(_QWORD *)(*((_QWORD *)&v55 + 1) + 8 * j));
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "context");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          -[CoreDAVXMLData startElement:inNamespace:withAttributes:](pushedData, "startElement:inNamespace:withAttributes:", CFSTR("resource"), CFSTR("http://me.com/_namespace/"), 0);
          -[CoreDAVXMLData startElement:inNamespace:withAttributes:](pushedData, "startElement:inNamespace:withAttributes:", CFSTR("set"), CFSTR("DAV:"), 0);
          -[CoreDAVXMLData startElement:inNamespace:withAttributes:](pushedData, "startElement:inNamespace:withAttributes:", CFSTR("prop"), CFSTR("DAV:"), 0);
          v22 = objc_alloc(MEMORY[0x24BDD17C8]);
          objc_msgSend(v21, "dataPayload");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          v24 = (void *)objc_msgSend(v22, "initWithData:encoding:", v23, 4);

          -[CoreDAVXMLData appendElement:inNamespace:withStringContentAsCDATA:withAttributeNamesAndValues:](pushedData, "appendElement:inNamespace:withStringContentAsCDATA:withAttributeNamesAndValues:", v49->_appSpecificDataProp, v49->_appSpecificNamespace, v24, 0);
          -[CoreDAVXMLData endElement:inNamespace:](pushedData, "endElement:inNamespace:", CFSTR("prop"), CFSTR("DAV:"));
          -[CoreDAVXMLData endElement:inNamespace:](pushedData, "endElement:inNamespace:", CFSTR("set"), CFSTR("DAV:"));
          -[CoreDAVXMLData endElement:inNamespace:](pushedData, "endElement:inNamespace:", CFSTR("resource"), CFSTR("http://me.com/_namespace/"));

        }
        v47 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v55, v64, 16);
      }
      while (v47);
    }

    v53 = 0u;
    v54 = 0u;
    v51 = 0u;
    v52 = 0u;
    v25 = v43;
    v26 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v51, v63, 16);
    if (v26)
    {
      v27 = v26;
      v28 = *(_QWORD *)v52;
      v46 = v25;
      v44 = *(_QWORD *)v52;
      do
      {
        v29 = 0;
        v48 = v27;
        do
        {
          if (*(_QWORD *)v52 != v28)
            objc_enumerationMutation(v25);
          v30 = *(void **)(*((_QWORD *)&v51 + 1) + 8 * v29);
          objc_msgSend(v25, "objectForKey:", v30);
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          -[CoreDAVXMLData startElement:inNamespace:withAttributes:](pushedData, "startElement:inNamespace:withAttributes:", CFSTR("resource"), CFSTR("http://me.com/_namespace/"), 0);
          objc_msgSend(v30, "CDVRawPath");
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          -[CoreDAVXMLData appendElement:inNamespace:withStringContent:withAttributeNamesAndValues:](pushedData, "appendElement:inNamespace:withStringContent:withAttributeNamesAndValues:", CFSTR("href"), CFSTR("DAV:"), v32, 0);

          if (objc_msgSend(v31, "action") == 2)
          {
            -[CoreDAVXMLData appendElement:inNamespace:withStringContent:withAttributeNamesAndValues:](pushedData, "appendElement:inNamespace:withStringContent:withAttributeNamesAndValues:", CFSTR("delete"), CFSTR("http://me.com/_namespace/"), 0, 0);
          }
          else
          {
            objc_msgSend(v31, "context");
            v33 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v33, "syncKey");
            v34 = (void *)objc_claimAutoreleasedReturnValue();

            if (v34)
            {
              -[CoreDAVXMLData startElement:inNamespace:withAttributes:](pushedData, "startElement:inNamespace:withAttributes:", CFSTR("if-match"), CFSTR("http://me.com/_namespace/"), 0);
              objc_msgSend(v33, "syncKey");
              v35 = (void *)objc_claimAutoreleasedReturnValue();
              -[CoreDAVXMLData appendElement:inNamespace:withStringContent:withAttributeNamesAndValues:](pushedData, "appendElement:inNamespace:withStringContent:withAttributeNamesAndValues:", CFSTR("getetag"), CFSTR("DAV:"), v35, 0);

              -[CoreDAVXMLData endElement:inNamespace:](pushedData, "endElement:inNamespace:", CFSTR("if-match"), CFSTR("http://me.com/_namespace/"));
            }
            -[CoreDAVXMLData startElement:inNamespace:withAttributes:](pushedData, "startElement:inNamespace:withAttributes:", CFSTR("set"), CFSTR("DAV:"), 0);
            -[CoreDAVXMLData startElement:inNamespace:withAttributes:](pushedData, "startElement:inNamespace:withAttributes:", CFSTR("prop"), CFSTR("DAV:"), 0);
            v36 = objc_alloc(MEMORY[0x24BDD17C8]);
            objc_msgSend(v33, "dataPayload");
            v37 = (void *)objc_claimAutoreleasedReturnValue();
            v38 = (void *)objc_msgSend(v36, "initWithData:encoding:", v37, 4);

            -[CoreDAVXMLData appendElement:inNamespace:withStringContentAsCDATA:withAttributeNamesAndValues:](pushedData, "appendElement:inNamespace:withStringContentAsCDATA:withAttributeNamesAndValues:", v49->_appSpecificDataProp, v49->_appSpecificNamespace, v38, 0);
            -[CoreDAVXMLData endElement:inNamespace:](pushedData, "endElement:inNamespace:", CFSTR("prop"), CFSTR("DAV:"));
            -[CoreDAVXMLData endElement:inNamespace:](pushedData, "endElement:inNamespace:", CFSTR("set"), CFSTR("DAV:"));

            v28 = v44;
            v25 = v46;
            v27 = v48;
          }
          -[CoreDAVXMLData endElement:inNamespace:](pushedData, "endElement:inNamespace:", CFSTR("resource"), CFSTR("http://me.com/_namespace/"));

          ++v29;
        }
        while (v27 != v29);
        v27 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v51, v63, 16);
      }
      while (v27);
    }

    -[CoreDAVXMLData endElement:inNamespace:](pushedData, "endElement:inNamespace:", CFSTR("multiput"), CFSTR("http://me.com/_namespace/"));
    -[CoreDAVXMLData data](pushedData, "data");
    v39 = objc_claimAutoreleasedReturnValue();
    v40 = v49->_pushedData;
    v49->_pushedData = (NSData *)v39;

    v7 = v42;
    v8 = v43;
  }

}

- (id)copyDefaultParserForContentType:(id)a3
{
  CoreDAVXMLParser *v4;
  uint64_t v5;
  void *v6;
  CoreDAVXMLParser *v7;
  CoreDAVItemParserMapping *v8;
  CoreDAVItemParserMapping *v9;
  id v10;

  v4 = [CoreDAVXMLParser alloc];
  v5 = objc_opt_class();
  -[CoreDAVTask url](self, "url");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[CoreDAVXMLParser initWithRootElementNameSpace:name:parseClass:baseURL:](v4, "initWithRootElementNameSpace:name:parseClass:baseURL:", CFSTR("DAV:"), CFSTR("multistatus"), v5, v6);

  v8 = -[CoreDAVItemParserMapping initWithNameSpace:name:parseClass:]([CoreDAVItemParserMapping alloc], "initWithNameSpace:name:parseClass:", CFSTR("DAV:"), CFSTR("getetag"), objc_opt_class());
  v9 = -[CoreDAVItemParserMapping initWithNameSpace:name:parseClass:]([CoreDAVItemParserMapping alloc], "initWithNameSpace:name:parseClass:", CFSTR("http://calendarserver.org/ns/"), CFSTR("uid"), objc_opt_class());
  v10 = objc_alloc_init(MEMORY[0x24BDBCEF0]);
  objc_msgSend(v10, "addObject:", v8);
  objc_msgSend(v10, "addObject:", v9);
  -[CoreDAVXMLParser setParseHints:](v7, "setParseHints:", v10);

  return v7;
}

- (void)finishCoreDAVTaskWithError:(id)a3
{
  id v4;
  void *v5;
  char isKindOfClass;
  void *v7;
  void *v8;
  NSString *v9;
  NSString *nextCTag;
  NSMutableSet *v11;
  NSMutableSet *bulkChangeResponses;
  uint64_t v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t i;
  void *v33;
  id v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  id obj;
  uint64_t v47;
  CoreDAVBulkChangeTask *v48;
  uint64_t v49;
  uint64_t v50;
  id v51;
  uint64_t v52;
  uint64_t v53;
  void *v54;
  uint64_t v55;
  objc_super v56;
  __int128 v57;
  __int128 v58;
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
  _BYTE v69[128];
  _BYTE v70[128];
  _BYTE v71[128];
  uint64_t v72;

  v72 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (!v4)
  {
    -[CoreDAVTask responseBodyParser](self, "responseBodyParser");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) != 0)
    {
      -[CoreDAVTask responseBodyParser](self, "responseBodyParser");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v45, "rootElement");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[CoreDAVTask responseHeaders](self, "responseHeaders");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "CDVObjectForKeyCaseInsensitive:", CFSTR("CTag"));
      v9 = (NSString *)objc_claimAutoreleasedReturnValue();
      nextCTag = self->_nextCTag;
      self->_nextCTag = v9;

      v11 = (NSMutableSet *)objc_alloc_init(MEMORY[0x24BDBCEF0]);
      bulkChangeResponses = self->_bulkChangeResponses;
      self->_bulkChangeResponses = v11;

      v67 = 0u;
      v68 = 0u;
      v65 = 0u;
      v66 = 0u;
      v44 = v7;
      objc_msgSend(v7, "responses");
      obj = (id)objc_claimAutoreleasedReturnValue();
      v49 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v65, v71, 16);
      if (v49)
      {
        v47 = *(_QWORD *)v66;
        v48 = self;
        do
        {
          v13 = 0;
          do
          {
            if (*(_QWORD *)v66 != v47)
              objc_enumerationMutation(obj);
            v50 = v13;
            v14 = *(void **)(*((_QWORD *)&v65 + 1) + 8 * v13);
            v15 = objc_alloc_init(MEMORY[0x24BDBCED8]);
            objc_msgSend(v14, "status");
            v16 = (void *)objc_claimAutoreleasedReturnValue();

            if (v16)
            {
              v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithCDVNameSpace:andName:", CFSTR("DAV:"), CFSTR("status"));
              objc_msgSend(v14, "status");
              v18 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v15, "setObject:forKey:", v18, v17);

            }
            objc_msgSend(v14, "errorItem");
            v19 = (void *)objc_claimAutoreleasedReturnValue();

            if (v19)
            {
              v20 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithCDVNameSpace:andName:", CFSTR("DAV:"), CFSTR("error"));
              objc_msgSend(v14, "errorItem");
              v21 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v15, "setObject:forKey:", v21, v20);

            }
            objc_msgSend(v14, "firstHref");
            v22 = (void *)objc_claimAutoreleasedReturnValue();

            if (v22)
            {
              v23 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithCDVNameSpace:andName:", CFSTR("DAV:"), CFSTR("href"));
              objc_msgSend(v14, "firstHref");
              v24 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v15, "setObject:forKey:", v24, v23);

            }
            v63 = 0u;
            v64 = 0u;
            v61 = 0u;
            v62 = 0u;
            objc_msgSend(v14, "propStats");
            v51 = (id)objc_claimAutoreleasedReturnValue();
            v53 = objc_msgSend(v51, "countByEnumeratingWithState:objects:count:", &v61, v70, 16);
            if (v53)
            {
              v52 = *(_QWORD *)v62;
              do
              {
                v25 = 0;
                do
                {
                  if (*(_QWORD *)v62 != v52)
                    objc_enumerationMutation(v51);
                  v26 = *(void **)(*((_QWORD *)&v61 + 1) + 8 * v25);
                  v57 = 0u;
                  v58 = 0u;
                  v59 = 0u;
                  v60 = 0u;
                  v54 = v26;
                  v55 = v25;
                  objc_msgSend(v26, "prop");
                  v27 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v27, "extraChildItems");
                  v28 = (void *)objc_claimAutoreleasedReturnValue();

                  v29 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v57, v69, 16);
                  if (v29)
                  {
                    v30 = v29;
                    v31 = *(_QWORD *)v58;
                    do
                    {
                      for (i = 0; i != v30; ++i)
                      {
                        if (*(_QWORD *)v58 != v31)
                          objc_enumerationMutation(v28);
                        v33 = *(void **)(*((_QWORD *)&v57 + 1) + 8 * i);
                        v34 = objc_alloc(MEMORY[0x24BDD17C8]);
                        objc_msgSend(v33, "nameSpace");
                        v35 = (void *)objc_claimAutoreleasedReturnValue();
                        objc_msgSend(v33, "name");
                        v36 = (void *)objc_claimAutoreleasedReturnValue();
                        v37 = (void *)objc_msgSend(v34, "initWithCDVNameSpace:andName:", v35, v36);

                        objc_msgSend(v15, "setObject:forKey:", v33, v37);
                      }
                      v30 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v57, v69, 16);
                    }
                    while (v30);
                  }

                  objc_msgSend(v54, "status");
                  v38 = (void *)objc_claimAutoreleasedReturnValue();

                  if (v38)
                  {
                    v39 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithCDVNameSpace:andName:", CFSTR("DAV:"), CFSTR("status"));
                    objc_msgSend(v54, "status");
                    v40 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v15, "setObject:forKey:", v40, v39);

                  }
                  objc_msgSend(v54, "errorItem");
                  v41 = (void *)objc_claimAutoreleasedReturnValue();

                  if (v41)
                  {
                    v42 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithCDVNameSpace:andName:", CFSTR("DAV:"), CFSTR("error"));
                    objc_msgSend(v54, "errorItem");
                    v43 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v15, "setObject:forKey:", v43, v42);

                  }
                  v25 = v55 + 1;
                }
                while (v55 + 1 != v53);
                v53 = objc_msgSend(v51, "countByEnumeratingWithState:objects:count:", &v61, v70, 16);
              }
              while (v53);
            }

            self = v48;
            -[NSMutableSet addObject:](v48->_bulkChangeResponses, "addObject:", v15);

            v13 = v50 + 1;
          }
          while (v50 + 1 != v49);
          v49 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v65, v71, 16);
        }
        while (v49);
      }

      v4 = 0;
    }
  }
  v56.receiver = self;
  v56.super_class = (Class)CoreDAVBulkChangeTask;
  -[CoreDAVTask finishCoreDAVTaskWithError:](&v56, sel_finishCoreDAVTaskWithError_, v4);

}

- (NSDictionary)uuidsToAddActions
{
  return self->_uuidsToAddActions;
}

- (NSDictionary)hrefsToModDeleteActions
{
  return self->_hrefsToModDeleteActions;
}

- (NSString)nextCTag
{
  return self->_nextCTag;
}

- (NSSet)bulkChangeResponses
{
  return &self->_bulkChangeResponses->super;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_requestDataContentType, 0);
  objc_storeStrong((id *)&self->_bulkChangeResponses, 0);
  objc_storeStrong((id *)&self->_nextCTag, 0);
  objc_storeStrong((id *)&self->_pushedData, 0);
  objc_storeStrong((id *)&self->_checkCTag, 0);
  objc_storeStrong((id *)&self->_hrefsToModDeleteActions, 0);
  objc_storeStrong((id *)&self->_uuidsToAddActions, 0);
  objc_storeStrong((id *)&self->_appSpecificDataProp, 0);
  objc_storeStrong((id *)&self->_appSpecificNamespace, 0);
}

@end
