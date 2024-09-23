@implementation CoreDAVMultiPutTask

- (CoreDAVMultiPutTask)initWithURL:(id)a3 checkCTag:(id)a4 uuidsToAddActions:(id)a5 hrefsToModDeleteActions:(id)a6
{
  id v9;
  id v10;
  void *v11;
  CoreDAVMultiPutTask *v12;
  CoreDAVMultiPutTask *v13;
  CoreDAVXMLData *v14;
  CoreDAVXMLData *pushedData;
  NSMutableDictionary *v16;
  NSMutableDictionary *uuidToHREF;
  NSMutableDictionary *v18;
  NSMutableDictionary *hrefToETag;
  NSMutableDictionary *v20;
  NSMutableDictionary *uuidToErrorItems;
  NSMutableDictionary *v22;
  NSMutableDictionary *hrefToErrorItems;
  NSMutableDictionary *v24;
  NSMutableDictionary *uuidToStatus;
  NSMutableDictionary *v26;
  NSMutableDictionary *hrefToStatus;
  objc_super v29;

  v9 = a3;
  v10 = a4;
  if (-[CoreDAVMultiPutTask isMemberOfClass:](self, "isMemberOfClass:", objc_opt_class()))
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CoreDAVMultiPutTask.m"), 43, CFSTR("You instantiated a class that doesn't want to be instantiated.  Please choose a concrete subclass of %@"), objc_opt_class());

    v12 = 0;
  }
  else
  {
    v29.receiver = self;
    v29.super_class = (Class)CoreDAVMultiPutTask;
    v13 = -[CoreDAVTask initWithURL:](&v29, sel_initWithURL_, v9);
    if (v13)
    {
      v14 = objc_alloc_init(CoreDAVXMLData);
      pushedData = v13->_pushedData;
      v13->_pushedData = v14;

      objc_storeStrong((id *)&v13->_checkCTag, a4);
      v16 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
      uuidToHREF = v13->_uuidToHREF;
      v13->_uuidToHREF = v16;

      v18 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
      hrefToETag = v13->_hrefToETag;
      v13->_hrefToETag = v18;

      v20 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
      uuidToErrorItems = v13->_uuidToErrorItems;
      v13->_uuidToErrorItems = v20;

      v22 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
      hrefToErrorItems = v13->_hrefToErrorItems;
      v13->_hrefToErrorItems = v22;

      v24 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
      uuidToStatus = v13->_uuidToStatus;
      v13->_uuidToStatus = v24;

      v26 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
      hrefToStatus = v13->_hrefToStatus;
      v13->_hrefToStatus = v26;

    }
    self = v13;
    v12 = self;
  }

  return v12;
}

- (id)additionalHeaderValues
{
  id v3;
  void *v4;
  void *v5;
  objc_super v7;

  v3 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  v7.receiver = self;
  v7.super_class = (Class)CoreDAVMultiPutTask;
  -[CoreDAVTask additionalHeaderValues](&v7, sel_additionalHeaderValues);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addEntriesFromDictionary:", v4);

  if (self->_checkCTag)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "CDVPreconditionHeaderValueWithCTag:");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
      objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("If"));

  }
  return v3;
}

- (id)httpMethod
{
  return CFSTR("POST");
}

- (id)requestBody
{
  return -[CoreDAVXMLData data](self->_pushedData, "data");
}

