@implementation CoreDAVContainerMultiGetTask

- (CoreDAVContainerMultiGetTask)initWithURLs:(id)a3 atContainerURL:(id)a4 appSpecificDataItemClass:(Class)a5
{
  id v10;
  id v11;
  void *v12;
  CoreDAVContainerMultiGetTask *v13;
  CoreDAVContainerMultiGetTask *v14;
  CoreDAVContainerMultiGetTask *v15;
  objc_super v17;

  v10 = a3;
  v11 = a4;
  if (-[CoreDAVContainerMultiGetTask isMemberOfClass:](self, "isMemberOfClass:", objc_opt_class()))
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CoreDAVContainerMultiGetTask.m"), 37, CFSTR("You instantiated a class that doesn't want to be instantiated.  Please choose a concrete subclass of %@"), objc_opt_class());

    v13 = 0;
  }
  else
  {
    v17.receiver = self;
    v17.super_class = (Class)CoreDAVContainerMultiGetTask;
    v14 = -[CoreDAVTask initWithURL:](&v17, sel_initWithURL_, v11);
    v15 = v14;
    if (v14)
    {
      objc_storeStrong((id *)&v14->_urls, a3);
      if (!a5)
        a5 = (Class)objc_opt_class();
      v15->_appSpecificDataItemClass = a5;
    }
    self = v15;
    v13 = self;
  }

  return v13;
}

- (id)copyAdditionalPropElements
{
  return 0;
}

- (id)httpMethod
{
  return CFSTR("REPORT");
}

