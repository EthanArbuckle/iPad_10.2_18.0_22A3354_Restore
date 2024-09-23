@implementation CoreDAVPropertySearchItem

- (CoreDAVPropertySearchItem)init
{
  return -[CoreDAVItem initWithNameSpace:andName:](self, "initWithNameSpace:andName:", CFSTR("DAV:"), CFSTR("property-search"));
}

- (CoreDAVPropertySearchItem)initWithSearchPropertyNameSpace:(id)a3 andName:(id)a4
{
  id v6;
  id v7;
  CoreDAVPropertySearchItem *v8;
  CoreDAVLeafItem *v9;
  CoreDAVLeafItem *prop;

  v6 = a3;
  v7 = a4;
  v8 = -[CoreDAVPropertySearchItem init](self, "init");
  if (v8)
  {
    v9 = -[CoreDAVItem initWithNameSpace:andName:]([CoreDAVLeafItem alloc], "initWithNameSpace:andName:", v6, v7);
    prop = v8->_prop;
    v8->_prop = v9;

  }
  return v8;
}

- (id)description
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v9;

  v3 = objc_alloc_init(MEMORY[0x24BDD16A8]);
  v9.receiver = self;
  v9.super_class = (Class)CoreDAVPropertySearchItem;
  -[CoreDAVItem description](&v9, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("[%@]"), v4);

  -[CoreDAVPropertySearchItem prop](self, "prop");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("\n  Prop: [%@]"), v5);

  -[CoreDAVPropertySearchItem match](self, "match");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("\n  Match: [%@]"), v6);

  -[CoreDAVPropertySearchItem matchTypeAttribute](self, "matchTypeAttribute");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("\n  MatchTypeAttribute: [%@]"), v7);

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

  objc_msgSend(v16, "startElement:inNamespace:withAttributeNamesAndValues:", CFSTR("prop"), CFSTR("DAV:"), 0);
  -[CoreDAVPropertySearchItem prop](self, "prop");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "name");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[CoreDAVPropertySearchItem prop](self, "prop");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "nameSpace");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "appendElement:inNamespace:withStringContent:withAttributeNamesAndValues:", v7, v9, 0, 0);

  objc_msgSend(v16, "endElement:inNamespace:", CFSTR("prop"), CFSTR("DAV:"));
  -[CoreDAVPropertySearchItem match](self, "match");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    -[CoreDAVPropertySearchItem matchTypeAttribute](self, "matchTypeAttribute");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    -[CoreDAVPropertySearchItem match](self, "match");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11)
    {
      -[CoreDAVPropertySearchItem matchTypeAttribute](self, "matchTypeAttribute");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "appendElement:inNamespace:withStringContent:withAttributeNamesAndValues:", CFSTR("match"), CFSTR("DAV:"), v12, CFSTR("match-type"), v13, 0);

    }
    else
    {
      objc_msgSend(v16, "appendElement:inNamespace:withStringContent:withAttributeNamesAndValues:", CFSTR("match"), CFSTR("DAV:"), v12, 0);
    }

  }
  -[CoreDAVItem name](self, "name");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[CoreDAVItem nameSpace](self, "nameSpace");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "endElement:inNamespace:", v14, v15);

}

- (CoreDAVLeafItem)prop
{
  return self->_prop;
}

- (void)setProp:(id)a3
{
  objc_storeStrong((id *)&self->_prop, a3);
}

- (NSString)match
{
  return self->_match;
}

- (void)setMatch:(id)a3
{
  objc_storeStrong((id *)&self->_match, a3);
}

- (NSString)matchTypeAttribute
{
  return self->_matchTypeAttribute;
}

- (void)setMatchTypeAttribute:(id)a3
{
  objc_storeStrong((id *)&self->_matchTypeAttribute, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_matchTypeAttribute, 0);
  objc_storeStrong((id *)&self->_match, 0);
  objc_storeStrong((id *)&self->_prop, 0);
}

@end
