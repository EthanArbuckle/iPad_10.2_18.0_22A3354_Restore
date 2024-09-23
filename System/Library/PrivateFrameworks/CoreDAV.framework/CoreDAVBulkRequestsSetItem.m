@implementation CoreDAVBulkRequestsSetItem

- (CoreDAVBulkRequestsSetItem)init
{
  return -[CoreDAVItem initWithNameSpace:andName:](self, "initWithNameSpace:andName:", CFSTR("http://me.com/_namespace/"), CFSTR("bulk-requests"));
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
  v8.super_class = (Class)CoreDAVBulkRequestsSetItem;
  -[CoreDAVItem description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("[%@]"), v4);

  -[CoreDAVBulkRequestsSetItem crudItem](self, "crudItem");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CoreDAVBulkRequestsSetItem simpleItem](self, "simpleItem");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("\n  CRUD %@\nSimple %@"), v5, v6);

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
  void *v11;
  void *v12;

  +[CoreDAVItem parseRuleCache](CoreDAVItem, "parseRuleCache");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromClass((Class)a1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKey:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    v6 = objc_alloc(MEMORY[0x24BDBCE70]);
    +[CoreDAVParseRule ruleWithMinimumNumber:maximumNumber:nameSpace:elementName:objectClass:setterMethod:](CoreDAVParseRule, "ruleWithMinimumNumber:maximumNumber:nameSpace:elementName:objectClass:setterMethod:", 0, 1, CFSTR("http://me.com/_namespace/"), CFSTR("crud"), objc_opt_class(), sel_setCrudItem_);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@:%@"), CFSTR("http://me.com/_namespace/"), CFSTR("crud"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    +[CoreDAVParseRule ruleWithMinimumNumber:maximumNumber:nameSpace:elementName:objectClass:setterMethod:](CoreDAVParseRule, "ruleWithMinimumNumber:maximumNumber:nameSpace:elementName:objectClass:setterMethod:", 0, 1, CFSTR("http://me.com/_namespace/"), CFSTR("simple"), objc_opt_class(), sel_setSimpleItem_);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@:%@"), CFSTR("http://me.com/_namespace/"), CFSTR("simple"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (void *)objc_msgSend(v6, "initWithObjectsAndKeys:", v7, v8, v9, v10, 0);

    +[CoreDAVItem parseRuleCache](CoreDAVItem, "parseRuleCache");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromClass((Class)a1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setObject:forKey:", v5, v12);

  }
  return v5;
}

- (NSDictionary)dictRepresentation
{
  id v3;
  void *v4;
  void *v5;

  if (self->_crudItem || self->_simpleItem)
  {
    v3 = objc_alloc_init(MEMORY[0x24BDBCED8]);
    -[CoreDAVBulkRequestsItem dictRepresentation](self->_crudItem, "dictRepresentation");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4)
      objc_msgSend(v3, "setObject:forKey:", v4, CFSTR("crud"));
    -[CoreDAVBulkRequestsItem dictRepresentation](self->_simpleItem, "dictRepresentation");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
      objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("simple"));

  }
  else
  {
    v3 = 0;
  }
  return (NSDictionary *)v3;
}

- (CoreDAVBulkRequestsItem)crudItem
{
  return self->_crudItem;
}

- (void)setCrudItem:(id)a3
{
  objc_storeStrong((id *)&self->_crudItem, a3);
}

- (CoreDAVBulkRequestsItem)simpleItem
{
  return self->_simpleItem;
}

- (void)setSimpleItem:(id)a3
{
  objc_storeStrong((id *)&self->_simpleItem, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_simpleItem, 0);
  objc_storeStrong((id *)&self->_crudItem, 0);
}

@end