- (id)requestBody
{
  CoreDAVXMLData *v3;
  NSString *appSpecificMultiGetNameSpace;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t j;
  void *v17;
  void *v18;
  void *v19;
  CoreDAVContainerMultiGetTask *v20;
  id WeakRetained;
  NSObject *v22;
  NSString *appSpecificNamespace;
  void *v24;
  id v26;
  NSSet *obj;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  uint8_t buf[4];
  void *v37;
  _BYTE v38[128];
  _BYTE v39[128];
  uint64_t v40;

  v40 = *MEMORY[0x24BDAC8D0];
  v3 = objc_alloc_init(CoreDAVXMLData);
  v26 = -[CoreDAVContainerMultiGetTask copyAdditionalPropElements](self, "copyAdditionalPropElements");
  -[CoreDAVContainerMultiGetTask setAdditionalPropElements:](self, "setAdditionalPropElements:");
  appSpecificMultiGetNameSpace = self->_appSpecificMultiGetNameSpace;
  if (!appSpecificMultiGetNameSpace)
    appSpecificMultiGetNameSpace = self->_appSpecificNamespace;
  -[CoreDAVXMLData startElement:inNamespace:withAttributeNamesAndValues:](v3, "startElement:inNamespace:withAttributeNamesAndValues:", self->_appSpecificMultiGetCommand, appSpecificMultiGetNameSpace, 0);
  -[CoreDAVXMLData startElement:inNamespace:withAttributeNamesAndValues:](v3, "startElement:inNamespace:withAttributeNamesAndValues:", CFSTR("prop"), CFSTR("DAV:"), 0);
  -[CoreDAVXMLData appendElement:inNamespace:withStringContent:withAttributeNamesAndValues:](v3, "appendElement:inNamespace:withStringContent:withAttributeNamesAndValues:", CFSTR("getetag"), CFSTR("DAV:"), 0, 0);
  -[CoreDAVXMLData appendElement:inNamespace:withStringContent:withAttributeNamesAndValues:](v3, "appendElement:inNamespace:withStringContent:withAttributeNamesAndValues:", self->_appSpecificDataProp, self->_appSpecificNamespace, 0, 0);
  v34 = 0u;
  v35 = 0u;
  v32 = 0u;
  v33 = 0u;
  -[CoreDAVContainerMultiGetTask additionalPropElements](self, "additionalPropElements");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v32, v39, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v33;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v33 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v32 + 1) + 8 * i);
        objc_msgSend(v10, "name");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "nameSpace");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        -[CoreDAVXMLData appendElement:inNamespace:withStringContent:withAttributeNamesAndValues:](v3, "appendElement:inNamespace:withStringContent:withAttributeNamesAndValues:", v11, v12, 0, 0);

      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v32, v39, 16);
    }
    while (v7);
  }

  -[CoreDAVXMLData endElement:inNamespace:](v3, "endElement:inNamespace:", CFSTR("prop"), CFSTR("DAV:"));
  v30 = 0u;
  v31 = 0u;
  v28 = 0u;
  v29 = 0u;
  obj = self->_urls;
  v13 = -[NSSet countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v28, v38, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v29;
    do
    {
      for (j = 0; j != v14; ++j)
      {
        if (*(_QWORD *)v29 != v15)
          objc_enumerationMutation(obj);
        v17 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * j);
        objc_msgSend(v17, "CDVRawPath");
        v18 = (void *)objc_claimAutoreleasedReturnValue();

        if (v18)
        {
          objc_msgSend(v17, "CDVRawPath");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          -[CoreDAVXMLData appendElement:inNamespace:withStringContent:withAttributeNamesAndValues:](v3, "appendElement:inNamespace:withStringContent:withAttributeNamesAndValues:", CFSTR("href"), CFSTR("DAV:"), v19, 0);
        }
        else
        {
          +[CoreDAVLogging sharedLogging](CoreDAVLogging, "sharedLogging");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          v20 = self;
          WeakRetained = objc_loadWeakRetained((id *)&self->super._accountInfoProvider);
          objc_msgSend(v19, "logHandleForAccountInfoProvider:", WeakRetained);
          v22 = objc_claimAutoreleasedReturnValue();

          if (v22 && os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            v37 = v17;
            _os_log_impl(&dword_209602000, v22, OS_LOG_TYPE_DEFAULT, "Skipping item URL, as it has no path.  URL %@", buf, 0xCu);
          }

          self = v20;
        }

      }
      v14 = -[NSSet countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v28, v38, 16);
    }
    while (v14);
  }

  appSpecificNamespace = self->_appSpecificMultiGetNameSpace;
  if (!appSpecificNamespace)
    appSpecificNamespace = self->_appSpecificNamespace;
  -[CoreDAVXMLData endElement:inNamespace:](v3, "endElement:inNamespace:", self->_appSpecificMultiGetCommand, appSpecificNamespace);
  -[CoreDAVXMLData data](v3, "data");
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  return v24;
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
  void *v11;
  void *v12;

  v4 = [CoreDAVXMLParser alloc];
  v5 = objc_opt_class();
  -[CoreDAVTask url](self, "url");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[CoreDAVXMLParser initWithRootElementNameSpace:name:parseClass:baseURL:](v4, "initWithRootElementNameSpace:name:parseClass:baseURL:", CFSTR("DAV:"), CFSTR("multistatus"), v5, v6);

  v8 = -[CoreDAVItemParserMapping initWithNameSpace:name:parseClass:]([CoreDAVItemParserMapping alloc], "initWithNameSpace:name:parseClass:", CFSTR("DAV:"), CFSTR("getetag"), objc_opt_class());
  v9 = -[CoreDAVItemParserMapping initWithNameSpace:name:parseClass:]([CoreDAVItemParserMapping alloc], "initWithNameSpace:name:parseClass:", self->_appSpecificNamespace, self->_appSpecificDataProp, objc_opt_class());
  v10 = objc_alloc(MEMORY[0x24BDBCEF0]);
  -[CoreDAVContainerMultiGetTask additionalPropElements](self, "additionalPropElements");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(v10, "initWithSet:", v11);

  objc_msgSend(v12, "addObject:", v8);
  objc_msgSend(v12, "addObject:", v9);
  -[CoreDAVXMLParser setParseHints:](v7, "setParseHints:", v12);

  return v7;
}

