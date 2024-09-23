@implementation CoreDAVPrincipalItem

- (CoreDAVPrincipalItem)init
{
  return -[CoreDAVItem initWithNameSpace:andName:](self, "initWithNameSpace:andName:", CFSTR("DAV:"), CFSTR("principal"));
}

- (id)initTypeIsAll
{
  CoreDAVPrincipalItem *v2;
  CoreDAVItemWithNoChildren *v3;

  v2 = -[CoreDAVPrincipalItem init](self, "init");
  if (v2)
  {
    v3 = -[CoreDAVItem initWithNameSpace:andName:]([CoreDAVItemWithNoChildren alloc], "initWithNameSpace:andName:", CFSTR("DAV:"), CFSTR("all"));
    -[CoreDAVPrincipalItem setAll:](v2, "setAll:", v3);

  }
  return v2;
}

- (id)initTypeIsHREFWithURL:(id)a3
{
  id v4;
  CoreDAVPrincipalItem *v5;
  CoreDAVHrefItem *v6;

  v4 = a3;
  v5 = -[CoreDAVPrincipalItem init](self, "init");
  if (v5)
  {
    v6 = -[CoreDAVHrefItem initWithURL:]([CoreDAVHrefItem alloc], "initWithURL:", v4);
    -[CoreDAVPrincipalItem setHref:](v5, "setHref:", v6);

  }
  return v5;
}

- (id)initTypeIsProperty:(id)a3
{
  id v4;
  CoreDAVPrincipalItem *v5;
  CoreDAVPrincipalItem *v6;

  v4 = a3;
  v5 = -[CoreDAVPrincipalItem init](self, "init");
  v6 = v5;
  if (v5)
    -[CoreDAVPrincipalItem setProperty:](v5, "setProperty:", v4);

  return v6;
}

- (id)initTypeIsAuthenticated
{
  CoreDAVPrincipalItem *v2;
  CoreDAVItemWithNoChildren *v3;

  v2 = -[CoreDAVPrincipalItem init](self, "init");
  if (v2)
  {
    v3 = -[CoreDAVItem initWithNameSpace:andName:]([CoreDAVItemWithNoChildren alloc], "initWithNameSpace:andName:", CFSTR("DAV:"), CFSTR("authenticated"));
    -[CoreDAVPrincipalItem setAuthenticated:](v2, "setAuthenticated:", v3);

  }
  return v2;
}

- (id)initTypeIsUnauthenticated
{
  CoreDAVPrincipalItem *v2;
  CoreDAVItemWithNoChildren *v3;

  v2 = -[CoreDAVPrincipalItem init](self, "init");
  if (v2)
  {
    v3 = -[CoreDAVItem initWithNameSpace:andName:]([CoreDAVItemWithNoChildren alloc], "initWithNameSpace:andName:", CFSTR("DAV:"), CFSTR("unauthenticated"));
    -[CoreDAVPrincipalItem setUnauthenticated:](v2, "setUnauthenticated:", v3);

  }
  return v2;
}

- (id)initTypeIsSelf
{
  CoreDAVPrincipalItem *v2;
  CoreDAVItemWithNoChildren *v3;

  v2 = -[CoreDAVPrincipalItem init](self, "init");
  if (v2)
  {
    v3 = -[CoreDAVItem initWithNameSpace:andName:]([CoreDAVItemWithNoChildren alloc], "initWithNameSpace:andName:", CFSTR("DAV:"), CFSTR("self"));
    -[CoreDAVPrincipalItem setSelfItem:](v2, "setSelfItem:", v3);

  }
  return v2;
}

- (id)description
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  objc_super v12;

  v3 = objc_alloc_init(MEMORY[0x24BDD16A8]);
  v12.receiver = self;
  v12.super_class = (Class)CoreDAVPrincipalItem;
  -[CoreDAVItem description](&v12, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("[%@]"), v4);

  -[CoreDAVPrincipalItem href](self, "href");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("\n  HREF: [%@]"), v5);

  -[CoreDAVPrincipalItem all](self, "all");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("\n  All: [%@]"), v6);

  -[CoreDAVPrincipalItem authenticated](self, "authenticated");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("\n  Authenticated: [%@]"), v7);

  -[CoreDAVPrincipalItem unauthenticated](self, "unauthenticated");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("\n  Unauthenticated: [%@]"), v8);

  -[CoreDAVPrincipalItem property](self, "property");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("\n  Property: [%@]"), v9);

  -[CoreDAVPrincipalItem selfItem](self, "selfItem");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("\n  Self: [%@]"), v10);

  return v3;
}

