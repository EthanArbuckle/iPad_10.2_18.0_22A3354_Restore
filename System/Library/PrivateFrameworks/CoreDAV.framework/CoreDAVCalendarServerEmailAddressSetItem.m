@implementation CoreDAVCalendarServerEmailAddressSetItem

- (CoreDAVCalendarServerEmailAddressSetItem)init
{
  return -[CoreDAVItem initWithNameSpace:andName:](self, "initWithNameSpace:andName:", CFSTR("http://calendarserver.org/ns/"), CFSTR("email-address-set"));
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
  v8.super_class = (Class)CoreDAVCalendarServerEmailAddressSetItem;
  -[CoreDAVItem description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("[%@]"), v4);

  -[CoreDAVCalendarServerEmailAddressSetItem emailAddresses](self, "emailAddresses");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("\n  Number of email addresses: [%lu]"), objc_msgSend(v5, "count"));

  -[CoreDAVCalendarServerEmailAddressSetItem unauthenticated](self, "unauthenticated");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("\n  Unauthenticated: [%@]"), v6);

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
    +[CoreDAVParseRule ruleWithMinimumNumber:maximumNumber:nameSpace:elementName:objectClass:setterMethod:](CoreDAVParseRule, "ruleWithMinimumNumber:maximumNumber:nameSpace:elementName:objectClass:setterMethod:", 0, 0x7FFFFFFFLL, CFSTR("http://calendarserver.org/ns/"), CFSTR("email-address"), objc_opt_class(), sel_addEmailAddress_);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@:%@"), CFSTR("http://calendarserver.org/ns/"), CFSTR("email-address"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    +[CoreDAVParseRule ruleWithMinimumNumber:maximumNumber:nameSpace:elementName:objectClass:setterMethod:](CoreDAVParseRule, "ruleWithMinimumNumber:maximumNumber:nameSpace:elementName:objectClass:setterMethod:", 0, 1, CFSTR("DAV:"), CFSTR("unauthenticated"), objc_opt_class(), sel_setUnauthenticated_);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@:%@"), CFSTR("DAV:"), CFSTR("unauthenticated"));
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

- (void)addEmailAddress:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;

  v4 = a3;
  -[CoreDAVCalendarServerEmailAddressSetItem emailAddresses](self, "emailAddresses");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    v6 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
    -[CoreDAVCalendarServerEmailAddressSetItem setEmailAddresses:](self, "setEmailAddresses:", v6);

  }
  -[CoreDAVCalendarServerEmailAddressSetItem emailAddresses](self, "emailAddresses");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addObject:", v4);

}

- (NSMutableArray)emailAddresses
{
  return self->_emailAddresses;
}

- (void)setEmailAddresses:(id)a3
{
  objc_storeStrong((id *)&self->_emailAddresses, a3);
}

- (CoreDAVItemWithNoChildren)unauthenticated
{
  return self->_unauthenticated;
}

- (void)setUnauthenticated:(id)a3
{
  objc_storeStrong((id *)&self->_unauthenticated, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_unauthenticated, 0);
  objc_storeStrong((id *)&self->_emailAddresses, 0);
}

@end
