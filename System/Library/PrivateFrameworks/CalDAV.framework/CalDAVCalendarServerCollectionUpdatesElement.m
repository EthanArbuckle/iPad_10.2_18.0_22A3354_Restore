@implementation CalDAVCalendarServerCollectionUpdatesElement

- (void)setPublish:(id)a3
{
  self->_state = 2;
}

- (void)setUnpublish:(id)a3
{
  self->_state = 1;
}

- (id)copyParseRules
{
  id v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v11;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)CalDAVCalendarServerCollectionUpdatesElement;
  v2 = -[CalDAVCalendarServerResourceChangeElement copyParseRules](&v12, sel_copyParseRules);
  v3 = (void *)objc_msgSend(v2, "mutableCopy");
  v11 = objc_alloc(MEMORY[0x24BDBCE70]);
  v4 = *MEMORY[0x24BE1ADC8];
  objc_msgSend(MEMORY[0x24BE1AB88], "ruleWithMinimumNumber:maximumNumber:nameSpace:elementName:objectClass:setterMethod:", 0, 1, *MEMORY[0x24BE1ADC8], CFSTR("collection-publish"), objc_opt_class(), sel_setPublish_);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@:%@"), v4, CFSTR("collection-publish"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BE1AB88], "ruleWithMinimumNumber:maximumNumber:nameSpace:elementName:objectClass:setterMethod:", 0, 1, v4, CFSTR("collection-unpublish"), objc_opt_class(), sel_setUnpublish_);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@:%@"), v4, CFSTR("collection-unpublish"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v11, "initWithObjectsAndKeys:", v5, v6, v7, v8, 0);

  objc_msgSend(v3, "addEntriesFromDictionary:", v9);
  return v3;
}

- (int)state
{
  return self->_state;
}

@end
