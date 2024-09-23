@implementation CoreDAVItemParserMapping

- (CoreDAVItemParserMapping)initWithNameSpace:(id)a3 name:(id)a4 parseClass:(Class)a5
{
  id v9;
  id v10;
  CoreDAVItemParserMapping *v11;
  CoreDAVItemParserMapping *v12;
  objc_super v14;

  v9 = a3;
  v10 = a4;
  v14.receiver = self;
  v14.super_class = (Class)CoreDAVItemParserMapping;
  v11 = -[CoreDAVItemParserMapping init](&v14, sel_init);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_nameSpace, a3);
    objc_storeStrong((id *)&v12->_name, a4);
    v12->_parseClass = a5;
  }

  return v12;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  objc_super v10;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v10.receiver = self;
  v10.super_class = (Class)CoreDAVItemParserMapping;
  -[CoreDAVItemParserMapping description](&v10, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[CoreDAVItemParserMapping nameSpace](self, "nameSpace");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CoreDAVItemParserMapping name](self, "name");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromClass(-[CoreDAVItemParserMapping parseClass](self, "parseClass"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("[%@], namespace: [%@], name: [%@] parse class: [%@]"), v4, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (NSString)nameSpace
{
  return self->_nameSpace;
}

- (void)setNameSpace:(id)a3
{
  objc_storeStrong((id *)&self->_nameSpace, a3);
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
  objc_storeStrong((id *)&self->_name, a3);
}

- (Class)parseClass
{
  return self->_parseClass;
}

- (void)setParseClass:(Class)a3
{
  self->_parseClass = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_nameSpace, 0);
}

@end
