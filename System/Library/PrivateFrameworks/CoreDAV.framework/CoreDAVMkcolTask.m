@implementation CoreDAVMkcolTask

- (CoreDAVMkcolTask)initWithURL:(id)a3
{
  return -[CoreDAVMkcolTask initWithPropertiesToSet:atURL:](self, "initWithPropertiesToSet:atURL:", 0, a3);
}

- (CoreDAVMkcolTask)initWithPropertiesToSet:(id)a3 atURL:(id)a4
{
  id v7;
  CoreDAVMkcolTask *v8;
  CoreDAVMkcolTask *v9;
  objc_super v11;

  v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)CoreDAVMkcolTask;
  v8 = -[CoreDAVTask initWithURL:](&v11, sel_initWithURL_, a4);
  v9 = v8;
  if (v8)
    objc_storeStrong((id *)&v8->_propertiesToSet, a3);

  return v9;
}

- (id)description
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  id v9;
  uint64_t v10;
  void *v11;
  objc_super v13;

  v3 = objc_alloc_init(MEMORY[0x24BDD16A8]);
  v13.receiver = self;
  v13.super_class = (Class)CoreDAVMkcolTask;
  -[CoreDAVActionBackedTask description](&v13, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("[%@ "), v4);

  -[CoreDAVMkcolTask propertiesToSet](self, "propertiesToSet");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    -[CoreDAVMkcolTask propertiesToSet](self, "propertiesToSet");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "appendFormat:", CFSTR("| Number of properties to set: [%lu]"), objc_msgSend(v6, "count"));

  }
  else
  {
    objc_msgSend(v3, "appendFormat:", CFSTR("| Number of properties to set: [%lu]"), 0);
  }

  +[CoreDAVLogging sharedLogging](CoreDAVLogging, "sharedLogging");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "shouldLogAtLevel:forAccountInfoProvider:", 7, 0);

  if (v8)
  {
    -[CoreDAVMkcolTask requestBody](self, "requestBody");
    v9 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v10 = objc_msgSend(v9, "bytes");
    v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithBytes:length:encoding:", v10, objc_msgSend(v9, "length"), 4);
    objc_msgSend(v3, "appendFormat:", CFSTR("| Request body: [%@]"), v11);

  }
  objc_msgSend(v3, "appendFormat:", CFSTR("]"));
  return v3;
}

- (id)httpMethod
{
  return CFSTR("MKCOL");
}

- (id)additionalHeaderValues
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  objc_super v11;

  v3 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  v11.receiver = self;
  v11.super_class = (Class)CoreDAVMkcolTask;
  -[CoreDAVTask additionalHeaderValues](&v11, sel_additionalHeaderValues);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addEntriesFromDictionary:", v4);

  if (self->_sendOrder)
  {
    -[NSURL CDVRawLastPathComponent](self->_priorOrderedURL, "CDVRawLastPathComponent");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v5, "length"))
    {
      v6 = (void *)MEMORY[0x24BDD17C8];
      CDVRelativeOrderHeaderString();
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "stringWithFormat:", CFSTR("%@%@"), v7, v5);
      v8 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", self->_absoluteOrder);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "stringValue");
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v8)
      {
LABEL_6:

        return v3;
      }
    }
    objc_msgSend(v3, "setObject:forKey:", v8, CFSTR("Position"));
    goto LABEL_6;
  }
  return v3;
}

- (id)requestBody
{
  uint64_t v3;
  void *v4;
  void *v5;
  uint64_t v6;
  CoreDAVXMLData *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  -[CoreDAVMkcolTask propertiesToSet](self, "propertiesToSet");
  v3 = objc_claimAutoreleasedReturnValue();
  if (!v3)
    return 0;
  v4 = (void *)v3;
  -[CoreDAVMkcolTask propertiesToSet](self, "propertiesToSet");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count");

  if (!v6)
    return 0;
  v7 = objc_alloc_init(CoreDAVXMLData);
  -[CoreDAVXMLData startElement:inNamespace:withAttributeNamesAndValues:](v7, "startElement:inNamespace:withAttributeNamesAndValues:", CFSTR("mkcol"), CFSTR("DAV:"), 0);
  -[CoreDAVMkcolTask propertiesToSet](self, "propertiesToSet");
  v8 = objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    v9 = (void *)v8;
    -[CoreDAVMkcolTask propertiesToSet](self, "propertiesToSet");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "count");

    if (v11)
    {
      -[CoreDAVXMLData startElement:inNamespace:withAttributeNamesAndValues:](v7, "startElement:inNamespace:withAttributeNamesAndValues:", CFSTR("set"), CFSTR("DAV:"), 0);
      -[CoreDAVXMLData startElement:inNamespace:withAttributeNamesAndValues:](v7, "startElement:inNamespace:withAttributeNamesAndValues:", CFSTR("prop"), CFSTR("DAV:"), 0);
      v21 = 0u;
      v22 = 0u;
      v19 = 0u;
      v20 = 0u;
      -[CoreDAVMkcolTask propertiesToSet](self, "propertiesToSet", 0);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
      if (v13)
      {
        v14 = v13;
        v15 = *(_QWORD *)v20;
        do
        {
          for (i = 0; i != v14; ++i)
          {
            if (*(_QWORD *)v20 != v15)
              objc_enumerationMutation(v12);
            objc_msgSend(*(id *)(*((_QWORD *)&v19 + 1) + 8 * i), "write:", v7);
          }
          v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
        }
        while (v14);
      }

      -[CoreDAVXMLData endElement:inNamespace:](v7, "endElement:inNamespace:", CFSTR("prop"), CFSTR("DAV:"));
      -[CoreDAVXMLData endElement:inNamespace:](v7, "endElement:inNamespace:", CFSTR("set"), CFSTR("DAV:"));
    }
  }
  -[CoreDAVXMLData endElement:inNamespace:](v7, "endElement:inNamespace:", CFSTR("mkcol"), CFSTR("DAV:"));
  -[CoreDAVXMLData data](v7, "data");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  return v17;
}

