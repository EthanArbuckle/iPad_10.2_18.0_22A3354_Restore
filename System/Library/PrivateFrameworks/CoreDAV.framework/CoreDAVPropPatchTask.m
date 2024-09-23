@implementation CoreDAVPropPatchTask

- (CoreDAVPropPatchTask)initWithURL:(id)a3
{
  CDVInheritedInitializerUsageDisallowed();
}

- (CoreDAVPropPatchTask)initWithPropertiesToSet:(id)a3 andRemove:(id)a4 atURL:(id)a5
{
  unint64_t v9;
  unint64_t v10;
  id v11;
  void *v12;
  CoreDAVPropPatchTask *v13;
  CoreDAVPropPatchTask *v14;
  id v16;
  objc_super v17;

  v9 = (unint64_t)a3;
  v10 = (unint64_t)a4;
  v11 = a5;
  if (!(v9 | v10) || ((v12 = v11, !v9) || !objc_msgSend((id)v9, "count")) && (!v10 || !objc_msgSend((id)v10, "count")))
  {
    objc_msgSend(MEMORY[0x24BDBCE88], "exceptionWithName:reason:userInfo:", *MEMORY[0x24BDBCAB8], CFSTR("The 'setElements' set or the 'removeElements' set should be non-nil and non-empty"), 0);
    v16 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v16);
  }
  v17.receiver = self;
  v17.super_class = (Class)CoreDAVPropPatchTask;
  v13 = -[CoreDAVTask initWithURL:](&v17, sel_initWithURL_, v12);
  v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_propPatchSetElements, a3);
    objc_storeStrong((id *)&v14->_propPatchRemoveElements, a4);
  }

  return v14;
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
  int v10;
  id v11;
  uint64_t v12;
  void *v13;
  objc_super v15;

  v3 = objc_alloc_init(MEMORY[0x24BDD16A8]);
  v15.receiver = self;
  v15.super_class = (Class)CoreDAVPropPatchTask;
  -[CoreDAVActionBackedTask description](&v15, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("[%@ "), v4);

  -[CoreDAVPropPatchTask propPatchSetElements](self, "propPatchSetElements");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    -[CoreDAVPropPatchTask propPatchSetElements](self, "propPatchSetElements");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "appendFormat:", CFSTR("| Number of properties to set: [%lu]"), objc_msgSend(v6, "count"));

  }
  else
  {
    objc_msgSend(v3, "appendFormat:", CFSTR("| Number of properties to set: [%lu]"), 0);
  }

  -[CoreDAVPropPatchTask propPatchRemoveElements](self, "propPatchRemoveElements");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    -[CoreDAVPropPatchTask propPatchRemoveElements](self, "propPatchRemoveElements");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "appendFormat:", CFSTR("| Number of properties to remove: [%lu]"), objc_msgSend(v8, "count"));

  }
  else
  {
    objc_msgSend(v3, "appendFormat:", CFSTR("| Number of properties to remove: [%lu]"), 0);
  }

  +[CoreDAVLogging sharedLogging](CoreDAVLogging, "sharedLogging");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "shouldLogAtLevel:forAccountInfoProvider:", 7, 0);

  if (v10)
  {
    -[CoreDAVPropPatchTask requestBody](self, "requestBody");
    v11 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v12 = objc_msgSend(v11, "bytes");
    v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithBytes:length:encoding:", v12, objc_msgSend(v11, "length"), 4);
    objc_msgSend(v3, "appendFormat:", CFSTR("\n  Request body: [%@]"), v13);

  }
  objc_msgSend(v3, "appendFormat:", CFSTR("]"));
  return v3;
}

