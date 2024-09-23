@implementation CoreDAVXMLElementAttribute

- (CoreDAVXMLElementAttribute)init
{
  CDVInheritedInitializerUsageDisallowed();
}

- (CoreDAVXMLElementAttribute)initWithNameSpace:(id)a3 name:(id)a4 value:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  CoreDAVXMLElementAttribute *v12;
  CoreDAVXMLElementAttribute *v13;
  id v15;
  objc_super v16;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (!v9 || (v11 = v10, !objc_msgSend(v9, "length")))
  {
    objc_msgSend(MEMORY[0x24BDBCE88], "exceptionWithName:reason:userInfo:", *MEMORY[0x24BDBCAB8], CFSTR("Non-nil and non-empty 'name' required."), 0);
    v15 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v15);
  }
  v16.receiver = self;
  v16.super_class = (Class)CoreDAVXMLElementAttribute;
  v12 = -[CoreDAVXMLElementAttribute init](&v16, sel_init);
  v13 = v12;
  if (v12)
  {
    -[CoreDAVXMLElementAttribute setNameSpace:](v12, "setNameSpace:", v8);
    -[CoreDAVXMLElementAttribute setName:](v13, "setName:", v9);
    -[CoreDAVXMLElementAttribute setValue:](v13, "setValue:", v11);
  }

  return v13;
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
  v10.super_class = (Class)CoreDAVXMLElementAttribute;
  -[CoreDAVXMLElementAttribute description](&v10, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[CoreDAVXMLElementAttribute nameSpace](self, "nameSpace");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CoreDAVXMLElementAttribute name](self, "name");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[CoreDAVXMLElementAttribute value](self, "value");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("[%@], namespace: [%@], name: [%@], value: [%@]"), v4, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
  objc_storeStrong((id *)&self->_name, a3);
}

- (NSString)nameSpace
{
  return self->_nameSpace;
}

- (void)setNameSpace:(id)a3
{
  objc_storeStrong((id *)&self->_nameSpace, a3);
}

- (NSString)value
{
  return self->_value;
}

- (void)setValue:(id)a3
{
  objc_storeStrong((id *)&self->_value, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_value, 0);
  objc_storeStrong((id *)&self->_nameSpace, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

@end