- (void)fillOutDataWithUUIDsToAddActions:(id)a3 hrefsToModDeleteActions:(id)a4
{
  id v6;
  uint64_t i;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t j;
  void *v13;
  void *v14;
  CoreDAVXMLData *pushedData;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  id v20;
  id obj;
  id v22;
  id v23;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  void *v29;
  uint64_t v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  _BYTE v39[128];
  _BYTE v40[128];
  uint64_t v41;

  v41 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v20 = a4;
  -[CoreDAVXMLData startElement:inNamespace:withAttributes:](self->_pushedData, "startElement:inNamespace:withAttributes:");
  v37 = 0u;
  v38 = 0u;
  v35 = 0u;
  v36 = 0u;
  v25 = v6;
  objc_msgSend(v6, "allKeys");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v26 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v35, v40, 16);
  if (v26)
  {
    v22 = *(id *)v36;
    do
    {
      for (i = 0; i != v26; ++i)
      {
        if (*(id *)v36 != v22)
          objc_enumerationMutation(obj);
        objc_msgSend(v25, "objectForKey:", *(_QWORD *)(*((_QWORD *)&v35 + 1) + 8 * i));
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "context");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        -[CoreDAVXMLData startElement:inNamespace:withAttributes:](self->_pushedData, "startElement:inNamespace:withAttributes:", CFSTR("resource"), CFSTR("http://me.com/_namespace/"), 0);
        -[CoreDAVXMLData startElement:inNamespace:withAttributes:](self->_pushedData, "startElement:inNamespace:withAttributes:", CFSTR("set"), CFSTR("DAV:"), 0);
        -[CoreDAVXMLData startElement:inNamespace:withAttributes:](self->_pushedData, "startElement:inNamespace:withAttributes:", CFSTR("prop"), CFSTR("DAV:"), 0);
        v8 = objc_alloc(MEMORY[0x24BDD17C8]);
        objc_msgSend(v27, "dataPayload");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = (void *)objc_msgSend(v8, "initWithData:encoding:", v9, 4);

        -[CoreDAVXMLData appendElement:inNamespace:withStringContentAsCDATA:withAttributeNamesAndValues:](self->_pushedData, "appendElement:inNamespace:withStringContentAsCDATA:withAttributeNamesAndValues:", self->_appSpecificDataProp, self->_appSpecificNamespace, v10, 0);
        -[CoreDAVXMLData endElement:inNamespace:](self->_pushedData, "endElement:inNamespace:", CFSTR("prop"), CFSTR("DAV:"));
        -[CoreDAVXMLData endElement:inNamespace:](self->_pushedData, "endElement:inNamespace:", CFSTR("set"), CFSTR("DAV:"));
        -[CoreDAVXMLData endElement:inNamespace:](self->_pushedData, "endElement:inNamespace:", CFSTR("resource"), CFSTR("http://me.com/_namespace/"));

      }
      v26 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v35, v40, 16);
    }
    while (v26);
  }

  v33 = 0u;
  v34 = 0u;
  v31 = 0u;
  v32 = 0u;
  v11 = v20;
  objc_msgSend(v20, "allKeys");
  v23 = (id)objc_claimAutoreleasedReturnValue();
  v30 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v31, v39, 16);
  if (v30)
  {
    v28 = *(_QWORD *)v32;
    do
    {
      for (j = 0; j != v30; ++j)
      {
        if (*(_QWORD *)v32 != v28)
          objc_enumerationMutation(v23);
        v13 = *(void **)(*((_QWORD *)&v31 + 1) + 8 * j);
        objc_msgSend(v11, "objectForKey:", v13);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        -[CoreDAVXMLData startElement:inNamespace:withAttributes:](self->_pushedData, "startElement:inNamespace:withAttributes:", CFSTR("resource"), CFSTR("http://me.com/_namespace/"), 0);
        pushedData = self->_pushedData;
        objc_msgSend(v13, "CDVRawPath");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        -[CoreDAVXMLData appendElement:inNamespace:withStringContent:withAttributeNamesAndValues:](pushedData, "appendElement:inNamespace:withStringContent:withAttributeNamesAndValues:", CFSTR("href"), CFSTR("DAV:"), v16, 0);

        if (objc_msgSend(v14, "action") == 2)
        {
          -[CoreDAVXMLData appendElement:inNamespace:withStringContent:withAttributeNamesAndValues:](self->_pushedData, "appendElement:inNamespace:withStringContent:withAttributeNamesAndValues:", CFSTR("delete"), CFSTR("http://me.com/_namespace/"), 0, 0);
        }
        else
        {
          objc_msgSend(v14, "context");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          -[CoreDAVXMLData startElement:inNamespace:withAttributes:](self->_pushedData, "startElement:inNamespace:withAttributes:", CFSTR("set"), CFSTR("DAV:"), 0);
          -[CoreDAVXMLData startElement:inNamespace:withAttributes:](self->_pushedData, "startElement:inNamespace:withAttributes:", CFSTR("prop"), CFSTR("DAV:"), 0);
          v17 = objc_alloc(MEMORY[0x24BDD17C8]);
          objc_msgSend(v24, "dataPayload");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          v19 = (void *)objc_msgSend(v17, "initWithData:encoding:", v18, 4);

          v11 = v20;
          -[CoreDAVXMLData appendElement:inNamespace:withStringContentAsCDATA:withAttributeNamesAndValues:](self->_pushedData, "appendElement:inNamespace:withStringContentAsCDATA:withAttributeNamesAndValues:", self->_appSpecificDataProp, self->_appSpecificNamespace, v19, 0);

          -[CoreDAVXMLData endElement:inNamespace:](self->_pushedData, "endElement:inNamespace:", CFSTR("prop"), CFSTR("DAV:"));
          -[CoreDAVXMLData endElement:inNamespace:](self->_pushedData, "endElement:inNamespace:", CFSTR("set"), CFSTR("DAV:"));

        }
        -[CoreDAVXMLData endElement:inNamespace:](self->_pushedData, "endElement:inNamespace:", CFSTR("resource"), CFSTR("http://me.com/_namespace/"));

      }
      v30 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v31, v39, 16);
    }
    while (v30);
  }

  -[CoreDAVXMLData endElement:inNamespace:](self->_pushedData, "endElement:inNamespace:", CFSTR("multiput"), CFSTR("http://me.com/_namespace/"));
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
  CoreDAVMultiPutTask *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  BOOL v21;
  BOOL v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  id WeakRetained;
  NSObject *v29;
  NSString *v30;
  void *v31;
  uint64_t v32;
  void *v33;
  void *v34;
  CoreDAVMultiPutTask *v35;
  id obj;
  uint64_t v37;
  uint64_t v38;
  void *v39;
  void *v40;
  objc_super v41;
  uint8_t buf[16];
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  _BYTE v47[128];
  uint64_t v48;

  v48 = *MEMORY[0x24BDAC8D0];
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
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "rootElement");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[CoreDAVTask responseHeaders](self, "responseHeaders");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "CDVObjectForKeyCaseInsensitive:", CFSTR("ctag"));
      v9 = (NSString *)objc_claimAutoreleasedReturnValue();
      nextCTag = self->_nextCTag;
      self->_nextCTag = v9;

      v45 = 0u;
      v46 = 0u;
      v43 = 0u;
      v44 = 0u;
      v33 = v7;
      objc_msgSend(v7, "responses");
      obj = (id)objc_claimAutoreleasedReturnValue();
      v11 = self;
      v38 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v43, v47, 16);
      if (!v38)
        goto LABEL_43;
      v37 = *(_QWORD *)v44;
      v35 = self;
      while (1)
      {
        v12 = 0;
        do
        {
          if (*(_QWORD *)v44 != v37)
            objc_enumerationMutation(obj);
          v13 = *(void **)(*((_QWORD *)&v43 + 1) + 8 * v12);
          objc_msgSend(v13, "firstHref");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "payloadAsFullURL");
          v15 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v13, "successfulPropertiesToValues");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "CDVObjectForKeyWithNameSpace:andName:", CFSTR("DAV:"), CFSTR("getetag"));
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v40, "payloadAsString");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "CDVObjectForKeyWithNameSpace:andName:", CFSTR("http://calendarserver.org/ns/"), CFSTR("uid"));
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v39, "payloadAsString");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "status");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "payloadAsString");
          v20 = (void *)objc_claimAutoreleasedReturnValue();

          if (v18)
            v21 = v15 == 0;
          else
            v21 = 1;
          if (!v21)
            -[NSMutableDictionary setObject:forKey:](v11->_uuidToHREF, "setObject:forKey:", v15, v18);
          if (v15)
            v22 = v17 == 0;
          else
            v22 = 1;
          if (v22)
          {
            if (v18)
              goto LABEL_19;
          }
          else
          {
            -[NSMutableDictionary setObject:forKey:](v11->_hrefToETag, "setObject:forKey:", v17, v15);
            if (v18)
            {
LABEL_19:
              if (!v20)
                goto LABEL_27;
              goto LABEL_23;
            }
          }
          objc_msgSend(v13, "serverUID");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v23, "payloadAsString");
          v18 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v20)
            goto LABEL_27;
