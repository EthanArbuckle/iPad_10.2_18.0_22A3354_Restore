@implementation CalDAVCalendarServerAllowedSharingModesItem

- (CalDAVCalendarServerAllowedSharingModesItem)init
{
  return -[CoreDAVItem initWithNameSpace:andName:](self, "initWithNameSpace:andName:", *MEMORY[0x24BE1ADC8], *MEMORY[0x24BE1AD38]);
}

- (id)copyParseRules
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v16;
  id v17;

  v17 = objc_alloc(MEMORY[0x24BDBCE70]);
  v2 = *MEMORY[0x24BE1ADC8];
  v3 = *MEMORY[0x24BE1AD40];
  objc_msgSend(MEMORY[0x24BE1AB88], "ruleWithMinimumNumber:maximumNumber:nameSpace:elementName:objectClass:setterMethod:", 0, 1, *MEMORY[0x24BE1ADC8], *MEMORY[0x24BE1AD40], objc_opt_class(), sel_setCanBePublished_);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@:%@"), v2, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = *MEMORY[0x24BE1AD48];
  objc_msgSend(MEMORY[0x24BE1AB88], "ruleWithMinimumNumber:maximumNumber:nameSpace:elementName:objectClass:setterMethod:", 0, 1, v2, *MEMORY[0x24BE1AD48], objc_opt_class(), sel_setCanBeShared_);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@:%@"), v2, v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = *MEMORY[0x24BE1AE88];
  objc_msgSend(MEMORY[0x24BE1AB88], "ruleWithMinimumNumber:maximumNumber:nameSpace:elementName:objectClass:setterMethod:", 0, 1, v2, *MEMORY[0x24BE1AE88], objc_opt_class(), sel_setIsMarkedUndeletable_);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@:%@"), v2, v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = *MEMORY[0x24BE1AE80];
  objc_msgSend(MEMORY[0x24BE1AB88], "ruleWithMinimumNumber:maximumNumber:nameSpace:elementName:objectClass:setterMethod:", 0, 1, v2, *MEMORY[0x24BE1AE80], objc_opt_class(), sel_setIsMarkedImmutableSharees_);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@:%@"), v2, v11);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)objc_msgSend(v17, "initWithObjectsAndKeys:", v16, v4, v6, v7, v9, v10, v12, v13, 0);

  return v14;
}

- (CoreDAVItemWithNoChildren)canBePublished
{
  return self->_canBePublished;
}

- (void)setCanBePublished:(id)a3
{
  objc_storeStrong((id *)&self->_canBePublished, a3);
}

- (CoreDAVItemWithNoChildren)canBeShared
{
  return self->_canBeShared;
}

- (void)setCanBeShared:(id)a3
{
  objc_storeStrong((id *)&self->_canBeShared, a3);
}

- (CoreDAVItemWithNoChildren)isMarkedUndeletable
{
  return self->_isMarkedUndeletable;
}

- (void)setIsMarkedUndeletable:(id)a3
{
  objc_storeStrong((id *)&self->_isMarkedUndeletable, a3);
}

- (CoreDAVItemWithNoChildren)isMarkedImmutableSharees
{
  return self->_isMarkedImmutableSharees;
}

- (void)setIsMarkedImmutableSharees:(id)a3
{
  objc_storeStrong((id *)&self->_isMarkedImmutableSharees, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_isMarkedImmutableSharees, 0);
  objc_storeStrong((id *)&self->_isMarkedUndeletable, 0);
  objc_storeStrong((id *)&self->_canBeShared, 0);
  objc_storeStrong((id *)&self->_canBePublished, 0);
}

@end
