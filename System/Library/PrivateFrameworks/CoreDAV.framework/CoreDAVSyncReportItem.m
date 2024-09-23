@implementation CoreDAVSyncReportItem

- (id)description
{
  id v3;
  void *v4;
  void *v5;
  objc_super v7;

  v3 = objc_alloc_init(MEMORY[0x24BDD16A8]);
  v7.receiver = self;
  v7.super_class = (Class)CoreDAVSyncReportItem;
  -[CoreDAVMultiStatusItem description](&v7, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("[%@]"), v4);

  -[CoreDAVSyncReportItem syncToken](self, "syncToken");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("\n  Sync token: [%@]"), v5);

  return v3;
}

+ (id)copyParseRules
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  objc_super v14;

  +[CoreDAVItem parseRuleCache](CoreDAVItem, "parseRuleCache");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromClass((Class)a1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKey:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    v14.receiver = a1;
    v14.super_class = (Class)&OBJC_METACLASS___CoreDAVSyncReportItem;
    v6 = objc_msgSendSuper2(&v14, sel_copyParseRules);
    v5 = (void *)objc_msgSend(v6, "mutableCopy");
    v7 = objc_alloc(MEMORY[0x24BDBCE70]);
    +[CoreDAVParseRule ruleWithMinimumNumber:maximumNumber:nameSpace:elementName:objectClass:setterMethod:](CoreDAVParseRule, "ruleWithMinimumNumber:maximumNumber:nameSpace:elementName:objectClass:setterMethod:", 0, 1, CFSTR("DAV:"), CFSTR("sync-token"), objc_opt_class(), sel__setSyncTokenItem_);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@:%@"), CFSTR("DAV:"), CFSTR("sync-token"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)objc_msgSend(v7, "initWithObjectsAndKeys:", v8, v9, 0);

    objc_msgSend(v5, "setValuesForKeysWithDictionary:", v10);
    +[CoreDAVItem parseRuleCache](CoreDAVItem, "parseRuleCache");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromClass((Class)a1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setObject:forKey:", v5, v12);

  }
  return v5;
}

- (void)_setSyncTokenItem:(id)a3
{
  NSString *v4;
  NSString *syncToken;

  objc_msgSend(a3, "payloadAsString");
  v4 = (NSString *)objc_claimAutoreleasedReturnValue();
  syncToken = self->_syncToken;
  self->_syncToken = v4;

}

- (NSString)syncToken
{
  return self->_syncToken;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_syncToken, 0);
}

@end
