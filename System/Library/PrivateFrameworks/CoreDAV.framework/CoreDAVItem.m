@implementation CoreDAVItem

- (CoreDAVItem)init
{
  CDVInheritedInitializerUsageDisallowed();
}

- (CoreDAVItem)initWithNameSpace:(id)a3 andName:(id)a4
{
  id v7;
  id v8;
  CoreDAVItem *v9;
  CoreDAVItem *v10;
  NSMutableSet *v11;
  NSMutableSet *attributes;
  NSMutableArray *v13;
  NSMutableArray *extraChildItems;
  NSData *v15;
  NSData *payload;
  objc_super v18;

  v7 = a3;
  v8 = a4;
  v18.receiver = self;
  v18.super_class = (Class)CoreDAVItem;
  v9 = -[CoreDAVItem init](&v18, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_nameSpace, a3);
    objc_storeStrong((id *)&v10->_name, a4);
    v11 = (NSMutableSet *)objc_alloc_init(MEMORY[0x24BDBCEF0]);
    attributes = v10->_attributes;
    v10->_attributes = v11;

    v13 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    extraChildItems = v10->_extraChildItems;
    v10->_extraChildItems = v13;

    v15 = (NSData *)objc_alloc_init(MEMORY[0x24BDBCEC8]);
    payload = v10->_payload;
    v10->_payload = v15;

  }
  return v10;
}

- (NSString)description
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v3 = objc_alloc_init(MEMORY[0x24BDD16A8]);
  v8.receiver = self;
  v8.super_class = (Class)CoreDAVItem;
  -[CoreDAVItem description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[CoreDAVItem nameSpace](self, "nameSpace");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CoreDAVItem name](self, "name");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("[%@]: %@%@"), v4, v5, v6);

  return (NSString *)v3;
}

- (id)hashString
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  objc_class *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  -[CoreDAVItem extraChildItems](self, "extraChildItems");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "valueForKey:", CFSTR("hashString"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "componentsJoinedByString:", CFSTR(",\n\nNext Child:\n"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v6 = 0;
  }
  else
  {
    -[CoreDAVItem payloadAsString](self, "payloadAsString");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v7 = (void *)MEMORY[0x24BDD17C8];
  v8 = (objc_class *)objc_opt_class();
  NSStringFromClass(v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[CoreDAVItem nameSpace](self, "nameSpace");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[CoreDAVItem name](self, "name");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[CoreDAVItem attributes](self, "attributes");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "stringWithFormat:", CFSTR("[%@], namespace: [%@], name: [%@], payload: [%@], attributes: [%@], children: [%@]"), v9, v10, v11, v6, v12, v5);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

+ (id)copyParseRules
{
  return 0;
}

- (id)copyParseRules
{
  return (id)objc_msgSend((id)objc_opt_class(), "copyParseRules");
}

+ (id)parseRuleCache
{
  if (parseRuleCache_onceToken != -1)
    dispatch_once(&parseRuleCache_onceToken, &__block_literal_global_5);
  return (id)parseRuleCache_retVal;
}

void __29__CoreDAVItem_parseRuleCache__block_invoke()
{
  id v0;
  void *v1;

  v0 = objc_alloc_init(MEMORY[0x24BDBCE40]);
  v1 = (void *)parseRuleCache_retVal;
  parseRuleCache_retVal = (uint64_t)v0;

}

- (void)parserFoundUnrecognizedElement:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[CoreDAVItem extraChildItems](self, "extraChildItems");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObject:", v4);

}

- (void)parserFoundAttributes:(id)a3
{
  id v4;

  v4 = (id)objc_msgSend(a3, "mutableCopy");
  -[CoreDAVItem setAttributes:](self, "setAttributes:", v4);

}

- (void)write:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  _BOOL4 useCDATA;
  void *v16;
  void *v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[CoreDAVItem childrenToWrite](self, "childrenToWrite");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "count"))
  {
    -[CoreDAVItem name](self, "name");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[CoreDAVItem nameSpace](self, "nameSpace");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "startElement:inNamespace:withAttributeNamesAndValues:", v6, v7, 0);

    v20 = 0u;
    v21 = 0u;
    v18 = 0u;
    v19 = 0u;
    v8 = v5;
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v19;
      do
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v19 != v11)
            objc_enumerationMutation(v8);
          objc_msgSend(*(id *)(*((_QWORD *)&v18 + 1) + 8 * i), "write:", v4, (_QWORD)v18);
        }
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
      }
      while (v10);
    }

    -[CoreDAVItem name](self, "name");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[CoreDAVItem nameSpace](self, "nameSpace");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "endElement:inNamespace:", v13, v14);

  }
  else
  {
    useCDATA = self->_useCDATA;
    -[CoreDAVItem name](self, "name");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[CoreDAVItem nameSpace](self, "nameSpace");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[CoreDAVItem payloadAsString](self, "payloadAsString");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (useCDATA)
      objc_msgSend(v4, "appendElement:inNamespace:withStringContentAsCDATA:withAttributeNamesAndValues:", v13, v16, v17, 0);
    else
      objc_msgSend(v4, "appendElement:inNamespace:withStringContent:withAttributeNamesAndValues:", v13, v16, v17, 0);

  }
}

- (BOOL)validate
{
  return 1;
}

- (id)payloadAsString
{
  id v3;
  void *v4;
  void *v5;

  v3 = objc_alloc(MEMORY[0x24BDD17C8]);
  -[CoreDAVItem payload](self, "payload");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithData:encoding:", v4, 4);

  return v5;
}

- (int64_t)payloadAsNSInteger
{
  void *v2;
  void *v3;
  int64_t v4;

  -[CoreDAVItem payloadAsString](self, "payloadAsString");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
    v4 = (int)objc_msgSend(v2, "intValue");
  else
    v4 = 0;

  return v4;
}

- (void)setPayloadAsString:(id)a3
{
  id v4;

  objc_msgSend(a3, "dataUsingEncoding:", 4);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[CoreDAVItem setPayload:](self, "setPayload:", v4);

}

- (id)generateXMLString
{
  CoreDAVXMLData *v3;
  void *v4;
  void *v5;

  v3 = objc_alloc_init(CoreDAVXMLData);
  -[CoreDAVItem write:](self, "write:", v3);
  -[CoreDAVXMLData data](v3, "data");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithData:encoding:", v4, 4);

  return v5;
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

- (NSMutableSet)attributes
{
  return self->_attributes;
}

- (void)setAttributes:(id)a3
{
  objc_storeStrong((id *)&self->_attributes, a3);
}

- (NSMutableArray)extraChildItems
{
  return self->_extraChildItems;
}

- (void)setExtraChildItems:(id)a3
{
  objc_storeStrong((id *)&self->_extraChildItems, a3);
}

- (NSData)payload
{
  return self->_payload;
}

- (void)setPayload:(id)a3
{
  objc_storeStrong((id *)&self->_payload, a3);
}

- (BOOL)useCDATA
{
  return self->_useCDATA;
}

- (void)setUseCDATA:(BOOL)a3
{
  self->_useCDATA = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_payload, 0);
  objc_storeStrong((id *)&self->_extraChildItems, 0);
  objc_storeStrong((id *)&self->_attributes, 0);
  objc_storeStrong((id *)&self->_nameSpace, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

@end
