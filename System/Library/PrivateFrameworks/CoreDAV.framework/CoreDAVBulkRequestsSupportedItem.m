@implementation CoreDAVBulkRequestsSupportedItem

- (CoreDAVBulkRequestsSupportedItem)init
{
  return -[CoreDAVItem initWithNameSpace:andName:](self, "initWithNameSpace:andName:", CFSTR("http://me.com/_namespace/"), CFSTR("supported"));
}

- (id)description
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v3 = objc_alloc_init(MEMORY[0x24BDD16A8]);
  v8.receiver = self;
  v8.super_class = (Class)CoreDAVBulkRequestsSupportedItem;
  -[CoreDAVItem description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("[%@]"), v4);

  -[CoreDAVItem extraChildItems](self, "extraChildItems");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "lastObject");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("\n  Supported: [%@]"), v6);

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
    +[CoreDAVParseRule ruleWithMinimumNumber:maximumNumber:nameSpace:elementName:objectClass:setterMethod:](CoreDAVParseRule, "ruleWithMinimumNumber:maximumNumber:nameSpace:elementName:objectClass:setterMethod:", 1, 1, CFSTR("http://me.com/_namespace/"), CFSTR("supported"), objc_opt_class(), sel_setSupported_);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@:%@"), CFSTR("http://me.com/_namespace/"), CFSTR("supported"));
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

- (CoreDAVItem)supported
{
  return self->_supported;
}

- (void)setSupported:(id)a3
{
  objc_storeStrong((id *)&self->_supported, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_supported, 0);
}

@end
