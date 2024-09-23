@implementation CalDAVCalendarServerCollectionChangesElement

- (CalDAVCalendarServerCollectionChangesElement)init
{
  return -[CoreDAVItem initWithNameSpace:andName:](self, "initWithNameSpace:andName:", *MEMORY[0x24BE1ADC8], CFSTR("collection-changes"));
}

- (void)setCreatedItem:(id)a3
{
  id v4;

  objc_msgSend(a3, "payloadAsString");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[CalDAVCalendarServerCollectionChangesElement setCreated:](self, "setCreated:", objc_msgSend(v4, "integerValue"));

}

- (void)setUpdatedItem:(id)a3
{
  id v4;

  objc_msgSend(a3, "payloadAsString");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[CalDAVCalendarServerCollectionChangesElement setUpdated:](self, "setUpdated:", objc_msgSend(v4, "integerValue"));

}

- (void)setDeletedItem:(id)a3
{
  id v4;

  objc_msgSend(a3, "payloadAsString");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[CalDAVCalendarServerCollectionChangesElement setDeleted:](self, "setDeleted:", objc_msgSend(v4, "integerValue"));

}

- (id)copyParseRules
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v11;
  void *v12;
  id v13;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)CalDAVCalendarServerCollectionChangesElement;
  v13 = -[CalDAVCalendarServerResourceChangeElement copyParseRules](&v14, sel_copyParseRules);
  v12 = (void *)objc_msgSend(v13, "mutableCopy");
  v11 = objc_alloc(MEMORY[0x24BDBCE70]);
  v2 = *MEMORY[0x24BE1ADC8];
  objc_msgSend(MEMORY[0x24BE1AB88], "ruleWithMinimumNumber:maximumNumber:nameSpace:elementName:objectClass:setterMethod:", 0, 1, *MEMORY[0x24BE1ADC8], CFSTR("child-created"), objc_opt_class(), sel_setCreatedItem_);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@:%@"), v2, CFSTR("child-created"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BE1AB88], "ruleWithMinimumNumber:maximumNumber:nameSpace:elementName:objectClass:setterMethod:", 0, 1, v2, CFSTR("child-updated"), objc_opt_class(), sel_setUpdatedItem_);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@:%@"), v2, CFSTR("child-updated"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BE1AB88], "ruleWithMinimumNumber:maximumNumber:nameSpace:elementName:objectClass:setterMethod:", 0, 1, v2, CFSTR("child-deleted"), objc_opt_class(), sel_setDeletedItem_);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@:%@"), v2, CFSTR("child-deleted"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v11, "initWithObjectsAndKeys:", v3, v4, v5, v6, v7, v8, 0);

  objc_msgSend(v12, "addEntriesFromDictionary:", v9);
  return v12;
}

- (int64_t)created
{
  return self->_created;
}

- (void)setCreated:(int64_t)a3
{
  self->_created = a3;
}

- (int64_t)updated
{
  return self->_updated;
}

- (void)setUpdated:(int64_t)a3
{
  self->_updated = a3;
}

- (int64_t)deleted
{
  return self->_deleted;
}

- (void)setDeleted:(int64_t)a3
{
  self->_deleted = a3;
}

@end