- (void)finishCoreDAVTaskWithError:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  id WeakRetained;
  void *v9;
  NSObject *v10;
  id v11;
  const char *v12;
  NSObject *v13;
  os_log_type_t v14;
  uint32_t v15;
  NSSet *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  int v23;
  void *v24;
  id v25;
  NSObject *v26;
  void *v27;
  void *v28;
  NSSet *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  id v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  char v40;
  void *v41;
  id v42;
  NSObject *v43;
  uint64_t v44;
  NSObject *v45;
  id v46;
  NSSet *v47;
  unint64_t v48;
  unint64_t v49;
  void *v50;
  uint64_t v51;
  NSSet *parsedContents;
  NSSet *v53;
  NSSet *deletedURLs;
  NSSet *v55;
  void *v56;
  void *v57;
  uint64_t v58;
  id v59;
  NSSet *v60;
  id obj;
  uint64_t v62;
  uint64_t v63;
  objc_super v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  uint8_t v69[128];
  uint8_t buf[4];
  id v71;
  __int16 v72;
  void *v73;
  uint64_t v74;

  v74 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = v4;
  if (v4)
  {
    v6 = objc_msgSend(v4, "code");
    +[CoreDAVLogging sharedLogging](CoreDAVLogging, "sharedLogging");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    WeakRetained = objc_loadWeakRetained((id *)&self->super._accountInfoProvider);
    objc_msgSend(v7, "logHandleForAccountInfoProvider:", WeakRetained);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6 == 1)
    {
      if (v9)
      {
        v10 = v9;
        if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138543362;
          v71 = (id)objc_opt_class();
          v11 = v71;
          v12 = "%{public}@ cancelled";
          v13 = v10;
          v14 = OS_LOG_TYPE_INFO;
          v15 = 12;
LABEL_34:
          _os_log_impl(&dword_209602000, v13, v14, v12, buf, v15);

          goto LABEL_35;
        }
        goto LABEL_35;
      }
    }
    else if (v9)
    {
      v45 = v9;
      if (os_log_type_enabled(v45, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543618;
        v71 = (id)objc_opt_class();
        v72 = 2112;
        v73 = v5;
        v11 = v71;
        v12 = "%{public}@ failed: %@";
        v13 = v45;
        v14 = OS_LOG_TYPE_DEFAULT;
        v15 = 22;
        goto LABEL_34;
      }
LABEL_35:

    }
    v46 = v5;
    v47 = 0;
    v16 = 0;
    goto LABEL_44;
  }
  v16 = (NSSet *)objc_alloc_init(MEMORY[0x24BDBCEF0]);
  v59 = objc_alloc_init(MEMORY[0x24BDBCEF0]);
  v60 = (NSSet *)objc_alloc_init(MEMORY[0x24BDBCEF0]);
  -[CoreDAVTask responseBodyParser](self, "responseBodyParser");
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v57, "rootElement");
  v65 = 0u;
  v66 = 0u;
  v67 = 0u;
  v68 = 0u;
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v56, "responses");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v63 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v65, v69, 16);
  if (!v63)
  {
    v58 = 0;
    goto LABEL_38;
  }
  v58 = 0;
  v62 = *(_QWORD *)v66;
  do
  {
    v17 = 0;
    do
    {
      if (*(_QWORD *)v66 != v62)
        objc_enumerationMutation(obj);
      v18 = *(void **)(*((_QWORD *)&v65 + 1) + 8 * v17);
      objc_msgSend(v18, "firstHref");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "payloadAsFullURL");
      v20 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v18, "status");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "payloadAsString");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = objc_msgSend(v22, "CDVIsHTTPStatusLineWithStatusCode:", 404);

      if (v23)
      {
        +[CoreDAVLogging sharedLogging](CoreDAVLogging, "sharedLogging");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v25 = objc_loadWeakRetained((id *)&self->super._accountInfoProvider);
        objc_msgSend(v24, "logHandleForAccountInfoProvider:", v25);
        v26 = objc_claimAutoreleasedReturnValue();

        if (v26 && os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          v71 = v20;
          _os_log_impl(&dword_209602000, v26, OS_LOG_TYPE_DEFAULT, "Got a 404 in response to our multistatus. It looks like the item at %@ has gone away.", buf, 0xCu);
        }

        -[NSSet addObject:](v60, "addObject:", v20);
      }
      objc_msgSend(v18, "successfulPropertiesToValues");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = v27;
      if (v27)
      {
        v29 = v16;
        objc_msgSend(v27, "CDVObjectForKeyWithNameSpace:andName:", CFSTR("DAV:"), CFSTR("getetag"));
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v30, "payloadAsString");
        v31 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v28, "CDVObjectForKeyWithNameSpace:andName:", self->_appSpecificNamespace, self->_appSpecificDataProp);
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v32, "payload");
        v33 = (void *)objc_claimAutoreleasedReturnValue();

        if (v20)
          objc_msgSend(v59, "addObject:", v20);
        v34 = objc_alloc(self->_appSpecificDataItemClass);
        -[CoreDAVTask url](self, "url");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        -[CoreDAVTask accountInfoProvider](self, "accountInfoProvider");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        v37 = (void *)objc_msgSend(v34, "initWithURL:eTag:dataPayload:inContainerWithURL:withAccountInfoProvider:", v20, v31, v33, v35, v36);

        -[CoreDAVContainerMultiGetTask setAdditionalProperties:onDataItem:](self, "setAdditionalProperties:onDataItem:", v28, v37);
        v16 = v29;
        -[NSSet addObject:](v29, "addObject:", v37);

        goto LABEL_20;
      }
      objc_msgSend(v18, "status");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v38, "payloadAsString");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      v40 = objc_msgSend(v39, "CDVIsHTTPStatusLineWithStatusCode:", 404);

      if ((v40 & 1) == 0)
      {
        +[CoreDAVLogging sharedLogging](CoreDAVLogging, "sharedLogging");
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        v42 = objc_loadWeakRetained((id *)&self->super._accountInfoProvider);
        objc_msgSend(v41, "logHandleForAccountInfoProvider:", v42);
        v43 = objc_claimAutoreleasedReturnValue();

        if (v43 && os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          v71 = v18;
          _os_log_impl(&dword_209602000, v43, OS_LOG_TYPE_DEFAULT, "Got a multi-status response with no valid property values. Response is %@", buf, 0xCu);
        }

        if (!self->_shouldIgnoreResponseErrors)
        {
          objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("CoreDAVErrorDomain"), 8, 0);
          v31 = (void *)v58;
          v58 = objc_claimAutoreleasedReturnValue();
LABEL_20:

        }
      }

      ++v17;
    }
    while (v63 != v17);
    v44 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v65, v69, 16);
    v63 = v44;
  }
  while (v44);
