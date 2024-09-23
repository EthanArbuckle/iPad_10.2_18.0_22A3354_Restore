@implementation CoreDAVPropertyFindBaseTask

- (CoreDAVPropertyFindBaseTask)initWithPropertiesToFind:(id)a3 atURL:(id)a4
{
  id v8;
  id v9;
  void *v10;
  CoreDAVPropertyFindBaseTask *v11;
  CoreDAVPropertyFindBaseTask *v12;
  CoreDAVPropertyFindBaseTask *v13;
  objc_super v15;

  v8 = a3;
  v9 = a4;
  if (-[CoreDAVPropertyFindBaseTask isMemberOfClass:](self, "isMemberOfClass:", objc_opt_class()))
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CoreDAVPropertyFindBaseTask.m"), 36, CFSTR("You instantiated a class that doesn't want to be instantiated.  Please choose a concrete subclass of %@"), objc_opt_class());

    v11 = 0;
  }
  else
  {
    v15.receiver = self;
    v15.super_class = (Class)CoreDAVPropertyFindBaseTask;
    v12 = -[CoreDAVTask initWithURL:](&v15, sel_initWithURL_, v9);
    v13 = v12;
    if (v12)
      objc_storeStrong((id *)&v12->_propertiesToFind, a3);
    self = v13;
    v11 = self;
  }

  return v11;
}

- (id)description
{
  id v3;
  void *v4;
  void *v5;
  objc_super v7;

  v3 = objc_alloc_init(MEMORY[0x24BDD16A8]);
  v7.receiver = self;
  v7.super_class = (Class)CoreDAVPropertyFindBaseTask;
  -[CoreDAVTask description](&v7, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("[%@ "), v4);

  -[CoreDAVPropertyFindBaseTask propertiesToFind](self, "propertiesToFind");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("| Number of properties to find: [%lu]"), objc_msgSend(v5, "count"));

  objc_msgSend(v3, "appendFormat:", CFSTR("]"));
  return v3;
}

- (id)additionalHeaderValues
{
  id v3;
  void *v4;
  objc_super v6;

  v3 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  v6.receiver = self;
  v6.super_class = (Class)CoreDAVPropertyFindBaseTask;
  -[CoreDAVTask additionalHeaderValues](&v6, sel_additionalHeaderValues);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addEntriesFromDictionary:", v4);

  objc_msgSend(v3, "setObject:forKey:", CFSTR("t"), CFSTR("Brief"));
  objc_msgSend(v3, "setObject:forKey:", CFSTR("return=minimal"), CFSTR("Prefer"));
  return v3;
}

- (id)copyDefaultParserForContentType:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;
  CoreDAVXMLParser *v8;
  void *v9;

  -[CoreDAVTask url](self, "url", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[CoreDAVTask lastRedirectURL](self, "lastRedirectURL");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    v7 = v5;

    v4 = v7;
  }
  v8 = -[CoreDAVXMLParser initWithRootElementNameSpace:name:parseClass:baseURL:]([CoreDAVXMLParser alloc], "initWithRootElementNameSpace:name:parseClass:baseURL:", CFSTR("DAV:"), CFSTR("multistatus"), objc_opt_class(), v4);
  -[CoreDAVPropertyFindBaseTask parseHints](self, "parseHints");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[CoreDAVXMLParser setParseHints:](v8, "setParseHints:", v9);

  return v8;
}

- (id)successfulValueForNameSpace:(id)a3 elementName:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *i;
  void *v13;
  void *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  -[CoreDAVPropertyFindBaseTask multiStatus](self, "multiStatus", 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "responses");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = (void *)objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v10)
  {
    v11 = *(_QWORD *)v17;
    while (2)
    {
      for (i = 0; i != v10; i = (char *)i + 1)
      {
        if (*(_QWORD *)v17 != v11)
          objc_enumerationMutation(v9);
        objc_msgSend(*(id *)(*((_QWORD *)&v16 + 1) + 8 * (_QWORD)i), "successfulPropertiesToValues");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        if (v13)
        {
          v14 = v13;
          objc_msgSend(v13, "CDVObjectForKeyWithNameSpace:andName:", v6, v7);
          v10 = (void *)objc_claimAutoreleasedReturnValue();

          goto LABEL_11;
        }
      }
      v10 = (void *)objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      if (v10)
        continue;
      break;
    }
  }
LABEL_11:

  return v10;
}

- (void)updateMultiStatusFromResponse
{
  void *v3;
  void *v4;
  _BOOL4 v5;
  id v6;

  -[CoreDAVPropertyFindBaseTask multiStatus](self, "multiStatus");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    -[CoreDAVTask responseBodyParser](self, "responseBodyParser");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {

    }
    else
    {
      v5 = -[CoreDAVTask simulated](self, "simulated");

      if (!v5)
        return;
    }
    -[CoreDAVTask rootElement](self, "rootElement");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    -[CoreDAVPropertyFindBaseTask setMultiStatus:](self, "setMultiStatus:", v6);
    v3 = v6;
  }

}

