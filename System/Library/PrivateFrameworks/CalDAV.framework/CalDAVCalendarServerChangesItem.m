@implementation CalDAVCalendarServerChangesItem

- (CalDAVCalendarServerChangesItem)init
{
  return -[CalDAVCalendarServerChangesItem initWithNameSpace:andName:](self, "initWithNameSpace:andName:", *MEMORY[0x24BE1ADC8], CFSTR("changes"));
}

- (CalDAVCalendarServerChangesItem)initWithNameSpace:(id)a3 andName:(id)a4
{
  CalDAVCalendarServerChangesItem *v4;
  NSMutableSet *v5;
  NSMutableSet *changedProperties;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)CalDAVCalendarServerChangesItem;
  v4 = -[CoreDAVItem initWithNameSpace:andName:](&v8, sel_initWithNameSpace_andName_, a3, a4);
  if (v4)
  {
    v5 = (NSMutableSet *)objc_alloc_init(MEMORY[0x24BDBCEF0]);
    changedProperties = v4->_changedProperties;
    v4->_changedProperties = v5;

  }
  return v4;
}

- (void)addChangedProperty:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[CalDAVCalendarServerChangesItem changedProperties](self, "changedProperties");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObject:", v4);

}

- (id)copyParseRules
{
  id v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;

  v2 = objc_alloc(MEMORY[0x24BDBCE70]);
  v3 = *MEMORY[0x24BE1ADC8];
  objc_msgSend(MEMORY[0x24BE1AB88], "ruleWithMinimumNumber:maximumNumber:nameSpace:elementName:objectClass:setterMethod:", 0, 0x7FFFFFFFLL, *MEMORY[0x24BE1ADC8], CFSTR("changed-property"), objc_opt_class(), sel_addChangedProperty_);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@:%@"), v3, CFSTR("changed-property"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v2, "initWithObjectsAndKeys:", v4, v5, 0);

  return v6;
}

- (NSMutableSet)changedProperties
{
  return self->_changedProperties;
}

- (void)setChangedProperties:(id)a3
{
  objc_storeStrong((id *)&self->_changedProperties, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_changedProperties, 0);
}

@end