LABEL_38:

  v48 = -[NSSet count](v16, "count");
  v5 = 0;
  v46 = (id)v58;
  v47 = v60;
  if (v48)
  {
    v49 = v48;
    if (v48 < -[NSSet count](self->_urls, "count"))
    {
      v50 = (void *)-[NSSet mutableCopy](self->_urls, "mutableCopy");
      objc_msgSend(v50, "minusSet:", v59);
      v51 = objc_msgSend(v50, "count");
      if (v51 == -[NSSet count](self->_urls, "count") - v49)
        objc_storeStrong((id *)&self->_missingURLs, v50);

    }
  }

LABEL_44:
  parsedContents = self->_parsedContents;
  self->_parsedContents = v16;
  v53 = v16;

  deletedURLs = self->_deletedURLs;
  self->_deletedURLs = v47;
  v55 = v47;

  self->super._numDownloadedElements = -[NSSet count](v53, "count");
  v64.receiver = self;
  v64.super_class = (Class)CoreDAVContainerMultiGetTask;
  -[CoreDAVTask finishCoreDAVTaskWithError:](&v64, sel_finishCoreDAVTaskWithError_, v46);

}

- (NSSet)additionalPropElements
{
  return self->_additionalPropElements;
}

- (void)setAdditionalPropElements:(id)a3
{
  objc_storeStrong((id *)&self->_additionalPropElements, a3);
}

- (BOOL)shouldIgnoreResponseErrors
{
  return self->_shouldIgnoreResponseErrors;
}

- (void)setShouldIgnoreResponseErrors:(BOOL)a3
{
  self->_shouldIgnoreResponseErrors = a3;
}

- (NSSet)parsedContents
{
  return self->_parsedContents;
}

- (NSSet)missingURLs
{
  return self->_missingURLs;
}

- (NSSet)deletedURLs
{
  return self->_deletedURLs;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_deletedURLs, 0);
  objc_storeStrong((id *)&self->_missingURLs, 0);
  objc_storeStrong((id *)&self->_parsedContents, 0);
  objc_storeStrong((id *)&self->_additionalPropElements, 0);
  objc_storeStrong((id *)&self->_appSpecificDataProp, 0);
  objc_storeStrong((id *)&self->_appSpecificMultiGetCommand, 0);
  objc_storeStrong((id *)&self->_appSpecificMultiGetNameSpace, 0);
  objc_storeStrong((id *)&self->_appSpecificNamespace, 0);
  objc_storeStrong((id *)&self->_urls, 0);
}

@end