- (void)write:(id)a3
{
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
  void *v14;
  void *v15;
  id v16;

  v16 = a3;
  -[CoreDAVItem name](self, "name");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[CoreDAVItem nameSpace](self, "nameSpace");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "startElement:inNamespace:withAttributeNamesAndValues:", v4, v5, 0);

  -[CoreDAVPrincipalItem href](self, "href");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[CoreDAVPrincipalItem href](self, "href");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_13:
    v13 = v7;
    objc_msgSend(v7, "write:", v16);

    goto LABEL_14;
  }
  -[CoreDAVPrincipalItem all](self, "all");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[CoreDAVPrincipalItem all](self, "all");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_13;
  }
  -[CoreDAVPrincipalItem authenticated](self, "authenticated");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    -[CoreDAVPrincipalItem authenticated](self, "authenticated");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_13;
  }
  -[CoreDAVPrincipalItem unauthenticated](self, "unauthenticated");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    -[CoreDAVPrincipalItem unauthenticated](self, "unauthenticated");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_13;
  }
  -[CoreDAVPrincipalItem property](self, "property");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    -[CoreDAVPrincipalItem property](self, "property");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_13;
  }
  -[CoreDAVPrincipalItem selfItem](self, "selfItem");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    -[CoreDAVPrincipalItem selfItem](self, "selfItem");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_13;
  }
LABEL_14:
  -[CoreDAVItem name](self, "name");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[CoreDAVItem nameSpace](self, "nameSpace");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "endElement:inNamespace:", v14, v15);

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
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;

  +[CoreDAVItem parseRuleCache](CoreDAVItem, "parseRuleCache");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromClass((Class)a1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKey:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    v20 = objc_alloc(MEMORY[0x24BDBCE70]);
    +[CoreDAVParseRule ruleWithMinimumNumber:maximumNumber:nameSpace:elementName:objectClass:setterMethod:](CoreDAVParseRule, "ruleWithMinimumNumber:maximumNumber:nameSpace:elementName:objectClass:setterMethod:", 0, 1, CFSTR("DAV:"), CFSTR("href"), objc_opt_class(), sel_setHref_);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@:%@"), CFSTR("DAV:"), CFSTR("href"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    +[CoreDAVParseRule ruleWithMinimumNumber:maximumNumber:nameSpace:elementName:objectClass:setterMethod:](CoreDAVParseRule, "ruleWithMinimumNumber:maximumNumber:nameSpace:elementName:objectClass:setterMethod:", 0, 1, CFSTR("DAV:"), CFSTR("all"), objc_opt_class(), sel_setAll_);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@:%@"), CFSTR("DAV:"), CFSTR("all"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    +[CoreDAVParseRule ruleWithMinimumNumber:maximumNumber:nameSpace:elementName:objectClass:setterMethod:](CoreDAVParseRule, "ruleWithMinimumNumber:maximumNumber:nameSpace:elementName:objectClass:setterMethod:", 0, 1, CFSTR("DAV:"), CFSTR("authenticated"), objc_opt_class(), sel_setAuthenticated_);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@:%@"), CFSTR("DAV:"), CFSTR("authenticated"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    +[CoreDAVParseRule ruleWithMinimumNumber:maximumNumber:nameSpace:elementName:objectClass:setterMethod:](CoreDAVParseRule, "ruleWithMinimumNumber:maximumNumber:nameSpace:elementName:objectClass:setterMethod:", 0, 1, CFSTR("DAV:"), CFSTR("unauthenticated"), objc_opt_class(), sel_setUnauthenticated_);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@:%@"), CFSTR("DAV:"), CFSTR("unauthenticated"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    +[CoreDAVParseRule ruleWithMinimumNumber:maximumNumber:nameSpace:elementName:objectClass:setterMethod:](CoreDAVParseRule, "ruleWithMinimumNumber:maximumNumber:nameSpace:elementName:objectClass:setterMethod:", 0, 1, CFSTR("DAV:"), CFSTR("property"), objc_opt_class(), sel_setProperty_);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@:%@"), CFSTR("DAV:"), CFSTR("property"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    +[CoreDAVParseRule ruleWithMinimumNumber:maximumNumber:nameSpace:elementName:objectClass:setterMethod:](CoreDAVParseRule, "ruleWithMinimumNumber:maximumNumber:nameSpace:elementName:objectClass:setterMethod:", 0, 1, CFSTR("DAV:"), CFSTR("self"), objc_opt_class(), sel_setSelfItem_);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@:%@"), CFSTR("DAV:"), CFSTR("self"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (void *)objc_msgSend(v20, "initWithObjectsAndKeys:", v21, v19, v18, v17, v16, v15, v14, v6, v13, v7, v8, v9, 0);

    +[CoreDAVItem parseRuleCache](CoreDAVItem, "parseRuleCache");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromClass((Class)a1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setObject:forKey:", v5, v11);

  }
  return v5;
}

