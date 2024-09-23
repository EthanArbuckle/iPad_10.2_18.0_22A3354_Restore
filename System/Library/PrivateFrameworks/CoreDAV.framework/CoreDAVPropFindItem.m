@implementation CoreDAVPropFindItem

- (CoreDAVPropFindItem)init
{
  return -[CoreDAVItem initWithNameSpace:andName:](self, "initWithNameSpace:andName:", CFSTR("DAV:"), CFSTR("propfind"));
}

- (id)description
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  objc_super v10;

  v3 = objc_alloc_init(MEMORY[0x24BDD16A8]);
  v10.receiver = self;
  v10.super_class = (Class)CoreDAVPropFindItem;
  -[CoreDAVItem description](&v10, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("[%@]"), v4);

  -[CoreDAVPropFindItem propName](self, "propName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("\n  Propname: [%@]"), v5);

  -[CoreDAVPropFindItem allProp](self, "allProp");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("\n  Allprop: [%@]"), v6);

  -[CoreDAVPropFindItem include](self, "include");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("\n  Include: [%@]"), v7);

  -[CoreDAVPropFindItem prop](self, "prop");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("\n  Prop: [%@]"), v8);

  return v3;
}

+ (id)copyParseRules
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v15;
  void *v16;
  id v17;

  +[CoreDAVItem parseRuleCache](CoreDAVItem, "parseRuleCache");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromClass((Class)a1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKey:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    v17 = objc_alloc(MEMORY[0x24BDBCE70]);
    +[CoreDAVParseRule ruleWithMinimumNumber:maximumNumber:nameSpace:elementName:objectClass:setterMethod:](CoreDAVParseRule, "ruleWithMinimumNumber:maximumNumber:nameSpace:elementName:objectClass:setterMethod:", 0, 1, CFSTR("DAV:"), CFSTR("propname"), objc_opt_class(), sel_setPropName_);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@:%@"), CFSTR("DAV:"), CFSTR("propname"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    +[CoreDAVParseRule ruleWithMinimumNumber:maximumNumber:nameSpace:elementName:objectClass:setterMethod:](CoreDAVParseRule, "ruleWithMinimumNumber:maximumNumber:nameSpace:elementName:objectClass:setterMethod:", 0, 1, CFSTR("DAV:"), CFSTR("allprop"), objc_opt_class(), sel_setAllProp_);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@:%@"), CFSTR("DAV:"), CFSTR("allprop"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    +[CoreDAVParseRule ruleWithMinimumNumber:maximumNumber:nameSpace:elementName:objectClass:setterMethod:](CoreDAVParseRule, "ruleWithMinimumNumber:maximumNumber:nameSpace:elementName:objectClass:setterMethod:", 0, 1, CFSTR("DAV:"), CFSTR("include"), objc_opt_class(), sel_setInclude_);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@:%@"), CFSTR("DAV:"), CFSTR("include"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    +[CoreDAVParseRule ruleWithMinimumNumber:maximumNumber:nameSpace:elementName:objectClass:setterMethod:](CoreDAVParseRule, "ruleWithMinimumNumber:maximumNumber:nameSpace:elementName:objectClass:setterMethod:", 0, 1, CFSTR("DAV:"), CFSTR("prop"), objc_opt_class(), sel_setProp_);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@:%@"), CFSTR("DAV:"), CFSTR("prop"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (void *)objc_msgSend(v17, "initWithObjectsAndKeys:", v16, v15, v6, v7, v8, v9, v10, v11, 0);

    +[CoreDAVItem parseRuleCache](CoreDAVItem, "parseRuleCache");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromClass((Class)a1);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setObject:forKey:", v5, v13);

  }
  return v5;
}

- (CoreDAVItemWithNoChildren)propName
{
  return self->_propName;
}

- (void)setPropName:(id)a3
{
  objc_storeStrong((id *)&self->_propName, a3);
}

- (CoreDAVItemWithNoChildren)allProp
{
  return self->_allProp;
}

- (void)setAllProp:(id)a3
{
  objc_storeStrong((id *)&self->_allProp, a3);
}

- (CoreDAVItem)include
{
  return self->_include;
}

- (void)setInclude:(id)a3
{
  objc_storeStrong((id *)&self->_include, a3);
}

- (CoreDAVItem)prop
{
  return self->_prop;
}

- (void)setProp:(id)a3
{
  objc_storeStrong((id *)&self->_prop, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_prop, 0);
  objc_storeStrong((id *)&self->_include, 0);
  objc_storeStrong((id *)&self->_allProp, 0);
  objc_storeStrong((id *)&self->_propName, 0);
}

@end
