@implementation CoreDAVSyncReportTask

- (CoreDAVSyncReportTask)initWithPropertiesToFind:(id)a3 atURL:(id)a4 withDepth:(int)a5 previousSyncToken:(id)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  CoreDAVSyncReportTask *v14;
  CoreDAVSyncReportTask *v15;
  id v17;
  objc_super v18;

  v10 = a3;
  v11 = a4;
  v12 = a6;
  if (!a5)
  {
    objc_msgSend(MEMORY[0x24BDBCE88], "exceptionWithName:reason:userInfo:", *MEMORY[0x24BDBCAB8], CFSTR("The depth parameter must not be CoreDAVDepthNone.  A value representing an actual depth must be specified."), 0);
    v17 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v17);
  }
  v13 = v12;
  v18.receiver = self;
  v18.super_class = (Class)CoreDAVSyncReportTask;
  v14 = -[CoreDAVPropertyFindBaseTask initWithPropertiesToFind:atURL:](&v18, sel_initWithPropertiesToFind_atURL_, v10, v11);
  v15 = v14;
  if (v14)
  {
    v14->super.super._depth = a5;
    objc_storeStrong((id *)&v14->_previousSyncToken, a6);
  }

  return v15;
}

- (id)description
{
  id v3;
  void *v4;
  objc_super v6;

  v3 = objc_alloc_init(MEMORY[0x24BDD16A8]);
  v6.receiver = self;
  v6.super_class = (Class)CoreDAVSyncReportTask;
  -[CoreDAVPropertyFindBaseTask description](&v6, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("%@"), v4);

  objc_msgSend(v3, "appendFormat:", CFSTR("\n  Previous Sync Token: [%@]"), self->_previousSyncToken);
  return v3;
}

- (id)httpMethod
{
  return CFSTR("REPORT");
}

- (id)requestBody
{
  uint64_t v3;
  void *v4;
  void *v5;
  uint64_t v6;
  CoreDAVXMLData *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  -[CoreDAVPropertyFindBaseTask propertiesToFind](self, "propertiesToFind");
  v3 = objc_claimAutoreleasedReturnValue();
  if (!v3)
    return 0;
  v4 = (void *)v3;
  -[CoreDAVPropertyFindBaseTask propertiesToFind](self, "propertiesToFind");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count");

  if (!v6)
    return 0;
  v7 = objc_alloc_init(CoreDAVXMLData);
  -[CoreDAVXMLData startElement:inNamespace:withAttributeNamesAndValues:](v7, "startElement:inNamespace:withAttributeNamesAndValues:");
  -[CoreDAVXMLData appendElement:inNamespace:withStringContent:withAttributeNamesAndValues:](v7, "appendElement:inNamespace:withStringContent:withAttributeNamesAndValues:", CFSTR("sync-token"), CFSTR("DAV:"), self->_previousSyncToken, 0);
  objc_msgSend((id)objc_opt_class(), "stringFromDepth:", self->super.super._depth);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
    -[CoreDAVXMLData appendElement:inNamespace:withStringContent:withAttributeNamesAndValues:](v7, "appendElement:inNamespace:withStringContent:withAttributeNamesAndValues:", CFSTR("sync-level"), CFSTR("DAV:"), v8, 0);
  -[CoreDAVXMLData startElement:inNamespace:withAttributeNamesAndValues:](v7, "startElement:inNamespace:withAttributeNamesAndValues:", CFSTR("prop"), CFSTR("DAV:"), 0);
  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  -[CoreDAVPropertyFindBaseTask propertiesToFind](self, "propertiesToFind");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v20;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v20 != v12)
          objc_enumerationMutation(v9);
        v14 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * i);
        objc_msgSend(v14, "name");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "nameSpace");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        -[CoreDAVXMLData appendElement:inNamespace:withStringContent:withAttributeNamesAndValues:](v7, "appendElement:inNamespace:withStringContent:withAttributeNamesAndValues:", v15, v16, 0, 0);

      }
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    }
    while (v11);
  }

  -[CoreDAVXMLData endElement:inNamespace:](v7, "endElement:inNamespace:", CFSTR("prop"), CFSTR("DAV:"));
  -[CoreDAVXMLData endElement:inNamespace:](v7, "endElement:inNamespace:", CFSTR("sync-collection"), CFSTR("DAV:"));
  -[CoreDAVXMLData data](v7, "data");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  return v17;
}