- (id)hashString
{
  const __CFString *v3;
  void *v4;
  const __CFString *v5;
  void *v6;
  const __CFString *v7;
  void *v8;
  void *v9;
  void *v10;
  const __CFString *v11;
  void *v12;
  void *v14;
  void *v15;
  void *v16;
  void *v17;

  v15 = (void *)MEMORY[0x24BDD17C8];
  -[CoreDAVPrincipalItem href](self, "href");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "payloadAsString");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[CoreDAVPrincipalItem all](self, "all");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (v16)
    v3 = CFSTR("YES");
  else
    v3 = CFSTR("NO");
  -[CoreDAVPrincipalItem authenticated](self, "authenticated");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
    v5 = CFSTR("YES");
  else
    v5 = CFSTR("NO");
  -[CoreDAVPrincipalItem unauthenticated](self, "unauthenticated");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
    v7 = CFSTR("YES");
  else
    v7 = CFSTR("NO");
  -[CoreDAVPrincipalItem property](self, "property");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "hashString");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[CoreDAVPrincipalItem selfItem](self, "selfItem");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
    v11 = CFSTR("YES");
  else
    v11 = CFSTR("NO");
  objc_msgSend(v15, "stringWithFormat:", CFSTR("href: [%@], isAll: [%@], isAuthenticated: [%@], isUnauthenticated: [%@], property: [%@], isSelf: [%@]"), v14, v3, v5, v7, v9, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (CoreDAVHrefItem)href
{
  return self->_href;
}

- (void)setHref:(id)a3
{
  objc_storeStrong((id *)&self->_href, a3);
}

- (CoreDAVItemWithNoChildren)all
{
  return self->_all;
}

- (void)setAll:(id)a3
{
  objc_storeStrong((id *)&self->_all, a3);
}

- (CoreDAVItemWithNoChildren)authenticated
{
  return self->_authenticated;
}

- (void)setAuthenticated:(id)a3
{
  objc_storeStrong((id *)&self->_authenticated, a3);
}

- (CoreDAVItemWithNoChildren)unauthenticated
{
  return self->_unauthenticated;
}

- (void)setUnauthenticated:(id)a3
{
  objc_storeStrong((id *)&self->_unauthenticated, a3);
}

- (CoreDAVItem)property
{
  return self->_property;
}

- (void)setProperty:(id)a3
{
  objc_storeStrong((id *)&self->_property, a3);
}

- (CoreDAVItemWithNoChildren)selfItem
{
  return self->_selfItem;
}

- (void)setSelfItem:(id)a3
{
  objc_storeStrong((id *)&self->_selfItem, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_selfItem, 0);
  objc_storeStrong((id *)&self->_property, 0);
  objc_storeStrong((id *)&self->_unauthenticated, 0);
  objc_storeStrong((id *)&self->_authenticated, 0);
  objc_storeStrong((id *)&self->_all, 0);
  objc_storeStrong((id *)&self->_href, 0);
}

@end
