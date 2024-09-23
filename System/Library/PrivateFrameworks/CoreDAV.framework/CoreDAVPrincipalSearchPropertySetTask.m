@implementation CoreDAVPrincipalSearchPropertySetTask

- (CoreDAVPrincipalSearchPropertySetTask)initWithURL:(id)a3
{
  CoreDAVPrincipalSearchPropertySetTask *result;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)CoreDAVPrincipalSearchPropertySetTask;
  result = -[CoreDAVTask initWithURL:](&v4, sel_initWithURL_, a3);
  if (result)
    result->super._depth = 2;
  return result;
}

- (id)httpMethod
{
  return CFSTR("REPORT");
}

- (id)requestBody
{
  CoreDAVXMLData *v2;
  void *v3;

  v2 = objc_alloc_init(CoreDAVXMLData);
  -[CoreDAVXMLData startElement:inNamespace:withAttributeNamesAndValues:](v2, "startElement:inNamespace:withAttributeNamesAndValues:", CFSTR("principal-search-property-set"), CFSTR("DAV:"), 0);
  -[CoreDAVXMLData endElement:inNamespace:](v2, "endElement:inNamespace:", CFSTR("principal-search-property-set"), CFSTR("DAV:"));
  -[CoreDAVXMLData data](v2, "data");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)copyDefaultParserForContentType:(id)a3
{
  CoreDAVXMLParser *v4;
  uint64_t v5;
  void *v6;
  CoreDAVXMLParser *v7;

  v4 = [CoreDAVXMLParser alloc];
  v5 = objc_opt_class();
  -[CoreDAVTask url](self, "url");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[CoreDAVXMLParser initWithRootElementNameSpace:name:parseClass:baseURL:](v4, "initWithRootElementNameSpace:name:parseClass:baseURL:", CFSTR("DAV:"), CFSTR("principal-search-property-set"), v5, v6);

  return v7;
}

- (void)finishCoreDAVTaskWithError:(id)a3
{
  id v4;
  void *v5;
  char v6;
  void *v7;
  void *v8;
  void *v9;
  objc_super v10;

  v4 = a3;
  -[CoreDAVTask delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_opt_respondsToSelector();

  if ((v6 & 1) != 0)
  {
    -[CoreDAVTask rootElement](self, "rootElement");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[CoreDAVTask delegate](self, "delegate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "principalSearchProperties");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "searchPropertySetTask:completetWithPropertySearchSet:error:", self, v9, v4);

    -[CoreDAVTask setDelegate:](self, "setDelegate:", 0);
  }
  v10.receiver = self;
  v10.super_class = (Class)CoreDAVPrincipalSearchPropertySetTask;
  -[CoreDAVTask finishCoreDAVTaskWithError:](&v10, sel_finishCoreDAVTaskWithError_, v4);

}

@end