- (id)getTotalFailureError
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  __int128 v7;
  uint64_t v8;
  int v9;
  uint64_t v10;
  int v11;
  uint64_t i;
  void *v13;
  void *v14;
  uint64_t v15;
  BOOL v16;
  _BOOL4 v17;
  void *v18;
  id WeakRetained;
  NSObject *v20;
  void *v21;
  __int128 v23;
  CoreDAVPropertyFindBaseTask *v24;
  id obj;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  uint8_t buf[4];
  void *v31;
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x24BDAC8D0];
  -[CoreDAVPropertyFindBaseTask updateMultiStatusFromResponse](self, "updateMultiStatusFromResponse");
  -[CoreDAVPropertyFindBaseTask multiStatus](self, "multiStatus");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
    goto LABEL_17;
  v28 = 0u;
  v29 = 0u;
  v26 = 0u;
  v27 = 0u;
  -[CoreDAVPropertyFindBaseTask multiStatus](self, "multiStatus");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "responses");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v26, v32, 16);
  if (!v6)
  {

LABEL_17:
    v21 = 0;
    return v21;
  }
  v8 = v6;
  v24 = self;
  v9 = 0;
  v10 = *(_QWORD *)v27;
  v11 = 1;
  *(_QWORD *)&v7 = 138412290;
  v23 = v7;
  obj = v5;
  do
  {
    for (i = 0; i != v8; ++i)
    {
      if (*(_QWORD *)v27 != v10)
        objc_enumerationMutation(obj);
      v13 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * i);
      objc_msgSend(v13, "successfulPropertiesToValues", v23);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v14, "count");

      v16 = v15 != 0;
      v17 = v15 == 0;
      if (objc_msgSend(v13, "hasPropertyError"))
      {
        +[CoreDAVLogging sharedLogging](CoreDAVLogging, "sharedLogging");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        WeakRetained = objc_loadWeakRetained((id *)&v24->super._accountInfoProvider);
        objc_msgSend(v18, "logHandleForAccountInfoProvider:", WeakRetained);
        v20 = objc_claimAutoreleasedReturnValue();

        if (v20 && os_log_type_enabled(v20, (os_log_type_t)(2 * v16)))
        {
          *(_DWORD *)buf = v23;
          v31 = v13;
          _os_log_impl(&dword_209602000, v20, (os_log_type_t)(2 * v16), "There were some failures fetching properties, according to the following response: [%@].", buf, 0xCu);
        }

        v9 = 1;
      }
      v11 &= v17;
    }
    v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v26, v32, 16);
  }
  while (v8);

  if ((v9 & v11) != 1)
    goto LABEL_17;
  objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("CoreDAVErrorDomain"), 2, 0);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  return v21;
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
  NSObject *v16;
  objc_super v17;
  uint8_t buf[4];
  id v19;
  __int16 v20;
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
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
          v19 = (id)objc_opt_class();
          v11 = v19;
          v12 = "%{public}@ cancelled";
          v13 = v10;
          v14 = OS_LOG_TYPE_INFO;
          v15 = 12;
LABEL_9:
          _os_log_impl(&dword_209602000, v13, v14, v12, buf, v15);

          goto LABEL_10;
        }
        goto LABEL_10;
      }
    }
    else if (v9)
    {
      v16 = v9;
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543618;
        v19 = (id)objc_opt_class();
        v20 = 2112;
        v21 = v5;
        v11 = v19;
        v12 = "%{public}@ failed: %@";
        v13 = v16;
        v14 = OS_LOG_TYPE_ERROR;
        v15 = 22;
        goto LABEL_9;
      }
LABEL_10:

    }
  }
  -[CoreDAVPropertyFindBaseTask updateMultiStatusFromResponse](self, "updateMultiStatusFromResponse");
  v17.receiver = self;
  v17.super_class = (Class)CoreDAVPropertyFindBaseTask;
  -[CoreDAVTask finishCoreDAVTaskWithError:](&v17, sel_finishCoreDAVTaskWithError_, v5);

}

- (NSSet)propertiesToFind
{
  return self->_propertiesToFind;
}

- (void)setPropertiesToFind:(id)a3
{
  objc_storeStrong((id *)&self->_propertiesToFind, a3);
}

- (CoreDAVMultiStatusItem)multiStatus
{
  return self->_multiStatus;
}

- (void)setMultiStatus:(id)a3
{
  objc_storeStrong((id *)&self->_multiStatus, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_propertiesToFind, 0);
  objc_storeStrong((id *)&self->_multiStatus, 0);
}

@end
