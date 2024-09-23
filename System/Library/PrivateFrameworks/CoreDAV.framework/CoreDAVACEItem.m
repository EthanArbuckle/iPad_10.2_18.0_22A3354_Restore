@implementation CoreDAVACEItem

- (CoreDAVACEItem)init
{
  return -[CoreDAVItem initWithNameSpace:andName:](self, "initWithNameSpace:andName:", CFSTR("DAV:"), CFSTR("ace"));
}

- (CoreDAVACEItem)initWithPrincipal:(id)a3 shouldInvert:(BOOL)a4 action:(int)a5 withPrivileges:(id)a6
{
  _BOOL4 v8;
  id v11;
  id v12;
  CoreDAVACEItem *v13;
  CoreDAVACEItem *v14;
  CoreDAVInvertItem *v15;
  CoreDAVInvertItem *invert;
  CoreDAVDenyItem *v17;
  uint64_t v18;
  id *v19;
  void *v20;
  void *v21;

  v8 = a4;
  v11 = a3;
  v12 = a6;
  v13 = -[CoreDAVACEItem init](self, "init");
  v14 = v13;
  if (v13)
  {
    if (v8)
    {
      v15 = -[CoreDAVItem initWithNameSpace:andName:]([CoreDAVInvertItem alloc], "initWithNameSpace:andName:", CFSTR("DAV:"), CFSTR("invert"));
      invert = v14->_invert;
      v14->_invert = v15;

      -[CoreDAVInvertItem setPrincipal:](v14->_invert, "setPrincipal:", v11);
    }
    else
    {
      objc_storeStrong((id *)&v13->_principal, a3);
    }
    if (a5 == 1)
    {
      v17 = -[CoreDAVItem initWithNameSpace:andName:]([CoreDAVDenyItem alloc], "initWithNameSpace:andName:", CFSTR("DAV:"), CFSTR("deny"));
      v18 = 80;
      goto LABEL_9;
    }
    if (!a5)
    {
      v17 = -[CoreDAVItem initWithNameSpace:andName:]([CoreDAVGrantItem alloc], "initWithNameSpace:andName:", CFSTR("DAV:"), CFSTR("grant"));
      v18 = 72;
LABEL_9:
      v19 = (id *)((char *)&v14->super.super.isa + v18);
      v20 = *(Class *)((char *)&v14->super.super.isa + v18);
      *v19 = v17;

      v21 = (void *)objc_msgSend(v12, "mutableCopy");
      objc_msgSend(*v19, "setPrivileges:", v21);

    }
  }

  return v14;
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
  v12.super_class = (Class)CoreDAVACEItem;
  -[CoreDAVItem description](&v12, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("[%@]"), v4);

  -[CoreDAVACEItem principal](self, "principal");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("\n  Principal: [%@]"), v5);

  -[CoreDAVACEItem invert](self, "invert");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("\n  Invert: [%@]"), v6);

  -[CoreDAVACEItem grant](self, "grant");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("\n  Grant: [%@]"), v7);

  -[CoreDAVACEItem deny](self, "deny");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("\n  Deny: [%@]"), v8);

  -[CoreDAVACEItem protectedItem](self, "protectedItem");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("\n  Protected: [%@]"), v9);

  -[CoreDAVACEItem inherited](self, "inherited");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("\n  Inherited: [%@]"), v10);

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
  id v12;

  v12 = a3;
  -[CoreDAVItem name](self, "name");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[CoreDAVItem nameSpace](self, "nameSpace");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "startElement:inNamespace:withAttributeNamesAndValues:", v4, v5, 0);

  -[CoreDAVACEItem invert](self, "invert");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
    -[CoreDAVACEItem invert](self, "invert");
  else
    -[CoreDAVACEItem principal](self, "principal");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "write:", v12);

  -[CoreDAVACEItem grant](self, "grant");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
    -[CoreDAVACEItem grant](self, "grant");
  else
    -[CoreDAVACEItem deny](self, "deny");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "write:", v12);

  -[CoreDAVItem name](self, "name");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[CoreDAVItem nameSpace](self, "nameSpace");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "endElement:inNamespace:", v10, v11);

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
    +[CoreDAVParseRule ruleWithMinimumNumber:maximumNumber:nameSpace:elementName:objectClass:setterMethod:](CoreDAVParseRule, "ruleWithMinimumNumber:maximumNumber:nameSpace:elementName:objectClass:setterMethod:", 0, 1, CFSTR("DAV:"), CFSTR("principal"), objc_opt_class(), sel_setPrincipal_);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@:%@"), CFSTR("DAV:"), CFSTR("principal"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    +[CoreDAVParseRule ruleWithMinimumNumber:maximumNumber:nameSpace:elementName:objectClass:setterMethod:](CoreDAVParseRule, "ruleWithMinimumNumber:maximumNumber:nameSpace:elementName:objectClass:setterMethod:", 0, 1, CFSTR("DAV:"), CFSTR("invert"), objc_opt_class(), sel_setInvert_);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@:%@"), CFSTR("DAV:"), CFSTR("invert"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    +[CoreDAVParseRule ruleWithMinimumNumber:maximumNumber:nameSpace:elementName:objectClass:setterMethod:](CoreDAVParseRule, "ruleWithMinimumNumber:maximumNumber:nameSpace:elementName:objectClass:setterMethod:", 0, 1, CFSTR("DAV:"), CFSTR("grant"), objc_opt_class(), sel_setGrant_);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@:%@"), CFSTR("DAV:"), CFSTR("grant"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    +[CoreDAVParseRule ruleWithMinimumNumber:maximumNumber:nameSpace:elementName:objectClass:setterMethod:](CoreDAVParseRule, "ruleWithMinimumNumber:maximumNumber:nameSpace:elementName:objectClass:setterMethod:", 0, 1, CFSTR("DAV:"), CFSTR("deny"), objc_opt_class(), sel_setDeny_);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@:%@"), CFSTR("DAV:"), CFSTR("deny"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    +[CoreDAVParseRule ruleWithMinimumNumber:maximumNumber:nameSpace:elementName:objectClass:setterMethod:](CoreDAVParseRule, "ruleWithMinimumNumber:maximumNumber:nameSpace:elementName:objectClass:setterMethod:", 0, 1, CFSTR("DAV:"), CFSTR("protected"), objc_opt_class(), sel_setProtectedItem_);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@:%@"), CFSTR("DAV:"), CFSTR("protected"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    +[CoreDAVParseRule ruleWithMinimumNumber:maximumNumber:nameSpace:elementName:objectClass:setterMethod:](CoreDAVParseRule, "ruleWithMinimumNumber:maximumNumber:nameSpace:elementName:objectClass:setterMethod:", 0, 1, CFSTR("DAV:"), CFSTR("inherited"), objc_opt_class(), sel_setInherited_);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@:%@"), CFSTR("DAV:"), CFSTR("inherited"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (void *)objc_msgSend(v20, "initWithObjectsAndKeys:", v21, v19, v18, v15, v17, v16, v14, v6, v13, v7, v8, v9, 0);

    +[CoreDAVItem parseRuleCache](CoreDAVItem, "parseRuleCache");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromClass((Class)a1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setObject:forKey:", v5, v11);

  }
  return v5;
}