- (id)httpMethod
{
  return CFSTR("PROPPATCH");
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
  v11.super_class = (Class)CoreDAVPropPatchTask;
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
  CoreDAVXMLData *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x24BDAC8D0];
  v3 = objc_alloc_init(CoreDAVXMLData);
  -[CoreDAVXMLData setShouldAddFormattingSpaces:](v3, "setShouldAddFormattingSpaces:", 0);
  -[CoreDAVXMLData startElement:inNamespace:withAttributeNamesAndValues:](v3, "startElement:inNamespace:withAttributeNamesAndValues:", CFSTR("propertyupdate"), CFSTR("DAV:"), 0);
  -[CoreDAVPropPatchTask propPatchSetElements](self, "propPatchSetElements");
  v4 = objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = (void *)v4;
    -[CoreDAVPropPatchTask propPatchSetElements](self, "propPatchSetElements");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "count");

    if (v7)
    {
      -[CoreDAVXMLData startElement:inNamespace:withAttributeNamesAndValues:](v3, "startElement:inNamespace:withAttributeNamesAndValues:", CFSTR("set"), CFSTR("DAV:"), 0);
      -[CoreDAVXMLData startElement:inNamespace:withAttributeNamesAndValues:](v3, "startElement:inNamespace:withAttributeNamesAndValues:", CFSTR("prop"), CFSTR("DAV:"), 0);
      v30 = 0u;
      v31 = 0u;
      v28 = 0u;
      v29 = 0u;
      -[CoreDAVPropPatchTask propPatchSetElements](self, "propPatchSetElements");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
      if (v9)
      {
        v10 = v9;
        v11 = *(_QWORD *)v29;
        do
        {
          v12 = 0;
          do
          {
            if (*(_QWORD *)v29 != v11)
              objc_enumerationMutation(v8);
            objc_msgSend(*(id *)(*((_QWORD *)&v28 + 1) + 8 * v12++), "write:", v3);
          }
          while (v10 != v12);
          v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
        }
        while (v10);
      }

      -[CoreDAVXMLData endElement:inNamespace:](v3, "endElement:inNamespace:", CFSTR("prop"), CFSTR("DAV:"));
      -[CoreDAVXMLData endElement:inNamespace:](v3, "endElement:inNamespace:", CFSTR("set"), CFSTR("DAV:"));
    }
  }
  -[CoreDAVPropPatchTask propPatchRemoveElements](self, "propPatchRemoveElements");
  v13 = objc_claimAutoreleasedReturnValue();
  if (v13)
  {
    v14 = (void *)v13;
    -[CoreDAVPropPatchTask propPatchRemoveElements](self, "propPatchRemoveElements");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "count");

    if (v16)
    {
      -[CoreDAVXMLData startElement:inNamespace:withAttributeNamesAndValues:](v3, "startElement:inNamespace:withAttributeNamesAndValues:", CFSTR("remove"), CFSTR("DAV:"), 0);
      -[CoreDAVXMLData startElement:inNamespace:withAttributeNamesAndValues:](v3, "startElement:inNamespace:withAttributeNamesAndValues:", CFSTR("prop"), CFSTR("DAV:"), 0);
      v26 = 0u;
      v27 = 0u;
      v24 = 0u;
      v25 = 0u;
      -[CoreDAVPropPatchTask propPatchRemoveElements](self, "propPatchRemoveElements", 0);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v24, v32, 16);
      if (v18)
      {
        v19 = v18;
        v20 = *(_QWORD *)v25;
        do
        {
          v21 = 0;
          do
          {
            if (*(_QWORD *)v25 != v20)
              objc_enumerationMutation(v17);
            objc_msgSend(*(id *)(*((_QWORD *)&v24 + 1) + 8 * v21++), "write:", v3);
          }
          while (v19 != v21);
          v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v24, v32, 16);
        }
        while (v19);
      }

      -[CoreDAVXMLData endElement:inNamespace:](v3, "endElement:inNamespace:", CFSTR("prop"), CFSTR("DAV:"));
      -[CoreDAVXMLData endElement:inNamespace:](v3, "endElement:inNamespace:", CFSTR("remove"), CFSTR("DAV:"));
    }
  }
  -[CoreDAVXMLData endElement:inNamespace:](v3, "endElement:inNamespace:", CFSTR("propertyupdate"), CFSTR("DAV:"));
  -[CoreDAVXMLData data](v3, "data");
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  return v22;
}