- (id)copyDefaultParserForContentType:(id)a3
{
  id v4;
  CoreDAVXMLParser *v5;
  uint64_t v6;
  void *v7;
  CoreDAVXMLParser *v8;
  objc_super v10;

  v4 = a3;
  if (+[CoreDAVXMLParser canHandleContentType:](CoreDAVXMLParser, "canHandleContentType:", v4))
  {
    v5 = [CoreDAVXMLParser alloc];
    v6 = objc_opt_class();
    -[CoreDAVTask url](self, "url");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = -[CoreDAVXMLParser initWithRootElementNameSpace:name:parseClass:baseURL:](v5, "initWithRootElementNameSpace:name:parseClass:baseURL:", CFSTR("DAV:"), CFSTR("mkcol-response"), v6, v7);

  }
  else
  {
    v10.receiver = self;
    v10.super_class = (Class)CoreDAVMkcolTask;
    v8 = -[CoreDAVTask copyDefaultParserForContentType:](&v10, sel_copyDefaultParserForContentType_, v4);
  }

  return v8;
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
  void *v16;
  char isKindOfClass;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  NSObject *v24;
  id v25;
  NSObject *v26;
  void *v27;
  char v28;
  void *v29;
  objc_super v30;
  uint8_t buf[4];
  id v32;
  __int16 v33;
  void *v34;
  uint64_t v35;

  v35 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = v4;
  if (v4)
  {
    v6 = objc_msgSend(v4, "code");
    +[CoreDAVLogging sharedLogging](CoreDAVLogging, "sharedLogging");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    WeakRetained = objc_loadWeakRetained((id *)&self->super.super._accountInfoProvider);
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
          v32 = (id)objc_opt_class();
          v11 = v32;
          v12 = "%{public}@ cancelled";
          v13 = v10;
          v14 = OS_LOG_TYPE_INFO;
          v15 = 12;
LABEL_15:
          _os_log_impl(&dword_209602000, v13, v14, v12, buf, v15);

          goto LABEL_16;
        }
        goto LABEL_16;
      }
    }
    else if (v9)
    {
      v26 = v9;
      if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543618;
        v32 = (id)objc_opt_class();
        v33 = 2112;
        v34 = v5;
        v11 = v32;
        v12 = "%{public}@ failed: %@";
        v13 = v26;
        v14 = OS_LOG_TYPE_ERROR;
        v15 = 22;
        goto LABEL_15;
      }
LABEL_16:

    }
    v25 = v5;
    v21 = 0;
    goto LABEL_21;
  }
  -[CoreDAVTask responseBodyParser](self, "responseBodyParser");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    -[CoreDAVTask responseBodyParser](self, "responseBodyParser");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "rootElement");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "propStats");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "allObjects");
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v19, "hasPropertyError"))
    {
      +[CoreDAVLogging sharedLogging](CoreDAVLogging, "sharedLogging");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = objc_loadWeakRetained((id *)&self->super.super._accountInfoProvider);
      objc_msgSend(v22, "logHandleForAccountInfoProvider:", v23);
      v24 = objc_claimAutoreleasedReturnValue();

      if (v24 && os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v32 = v19;
        _os_log_impl(&dword_209602000, v24, OS_LOG_TYPE_DEFAULT, "There we no properties successfully applied according to the following item: [%@].", buf, 0xCu);
      }

      objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("CoreDAVErrorDomain"), 2, 0);
      v25 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v25 = 0;
    }

  }
  else
  {
    v21 = 0;
    v25 = 0;
  }
LABEL_21:
  self->super.super._numDownloadedElements = objc_msgSend(v21, "count");
  -[CoreDAVTask delegate](self, "delegate");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = objc_opt_respondsToSelector();

  if ((v28 & 1) != 0)
  {
    -[CoreDAVTask delegate](self, "delegate");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "mkcolTask:parsedPropStats:error:", self, v21, v25);

    -[CoreDAVTask setDelegate:](self, "setDelegate:", 0);
  }
  v30.receiver = self;
  v30.super_class = (Class)CoreDAVMkcolTask;
  -[CoreDAVTask finishCoreDAVTaskWithError:](&v30, sel_finishCoreDAVTaskWithError_, v5);

}

- (void)setAbsoluteOrder:(int)a3
{
  self->_sendOrder = 1;
  self->_absoluteOrder = a3;
}

- (void)setPriorOrderedURL:(id)a3
{
  NSURL *v5;
  NSURL *v6;

  v5 = (NSURL *)a3;
  if (self->_priorOrderedURL != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_priorOrderedURL, a3);
    v5 = v6;
    if (self->_priorOrderedURL)
      self->_sendOrder = 1;
  }

}

- (NSSet)propertiesToSet
{
  return self->_propertiesToSet;
}

- (void)setPropertiesToSet:(id)a3
{
  objc_storeStrong((id *)&self->_propertiesToSet, a3);
}

- (int)absoluteOrder
{
  return self->_absoluteOrder;
}

- (NSURL)priorOrderedURL
{
  return self->_priorOrderedURL;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_priorOrderedURL, 0);
  objc_storeStrong((id *)&self->_propertiesToSet, 0);
}

@end