LABEL_23:
          if (v18)
            -[NSMutableDictionary setObject:forKey:](v11->_uuidToStatus, "setObject:forKey:", v20, v18);
          if (v15)
            -[NSMutableDictionary setObject:forKey:](v11->_hrefToStatus, "setObject:forKey:", v20, v15);
LABEL_27:
          objc_msgSend(v13, "errorItem");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          v25 = v24;
          if (!v24)
            goto LABEL_38;
          objc_msgSend(v24, "ctagOkay");
          v26 = (void *)objc_claimAutoreleasedReturnValue();

          if (v26)
          {
            +[CoreDAVLogging sharedLogging](CoreDAVLogging, "sharedLogging");
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            WeakRetained = objc_loadWeakRetained((id *)&v11->super._accountInfoProvider);
            objc_msgSend(v27, "logHandleForAccountInfoProvider:", WeakRetained);
            v29 = objc_claimAutoreleasedReturnValue();

            if (v29 && os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
            {
              *(_WORD *)buf = 0;
              _os_log_impl(&dword_209602000, v29, OS_LOG_TYPE_INFO, "Found a ctag-ok error item, marking our ctag as invalid", buf, 2u);
            }

            v11 = v35;
            v30 = v35->_nextCTag;
            v35->_nextCTag = 0;

          }
          if (v18)
          {
            if (!v15)
              goto LABEL_36;
LABEL_35:
            -[NSMutableDictionary setObject:forKey:](v11->_hrefToErrorItems, "setObject:forKey:", v25, v15);
            goto LABEL_36;
          }
          objc_msgSend(v25, "uid");
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v31, "payloadAsString");
          v18 = (void *)objc_claimAutoreleasedReturnValue();

          if (v15)
            goto LABEL_35;