- (id)copyDefaultParserForContentType:(id)a3
{
  id v4;
  CoreDAVXMLParser *v5;
  uint64_t v6;
  void *v7;
  CoreDAVXMLParser *v8;
  void *v9;
  id WeakRetained;
  NSObject *v11;
  objc_super v13;
  uint8_t buf[4];
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (+[CoreDAVXMLParser canHandleContentType:](CoreDAVXMLParser, "canHandleContentType:", v4))
  {
    v5 = [CoreDAVXMLParser alloc];
    v6 = objc_opt_class();
    -[CoreDAVTask url](self, "url");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = -[CoreDAVXMLParser initWithRootElementNameSpace:name:parseClass:baseURL:](v5, "initWithRootElementNameSpace:name:parseClass:baseURL:", CFSTR("DAV:"), CFSTR("multistatus"), v6, v7);

    -[CoreDAVXMLParser setParseHints:](v8, "setParseHints:", 0);
  }
  else
  {
    +[CoreDAVLogging sharedLogging](CoreDAVLogging, "sharedLogging");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    WeakRetained = objc_loadWeakRetained((id *)&self->super.super._accountInfoProvider);
    objc_msgSend(v9, "logHandleForAccountInfoProvider:", WeakRetained);
    v11 = objc_claimAutoreleasedReturnValue();

    if (v11 && os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v15 = v4;
      _os_log_impl(&dword_209602000, v11, OS_LOG_TYPE_ERROR, "Refusing to parse response to PROPPATCH because of content-type: [%@].", buf, 0xCu);
    }

    v13.receiver = self;
    v13.super_class = (Class)CoreDAVPropPatchTask;
    v8 = -[CoreDAVTask copyDefaultParserForContentType:](&v13, sel_copyDefaultParserForContentType_, v4);
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
  NSObject *v17;
  id v18;
  void *v19;
  BOOL v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  void *v28;
  NSObject *v29;
  void *v30;
  void *v31;
  void *v32;
  uint64_t v33;
  id v34;
  void *v35;
  char v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  id v42;
  void *v43;
  NSObject *v44;
  void *v45;
  objc_super v46;
  uint8_t buf[4];
  id v48;
  __int16 v49;
  void *v50;
  uint64_t v51;

  v51 = *MEMORY[0x24BDAC8D0];
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
          v48 = (id)objc_opt_class();
          v11 = v48;
          v12 = "%{public}@ cancelled";
          v13 = v10;
          v14 = OS_LOG_TYPE_INFO;
          v15 = 12;
LABEL_11:
          _os_log_impl(&dword_209602000, v13, v14, v12, buf, v15);

          goto LABEL_12;
        }
        goto LABEL_12;
      }
    }
    else if (v9)
    {
      v17 = v9;
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543618;
        v48 = (id)objc_opt_class();
        v49 = 2112;
        v50 = v5;
        v11 = v48;
        v12 = "%{public}@ failed: %@";
        v13 = v17;
        v14 = OS_LOG_TYPE_ERROR;
        v15 = 22;
        goto LABEL_11;
      }
LABEL_12:

    }
    v18 = v5;
