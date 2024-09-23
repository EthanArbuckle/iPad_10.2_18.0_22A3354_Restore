@implementation CalDAVCalendarServerResourceChangeUpdatedElement

- (CalDAVCalendarServerResourceChangeUpdatedElement)init
{
  return -[CoreDAVItem initWithNameSpace:andName:](self, "initWithNameSpace:andName:", *MEMORY[0x24BE1ADC8], CFSTR("updated"));
}

- (void)addContentItem:(id)a3
{
  -[CalDAVCalendarServerResourceChangeUpdatedElement setContent:](self, "setContent:", 1);
}

- (void)addCalendarChange:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v4 = a3;
  -[CalDAVCalendarServerResourceChangeUpdatedElement calendarChanges](self, "calendarChanges");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    objc_msgSend(MEMORY[0x24BDBCEF0], "setWithCapacity:", 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[CalDAVCalendarServerResourceChangeUpdatedElement setCalendarChanges:](self, "setCalendarChanges:", v6);

  }
  -[CalDAVCalendarServerResourceChangeUpdatedElement calendarChanges](self, "calendarChanges");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addObject:", v4);

}

- (id)copyParseRules
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v14;
  id v15;
  objc_super v16;

  v16.receiver = self;
  v16.super_class = (Class)CalDAVCalendarServerResourceChangeUpdatedElement;
  v15 = -[CalDAVCalendarServerResourceChangeElement copyParseRules](&v16, sel_copyParseRules);
  v2 = (void *)objc_msgSend(v15, "mutableCopy");
  v14 = objc_alloc(MEMORY[0x24BDBCE70]);
  v3 = *MEMORY[0x24BE1ADC8];
  objc_msgSend(MEMORY[0x24BE1AB88], "ruleWithMinimumNumber:maximumNumber:nameSpace:elementName:objectClass:setterMethod:", 0, 1, *MEMORY[0x24BE1ADC8], CFSTR("content"), objc_opt_class(), sel_addContentItem_);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@:%@"), v3, CFSTR("content"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = *MEMORY[0x24BE1AE30];
  v7 = *MEMORY[0x24BE1AF00];
  objc_msgSend(MEMORY[0x24BE1AB88], "ruleWithMinimumNumber:maximumNumber:nameSpace:elementName:objectClass:setterMethod:", 0, 1, *MEMORY[0x24BE1AE30], *MEMORY[0x24BE1AF00], objc_opt_class(), sel_setProp_);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@:%@"), v6, v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BE1AB88], "ruleWithMinimumNumber:maximumNumber:nameSpace:elementName:objectClass:setterMethod:", 0, 1, v3, CFSTR("calendar-changes"), objc_opt_class(), sel_addCalendarChange_);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@:%@"), v3, CFSTR("calendar-changes"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(v14, "initWithObjectsAndKeys:", v4, v5, v8, v9, v10, v11, 0);

  objc_msgSend(v2, "addEntriesFromDictionary:", v12);
  return v2;
}

- (BOOL)content
{
  return self->_content;
}

- (void)setContent:(BOOL)a3
{
  self->_content = a3;
}

- (CoreDAVItem)prop
{
  return self->_prop;
}

- (void)setProp:(id)a3
{
  objc_storeStrong((id *)&self->_prop, a3);
}

- (NSMutableSet)calendarChanges
{
  return self->_calendarChanges;
}

- (void)setCalendarChanges:(id)a3
{
  objc_storeStrong((id *)&self->_calendarChanges, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_calendarChanges, 0);
  objc_storeStrong((id *)&self->_prop, 0);
}

@end
