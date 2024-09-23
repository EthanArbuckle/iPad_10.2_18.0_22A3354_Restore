@implementation CoreDAVICloudQuotaItem

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
  v12.super_class = (Class)CoreDAVICloudQuotaItem;
  -[CoreDAVItem description](&v12, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("[%@]"), v4);

  -[CoreDAVICloudQuotaItem resourceBytes](self, "resourceBytes");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "payloadAsString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("\n  ResourceBytes: [%@]"), v6);

  -[CoreDAVICloudQuotaItem resourceCount](self, "resourceCount");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "payloadAsString");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("\n  ResourceCount: [%@]"), v8);

  -[CoreDAVICloudQuotaItem otherBytes](self, "otherBytes");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "payloadAsString");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("\n  OtherBytes: [%@]"), v10);

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
  id v15;

  +[CoreDAVItem parseRuleCache](CoreDAVItem, "parseRuleCache");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromClass((Class)a1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKey:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    v15 = objc_alloc(MEMORY[0x24BDBCE70]);
    +[CoreDAVParseRule ruleWithMinimumNumber:maximumNumber:nameSpace:elementName:objectClass:setterMethod:](CoreDAVParseRule, "ruleWithMinimumNumber:maximumNumber:nameSpace:elementName:objectClass:setterMethod:", 1, 1, CFSTR("urn:mobileme:davservices"), CFSTR("resource-bytes"), objc_opt_class(), sel_setResourceBytes_);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@:%@"), CFSTR("urn:mobileme:davservices"), CFSTR("resource-bytes"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    +[CoreDAVParseRule ruleWithMinimumNumber:maximumNumber:nameSpace:elementName:objectClass:setterMethod:](CoreDAVParseRule, "ruleWithMinimumNumber:maximumNumber:nameSpace:elementName:objectClass:setterMethod:", 1, 1, CFSTR("urn:mobileme:davservices"), CFSTR("resource-count"), objc_opt_class(), sel_setResourceCount_);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@:%@"), CFSTR("urn:mobileme:davservices"), CFSTR("resource-count"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    +[CoreDAVParseRule ruleWithMinimumNumber:maximumNumber:nameSpace:elementName:objectClass:setterMethod:](CoreDAVParseRule, "ruleWithMinimumNumber:maximumNumber:nameSpace:elementName:objectClass:setterMethod:", 1, 1, CFSTR("urn:mobileme:davservices"), CFSTR("other-bytes"), objc_opt_class(), sel_setOtherBytes_);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@:%@"), CFSTR("urn:mobileme:davservices"), CFSTR("other-bytes"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (void *)objc_msgSend(v15, "initWithObjectsAndKeys:", v6, v7, v8, v9, v10, v11, 0);

    +[CoreDAVItem parseRuleCache](CoreDAVItem, "parseRuleCache");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromClass((Class)a1);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setObject:forKey:", v5, v13);

  }
  return v5;
}

- (CoreDAVLeafItem)resourceBytes
{
  return self->_resourceBytes;
}

- (void)setResourceBytes:(id)a3
{
  objc_storeStrong((id *)&self->_resourceBytes, a3);
}

- (CoreDAVLeafItem)resourceCount
{
  return self->_resourceCount;
}

- (void)setResourceCount:(id)a3
{
  objc_storeStrong((id *)&self->_resourceCount, a3);
}

- (CoreDAVLeafItem)otherBytes
{
  return self->_otherBytes;
}

- (void)setOtherBytes:(id)a3
{
  objc_storeStrong((id *)&self->_otherBytes, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_otherBytes, 0);
  objc_storeStrong((id *)&self->_resourceCount, 0);
  objc_storeStrong((id *)&self->_resourceBytes, 0);
}

@end