LABEL_36:
          if (v18)
            -[NSMutableDictionary setObject:forKey:](v11->_uuidToErrorItems, "setObject:forKey:", v25, v18);
LABEL_38:

          ++v12;
        }
        while (v38 != v12);
        v32 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v43, v47, 16);
        v38 = v32;
        if (!v32)
        {
LABEL_43:

          self = v11;
          v4 = 0;
          break;
        }
      }
    }
  }
  v41.receiver = self;
  v41.super_class = (Class)CoreDAVMultiPutTask;
  -[CoreDAVTask finishCoreDAVTaskWithError:](&v41, sel_finishCoreDAVTaskWithError_, v4);

}

- (NSString)nextCTag
{
  return self->_nextCTag;
}

- (NSDictionary)uuidToHREF
{
  return &self->_uuidToHREF->super;
}

- (NSDictionary)hrefToETag
{
  return &self->_hrefToETag->super;
}

- (NSDictionary)uuidToErrorItems
{
  return &self->_uuidToErrorItems->super;
}

- (NSDictionary)hrefToErrorItems
{
  return &self->_hrefToErrorItems->super;
}

- (NSDictionary)uuidToStatus
{
  return &self->_uuidToStatus->super;
}

- (NSDictionary)hrefToStatus
{
  return &self->_hrefToStatus->super;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_hrefToStatus, 0);
  objc_storeStrong((id *)&self->_uuidToStatus, 0);
  objc_storeStrong((id *)&self->_hrefToErrorItems, 0);
  objc_storeStrong((id *)&self->_uuidToErrorItems, 0);
  objc_storeStrong((id *)&self->_hrefToETag, 0);
  objc_storeStrong((id *)&self->_uuidToHREF, 0);
  objc_storeStrong((id *)&self->_nextCTag, 0);
  objc_storeStrong((id *)&self->_pushedData, 0);
  objc_storeStrong((id *)&self->_checkCTag, 0);
  objc_storeStrong((id *)&self->_appSpecificDataProp, 0);
  objc_storeStrong((id *)&self->_appSpecificNamespace, 0);
}

@end