- (id)notFoundHREFs
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  __int128 v7;
  uint64_t v8;
  uint64_t v9;
  _UNKNOWN **v10;
  uint64_t i;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  void *v17;
  void *v18;
  NSObject *v19;
  NSObject *v20;
  void *v21;
  id v22;
  _UNKNOWN **v23;
  void *v24;
  __int128 v26;
  void *v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  uint8_t buf[4];
  void *v33;
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x24BDAC8D0];
  v3 = objc_alloc_init(MEMORY[0x24BDBCEF0]);
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  -[CoreDAVPropertyFindBaseTask multiStatus](self, "multiStatus");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "responses");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v28, v34, 16);
  if (v6)
  {
    v8 = v6;
    v9 = *(_QWORD *)v29;
    v10 = &off_24C1D9000;
    *(_QWORD *)&v7 = 138412290;
    v26 = v7;
    v27 = v5;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v29 != v9)
          objc_enumerationMutation(v5);
        v12 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * i);
        objc_msgSend(v12, "status", v26);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "payloadAsString");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = objc_msgSend(v14, "CDVIsHTTPStatusLineWithStatusCode:", 404);

        if (v15)
        {
          objc_msgSend(v12, "firstHref");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "payloadAsFullURL");
          v17 = (void *)objc_claimAutoreleasedReturnValue();

          if (v17)
          {
            objc_msgSend(v3, "addObject:", v17);
          }
          else
          {
            objc_msgSend(v10[66], "sharedLogging");
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v18, "logHandleForAccountInfoProvider:", 0);
            v19 = objc_claimAutoreleasedReturnValue();
            v20 = v19;
            if (v19 && os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
            {
              objc_msgSend(v12, "firstHref");
              v21 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v21, "payloadAsString");
              v22 = v3;
              v23 = v10;
              v24 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = v26;
              v33 = v24;
              _os_log_impl(&dword_209602000, v20, OS_LOG_TYPE_ERROR, "The server gave us an invalid URL. Ignoring it. \"%@\", buf, 0xCu);

              v10 = v23;
              v3 = v22;
              v5 = v27;
            }

          }
        }
      }
      v8 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v28, v34, 16);
    }
    while (v8);
  }

  return v3;
}

- (id)copyDefaultParserForContentType:(id)a3
{
  CoreDAVXMLParser *v4;
  uint64_t v5;
  void *v6;
  CoreDAVXMLParser *v7;
  void *v8;

  v4 = [CoreDAVXMLParser alloc];
  v5 = objc_opt_class();
  -[CoreDAVTask url](self, "url");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[CoreDAVXMLParser initWithRootElementNameSpace:name:parseClass:baseURL:](v4, "initWithRootElementNameSpace:name:parseClass:baseURL:", CFSTR("DAV:"), CFSTR("multistatus"), v5, v6);

  -[CoreDAVPropertyFindBaseTask parseHints](self, "parseHints");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[CoreDAVXMLParser setParseHints:](v7, "setParseHints:", v8);

  return v7;
}

- (BOOL)hadUnexpectedChangeOfSyncTokenWithZeroResponses
{
  NSString *nextSyncToken;
  BOOL v4;
  void *v5;
  void *v6;

  if (!self->_previousSyncToken)
    return 0;
  nextSyncToken = self->_nextSyncToken;
  if (!nextSyncToken || -[NSString isEqualToString:](nextSyncToken, "isEqualToString:"))
    return 0;
  -[CoreDAVPropertyFindBaseTask multiStatus](self, "multiStatus");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "responses");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v6, "count") == 0;

  return v4;
}

- (void)finishCoreDAVTaskWithError:(id)a3
{
  id v4;
  void *v5;
  NSString *v6;
  NSString *nextSyncToken;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  void *i;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  int v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  objc_super v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[CoreDAVPropertyFindBaseTask updateMultiStatusFromResponse](self, "updateMultiStatusFromResponse");
  -[CoreDAVPropertyFindBaseTask multiStatus](self, "multiStatus");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "syncToken");
  v6 = (NSString *)objc_claimAutoreleasedReturnValue();
  nextSyncToken = self->_nextSyncToken;
  self->_nextSyncToken = v6;

  v29 = 0u;
  v30 = 0u;
  v27 = 0u;
  v28 = 0u;
  -[CoreDAVPropertyFindBaseTask multiStatus](self, "multiStatus");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "responses");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = (id)objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
  if (v10)
  {
    v25 = v4;
    v11 = *(_QWORD *)v28;
    while (2)
    {
      for (i = 0; i != v10; i = (char *)i + 1)
      {
        if (*(_QWORD *)v28 != v11)
          objc_enumerationMutation(v9);
        v13 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * (_QWORD)i);
        objc_msgSend(v13, "firstHref");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "payloadAsFullURL");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        -[CoreDAVTask url](self, "url");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = objc_msgSend(v15, "isEqual:", v16);

        if (v17)
        {
          v10 = v13;
          goto LABEL_11;
        }
      }
      v10 = (id)objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
      if (v10)
        continue;
      break;
    }
LABEL_11:
    v4 = v25;
  }

  objc_msgSend(v10, "errorItem");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "numberOfMatchesWithinLimits");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  self->_moreToSync = v19 != 0;

  objc_msgSend(v10, "errorItem");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "validSyncToken");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  self->_wasInvalidSyncToken = v21 != 0;

  -[CoreDAVTask responseBodyParser](self, "responseBodyParser");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "rootError");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "validSyncToken");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  self->_wasInvalidSyncToken |= v24 != 0;

  v26.receiver = self;
  v26.super_class = (Class)CoreDAVSyncReportTask;
  -[CoreDAVPropertyFindBaseTask finishCoreDAVTaskWithError:](&v26, sel_finishCoreDAVTaskWithError_, v4);

}

- (NSString)nextSyncToken
{
  return self->_nextSyncToken;
}

- (BOOL)moreToSync
{
  return self->_moreToSync;
}

- (BOOL)wasInvalidSyncToken
{
  return self->_wasInvalidSyncToken;
}

- (NSString)previousSyncToken
{
  return self->_previousSyncToken;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_previousSyncToken, 0);
  objc_storeStrong((id *)&self->_nextSyncToken, 0);
}

@end
