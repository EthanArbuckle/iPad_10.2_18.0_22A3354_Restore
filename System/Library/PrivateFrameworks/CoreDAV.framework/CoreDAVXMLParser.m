@implementation CoreDAVXMLParser

- (CoreDAVXMLParser)initWithData:(id)a3
{
  id v4;
  CoreDAVXMLParser *v5;
  objc_super v7;

  v4 = a3;
  initializeLibXMLParser();
  v7.receiver = self;
  v7.super_class = (Class)CoreDAVXMLParser;
  v5 = -[NSXMLParser initWithData:](&v7, sel_initWithData_, v4);

  return v5;
}

- (CoreDAVXMLParser)initWithRootElementNameSpace:(id)a3 name:(id)a4 parseClass:(Class)a5 baseURL:(id)a6
{
  id v10;
  id v11;
  id v12;
  CoreDAVXMLParser *v13;
  CoreDAVXMLParser *v14;
  CoreDAVXMLElementGenerator *v15;
  void *v16;
  CoreDAVXMLElementGenerator *v17;
  CoreDAVXMLElementGenerator *v18;
  void *v19;
  CoreDAVXMLElementGenerator *v20;
  objc_super v22;

  v10 = a3;
  v11 = a4;
  v12 = a6;
  v22.receiver = self;
  v22.super_class = (Class)CoreDAVXMLParser;
  v13 = -[NSXMLParser initForIncrementalParsing](&v22, sel_initForIncrementalParsing);
  v14 = v13;
  if (v13)
  {
    -[CoreDAVXMLParser setBaseURL:](v13, "setBaseURL:", v12);
    v15 = [CoreDAVXMLElementGenerator alloc];
    -[CoreDAVXMLParser baseURL](v14, "baseURL");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = -[CoreDAVXMLElementGenerator initWithParser:baseURL:rootElementNameSpace:elementName:parseClass:](v15, "initWithParser:baseURL:rootElementNameSpace:elementName:parseClass:", v14, v16, CFSTR("DAV:"), CFSTR("error"), objc_opt_class());

    -[CoreDAVXMLParser setRootErrorGenerator:](v14, "setRootErrorGenerator:", v17);
    v18 = [CoreDAVXMLElementGenerator alloc];
    -[CoreDAVXMLParser baseURL](v14, "baseURL");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = -[CoreDAVXMLElementGenerator initWithParser:baseURL:rootElementNameSpace:elementName:parseClass:](v18, "initWithParser:baseURL:rootElementNameSpace:elementName:parseClass:", v14, v19, v10, v11, a5);

    -[CoreDAVXMLParser setRootElementGenerator:](v14, "setRootElementGenerator:", v20);
    -[NSXMLParser setShouldProcessNamespaces:](v14, "setShouldProcessNamespaces:", 1);

  }
  return v14;
}

- (BOOL)processData:(id)a3 forTask:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  BOOL v10;
  BOOL v11;

  v6 = a3;
  v7 = a4;
  if (v6)
  {
    -[CoreDAVXMLParser baseURL](self, "baseURL");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v8)
    {
      objc_msgSend(v7, "url");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[CoreDAVXMLParser setBaseURL:](self, "setBaseURL:", v9);

    }
    v10 = -[NSXMLParser parseData:](self, "parseData:", v6);
  }
  else
  {
    if ((objc_opt_respondsToSelector() & 1) == 0)
    {
      v11 = 1;
      goto LABEL_9;
    }
    v10 = -[NSXMLParser finishIncrementalParse](self, "finishIncrementalParse");
  }
  v11 = v10;
LABEL_9:

  return v11;
}

- (CoreDAVItem)rootElement
{
  void *v2;
  void *v3;

  -[CoreDAVXMLParser rootElementGenerator](self, "rootElementGenerator");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "element");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (CoreDAVItem *)v3;
}

- (CoreDAVErrorItem)rootError
{
  void *v2;
  void *v3;

  -[CoreDAVXMLParser rootErrorGenerator](self, "rootErrorGenerator");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "element");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (CoreDAVErrorItem *)v3;
}

+ (BOOL)canHandleContentType:(id)a3
{
  void *v3;
  void *v4;
  char v5;

  objc_msgSend(a3, "lowercaseString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3 && (objc_msgSend(v3, "hasPrefix:", CFSTR("text/xml")) & 1) == 0)
    v5 = objc_msgSend(v4, "hasPrefix:", CFSTR("application/xml"));
  else
    v5 = 1;

  return v5;
}

- (CoreDAVXMLElementGenerator)rootElementGenerator
{
  return self->_rootElementGenerator;
}

- (void)setRootElementGenerator:(id)a3
{
  objc_storeStrong((id *)&self->_rootElementGenerator, a3);
}

- (CoreDAVXMLElementGenerator)rootErrorGenerator
{
  return self->_rootErrorGenerator;
}

- (void)setRootErrorGenerator:(id)a3
{
  objc_storeStrong((id *)&self->_rootErrorGenerator, a3);
}

- (NSSet)parseHints
{
  return self->_parseHints;
}

- (void)setParseHints:(id)a3
{
  objc_storeStrong((id *)&self->_parseHints, a3);
}

- (NSURL)baseURL
{
  return self->_baseURL;
}

- (void)setBaseURL:(id)a3
{
  objc_storeStrong((id *)&self->_baseURL, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_baseURL, 0);
  objc_storeStrong((id *)&self->_parseHints, 0);
  objc_storeStrong((id *)&self->_rootErrorGenerator, 0);
  objc_storeStrong((id *)&self->_rootElementGenerator, 0);
}

@end
