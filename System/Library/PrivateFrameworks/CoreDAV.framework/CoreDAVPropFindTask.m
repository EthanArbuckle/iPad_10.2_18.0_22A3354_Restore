@implementation CoreDAVPropFindTask

- (CoreDAVPropFindTask)initWithPropertiesToFind:(id)a3 atURL:(id)a4 withDepth:(int)a5
{
  id v8;
  id v9;
  void *v10;
  CoreDAVPropFindTask *v11;
  CoreDAVPropFindTask *v12;
  id v14;
  objc_super v15;

  v8 = a3;
  v9 = a4;
  if (!a5)
  {
    objc_msgSend(MEMORY[0x24BDBCE88], "exceptionWithName:reason:userInfo:", *MEMORY[0x24BDBCAB8], CFSTR("The depth parameter must not be CoreDAVDepthNone.  A value representing an actual depth must be specified."), 0);
    v14 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v14);
  }
  v10 = v9;
  v15.receiver = self;
  v15.super_class = (Class)CoreDAVPropFindTask;
  v11 = -[CoreDAVPropertyFindBaseTask initWithPropertiesToFind:atURL:](&v15, sel_initWithPropertiesToFind_atURL_, v8, v9);
  v12 = v11;
  if (v11)
    v11->super.super._depth = a5;

  return v12;
}

- (id)httpMethod
{
  return CFSTR("PROPFIND");
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
  void *v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
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
  -[CoreDAVXMLData startElement:inNamespace:withAttributeNamesAndValues:](v7, "startElement:inNamespace:withAttributeNamesAndValues:");
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C0]), "initWithKey:ascending:selector:", CFSTR("name"), 1, sel_caseInsensitiveCompare_);
  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCE30]), "initWithObjects:", v8, 0);
  -[CoreDAVPropertyFindBaseTask propertiesToFind](self, "propertiesToFind");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "sortedArrayUsingDescriptors:", v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v24 = 0u;
  v25 = 0u;
  v22 = 0u;
  v23 = 0u;
  v12 = v11;
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v23;
    do
    {
      for (i = 0; i != v14; ++i)
      {
        if (*(_QWORD *)v23 != v15)
          objc_enumerationMutation(v12);
        v17 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * i);
        objc_msgSend(v17, "name");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "nameSpace");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        -[CoreDAVXMLData appendElement:inNamespace:withStringContent:withAttributeNamesAndValues:](v7, "appendElement:inNamespace:withStringContent:withAttributeNamesAndValues:", v18, v19, 0, 0);

      }
      v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    }
    while (v14);
  }

  -[CoreDAVXMLData endElement:inNamespace:](v7, "endElement:inNamespace:", CFSTR("prop"), CFSTR("DAV:"));
  -[CoreDAVXMLData endElement:inNamespace:](v7, "endElement:inNamespace:", CFSTR("propfind"), CFSTR("DAV:"));
  -[CoreDAVXMLData data](v7, "data");
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  return v20;
}

- (void)finishCoreDAVTaskWithError:(id)a3
{
  id v4;
  void *v5;
  char v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  objc_super v12;

  v4 = a3;
  -[CoreDAVTask delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_opt_respondsToSelector();

  if ((v6 & 1) != 0)
  {
    -[CoreDAVPropertyFindBaseTask updateMultiStatusFromResponse](self, "updateMultiStatusFromResponse");
    if (v4)
    {
      v7 = v4;
    }
    else
    {
      -[CoreDAVPropertyFindBaseTask getTotalFailureError](self, "getTotalFailureError");
      v7 = (id)objc_claimAutoreleasedReturnValue();
    }
    v8 = v7;
    -[CoreDAVTask delegate](self, "delegate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[CoreDAVPropertyFindBaseTask multiStatus](self, "multiStatus");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "orderedResponses");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "propFindTask:parsedResponses:error:", self, v11, v8);

    -[CoreDAVTask setDelegate:](self, "setDelegate:", 0);
  }
  v12.receiver = self;
  v12.super_class = (Class)CoreDAVPropFindTask;
  -[CoreDAVPropertyFindBaseTask finishCoreDAVTaskWithError:](&v12, sel_finishCoreDAVTaskWithError_, v4);

}

@end