+ (id)privilegeItemWithNameSpace:(id)a3 andName:(id)a4
{
  id v5;
  id v6;
  CoreDAVItem *v7;
  void *v8;
  CoreDAVItem *v9;

  v5 = a4;
  v6 = a3;
  v7 = -[CoreDAVItem initWithNameSpace:andName:]([CoreDAVItem alloc], "initWithNameSpace:andName:", CFSTR("DAV:"), CFSTR("privilege"));
  -[CoreDAVItem extraChildItems](v7, "extraChildItems");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[CoreDAVItem initWithNameSpace:andName:]([CoreDAVItem alloc], "initWithNameSpace:andName:", v6, v5);

  objc_msgSend(v8, "addObject:", v9);
  return v7;
}

- (CoreDAVPrincipalItem)principal
{
  return self->_principal;
}

- (void)setPrincipal:(id)a3
{
  objc_storeStrong((id *)&self->_principal, a3);
}

- (CoreDAVInvertItem)invert
{
  return self->_invert;
}

- (void)setInvert:(id)a3
{
  objc_storeStrong((id *)&self->_invert, a3);
}

- (CoreDAVGrantItem)grant
{
  return self->_grant;
}

- (void)setGrant:(id)a3
{
  objc_storeStrong((id *)&self->_grant, a3);
}

- (CoreDAVDenyItem)deny
{
  return self->_deny;
}

- (void)setDeny:(id)a3
{
  objc_storeStrong((id *)&self->_deny, a3);
}

- (CoreDAVItemWithNoChildren)protectedItem
{
  return self->_protectedItem;
}

- (void)setProtectedItem:(id)a3
{
  objc_storeStrong((id *)&self->_protectedItem, a3);
}

- (CoreDAVItemWithHrefChildItem)inherited
{
  return self->_inherited;
}

- (void)setInherited:(id)a3
{
  objc_storeStrong((id *)&self->_inherited, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_inherited, 0);
  objc_storeStrong((id *)&self->_protectedItem, 0);
  objc_storeStrong((id *)&self->_deny, 0);
  objc_storeStrong((id *)&self->_grant, 0);
  objc_storeStrong((id *)&self->_invert, 0);
  objc_storeStrong((id *)&self->_principal, 0);
}

@end
