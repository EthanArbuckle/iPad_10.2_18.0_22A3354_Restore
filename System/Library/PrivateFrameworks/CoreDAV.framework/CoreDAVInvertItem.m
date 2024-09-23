@implementation CoreDAVInvertItem

- (CoreDAVInvertItem)init
{
  return -[CoreDAVItem initWithNameSpace:andName:](self, "initWithNameSpace:andName:", CFSTR("DAV:"), CFSTR("invert"));
}

- (void)write:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v4 = a3;
  -[CoreDAVItem name](self, "name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CoreDAVItem nameSpace](self, "nameSpace");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "startElement:inNamespace:withAttributeNamesAndValues:", v5, v6, 0);

  -[CoreDAVInvertItem principal](self, "principal");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "write:", v4);

  -[CoreDAVItem name](self, "name");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  -[CoreDAVItem nameSpace](self, "nameSpace");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "endElement:inNamespace:", v9, v8);

}

- (id)description
{
  id v3;
  void *v4;
  void *v5;
  objc_super v7;

  v3 = objc_alloc_init(MEMORY[0x24BDD16A8]);
  v7.receiver = self;
  v7.super_class = (Class)CoreDAVInvertItem;
  -[CoreDAVItem description](&v7, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("[%@]"), v4);

  -[CoreDAVInvertItem principal](self, "principal");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("\n  Principal: [%@]"), v5);

  return v3;
}

+ (id)copyParseRules
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  +[CoreDAVItem parseRuleCache](CoreDAVItem, "parseRuleCache");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromClass((Class)a1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKey:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    v6 = objc_alloc(MEMORY[0x24BDBCE70]);
    +[CoreDAVParseRule ruleWithMinimumNumber:maximumNumber:nameSpace:elementName:objectClass:setterMethod:](CoreDAVParseRule, "ruleWithMinimumNumber:maximumNumber:nameSpace:elementName:objectClass:setterMethod:", 1, 1, CFSTR("DAV:"), CFSTR("principal"), objc_opt_class(), sel_setPrincipal_);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@:%@"), CFSTR("DAV:"), CFSTR("principal"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (void *)objc_msgSend(v6, "initWithObjectsAndKeys:", v7, v8, 0);

    +[CoreDAVItem parseRuleCache](CoreDAVItem, "parseRuleCache");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromClass((Class)a1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setObject:forKey:", v5, v10);

  }
  return v5;
}

- (CoreDAVPrincipalItem)principal
{
  return self->_principal;
}

- (void)setPrincipal:(id)a3
{
  objc_storeStrong((id *)&self->_principal, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_principal, 0);
}

@end