LABEL_14:
    v19 = v18;
    goto LABEL_27;
  }
  -[CoreDAVTask responseBodyParser](self, "responseBodyParser");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {

  }
  else
  {
    v20 = -[CoreDAVTask simulated](self, "simulated");

    if (!v20)
    {
      +[CoreDAVLogging sharedLogging](CoreDAVLogging, "sharedLogging");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      v42 = objc_loadWeakRetained((id *)&self->super.super._accountInfoProvider);
      objc_msgSend(v41, "logHandleForAccountInfoProvider:", v42);
      v43 = (void *)objc_claimAutoreleasedReturnValue();

      if (v43)
      {
        v44 = v43;
        if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR))
        {
          -[CoreDAVTask responseBodyParser](self, "responseBodyParser");
          v45 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412290;
          v48 = v45;
          _os_log_impl(&dword_209602000, v44, OS_LOG_TYPE_ERROR, "Unexpected parse response object for PROPPATCH: [%@].", buf, 0xCu);

        }
      }

      objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("CoreDAVErrorDomain"), 3, 0);
      v18 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_14;
    }
  }
  if (-[CoreDAVTask simulated](self, "simulated"))
  {
    -[CoreDAVTask simulatedRootElement](self, "simulatedRootElement");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[CoreDAVTask responseBodyParser](self, "responseBodyParser");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "rootElement");
    v21 = (void *)objc_claimAutoreleasedReturnValue();

  }
  objc_msgSend(v21, "responses");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "anyObject");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  -[CoreDAVPropPatchTask setResponseItem:](self, "setResponseItem:", v24);

  -[CoreDAVPropPatchTask responseItem](self, "responseItem");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v24) = objc_msgSend(v25, "hasPropertyError");

  if (!(_DWORD)v24)
    goto LABEL_25;
  +[CoreDAVLogging sharedLogging](CoreDAVLogging, "sharedLogging");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = objc_loadWeakRetained((id *)&self->super.super._accountInfoProvider);
  objc_msgSend(v26, "logHandleForAccountInfoProvider:", v27);
  v28 = (void *)objc_claimAutoreleasedReturnValue();

  if (v28)
  {
    v29 = v28;
    if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
    {
      -[CoreDAVPropPatchTask responseItem](self, "responseItem");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v48 = v30;
      _os_log_impl(&dword_209602000, v29, OS_LOG_TYPE_DEFAULT, "There were some failures changing properties, according to the following response: [%@].", buf, 0xCu);

    }
  }

  -[CoreDAVPropPatchTask responseItem](self, "responseItem");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "successfulPropertiesToValues");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = objc_msgSend(v32, "count");

  if (!v33)
  {
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("CoreDAVErrorDomain"), 2, 0);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
LABEL_25:
    v19 = 0;
  }

LABEL_27:
  self->super.super._numDownloadedElements = objc_msgSend(0, "count");
  if (v19)
  {
    v34 = v19;

    v5 = v34;
  }
  -[CoreDAVTask delegate](self, "delegate");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v36 = objc_opt_respondsToSelector();

  if ((v36 & 1) != 0)
  {
    -[CoreDAVPropPatchTask responseItem](self, "responseItem");
    v37 = (void *)objc_claimAutoreleasedReturnValue();

    if (v37)
    {
      v38 = (void *)MEMORY[0x24BDBCE30];
      -[CoreDAVPropPatchTask responseItem](self, "responseItem");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v38, "arrayWithObject:", v39);
      v37 = (void *)objc_claimAutoreleasedReturnValue();

    }
    -[CoreDAVTask delegate](self, "delegate");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "propPatchTask:parsedResponses:error:", self, v37, v19);

    -[CoreDAVTask setDelegate:](self, "setDelegate:", 0);
  }
  v46.receiver = self;
  v46.super_class = (Class)CoreDAVPropPatchTask;
  -[CoreDAVTask finishCoreDAVTaskWithError:](&v46, sel_finishCoreDAVTaskWithError_, v5);

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

- (NSSet)propPatchRemoveElements
{
  return self->_propPatchRemoveElements;
}

- (void)setPropPatchRemoveElements:(id)a3
{
  objc_storeStrong((id *)&self->_propPatchRemoveElements, a3);
}

- (NSSet)propPatchSetElements
{
  return self->_propPatchSetElements;
}

- (void)setPropPatchSetElements:(id)a3
{
  objc_storeStrong((id *)&self->_propPatchSetElements, a3);
}

- (CoreDAVResponseItem)responseItem
{
  return self->_responseItem;
}

- (void)setResponseItem:(id)a3
{
  objc_storeStrong((id *)&self->_responseItem, a3);
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
  objc_storeStrong((id *)&self->_responseItem, 0);
  objc_storeStrong((id *)&self->_propPatchSetElements, 0);
  objc_storeStrong((id *)&self->_propPatchRemoveElements, 0);
}

@end
