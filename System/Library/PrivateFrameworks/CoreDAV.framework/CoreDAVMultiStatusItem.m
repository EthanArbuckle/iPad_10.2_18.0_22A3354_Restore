@implementation CoreDAVMultiStatusItem

- (CoreDAVMultiStatusItem)init
{
  return -[CoreDAVItem initWithNameSpace:andName:](self, "initWithNameSpace:andName:", CFSTR("DAV:"), CFSTR("multistatus"));
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
  v8.super_class = (Class)CoreDAVMultiStatusItem;
  -[CoreDAVItem description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("[%@]"), v4);

  -[CoreDAVMultiStatusItem orderedResponses](self, "orderedResponses");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("\n  Number of responses: [%lu]"), objc_msgSend(v5, "count"));

  -[CoreDAVMultiStatusItem responseDescription](self, "responseDescription");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("\n  Response description: [%@]"), v6);

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
    +[CoreDAVParseRule ruleWithMinimumNumber:maximumNumber:nameSpace:elementName:objectClass:setterMethod:](CoreDAVParseRule, "ruleWithMinimumNumber:maximumNumber:nameSpace:elementName:objectClass:setterMethod:", 0, 0x7FFFFFFFLL, CFSTR("DAV:"), CFSTR("response"), objc_opt_class(), sel_addResponse_);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@:%@"), CFSTR("DAV:"), CFSTR("response"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    +[CoreDAVParseRule ruleWithMinimumNumber:maximumNumber:nameSpace:elementName:objectClass:setterMethod:](CoreDAVParseRule, "ruleWithMinimumNumber:maximumNumber:nameSpace:elementName:objectClass:setterMethod:", 0, 1, CFSTR("DAV:"), CFSTR("responsedescription"), objc_opt_class(), sel_setResponseDescription_);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@:%@"), CFSTR("DAV:"), CFSTR("responsedescription"));
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

- (void)addResponse:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;

  v4 = a3;
  -[CoreDAVMultiStatusItem orderedResponses](self, "orderedResponses");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    v6 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
    -[CoreDAVMultiStatusItem setOrderedResponses:](self, "setOrderedResponses:", v6);

  }
  -[CoreDAVMultiStatusItem orderedResponses](self, "orderedResponses");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addObject:", v4);

}

- (NSSet)responses
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x24BDBCF20];
  -[CoreDAVMultiStatusItem orderedResponses](self, "orderedResponses");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setWithArray:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSSet *)v4;
}

- (NSMutableArray)orderedResponses
{
  return self->_orderedResponses;
}

- (void)setOrderedResponses:(id)a3
{
  objc_storeStrong((id *)&self->_orderedResponses, a3);
}

- (CoreDAVLeafItem)responseDescription
{
  return self->_responseDescription;
}

- (void)setResponseDescription:(id)a3
{
  objc_storeStrong((id *)&self->_responseDescription, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_responseDescription, 0);
  objc_storeStrong((id *)&self->_orderedResponses, 0);
}

@end
