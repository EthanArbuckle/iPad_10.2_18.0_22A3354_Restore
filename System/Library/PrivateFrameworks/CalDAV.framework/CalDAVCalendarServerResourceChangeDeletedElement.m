@implementation CalDAVCalendarServerResourceChangeDeletedElement

- (CalDAVCalendarServerResourceChangeDeletedElement)init
{
  return -[CoreDAVItem initWithNameSpace:andName:](self, "initWithNameSpace:andName:", *MEMORY[0x24BE1ADC8], CFSTR("deleted"));
}

- (void)setDeletedDetails:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;

  v4 = a3;
  objc_msgSend(v4, "componentType");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CalDAVCalendarServerResourceChangeDeletedElement setComponentType:](self, "setComponentType:", v5);

  objc_msgSend(v4, "summary");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[CalDAVCalendarServerResourceChangeDeletedElement setSummary:](self, "setSummary:", v6);

  objc_msgSend(v4, "displayName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[CalDAVCalendarServerResourceChangeDeletedElement setDisplayName:](self, "setDisplayName:", v7);

  objc_msgSend(v4, "nextInstance");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[CalDAVCalendarServerResourceChangeDeletedElement setNextInstance:](self, "setNextInstance:", v8);

  v9 = objc_msgSend(v4, "hadMoreInstances");
  -[CalDAVCalendarServerResourceChangeDeletedElement setHadMoreInstances:](self, "setHadMoreInstances:", v9);
}

- (id)copyParseRules
{
  id v2;
  void *v3;
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)CalDAVCalendarServerResourceChangeDeletedElement;
  v2 = -[CalDAVCalendarServerResourceChangeElement copyParseRules](&v10, sel_copyParseRules);
  v3 = (void *)objc_msgSend(v2, "mutableCopy");
  v4 = objc_alloc(MEMORY[0x24BDBCE70]);
  v5 = *MEMORY[0x24BE1ADC8];
  objc_msgSend(MEMORY[0x24BE1AB88], "ruleWithMinimumNumber:maximumNumber:nameSpace:elementName:objectClass:setterMethod:", 0, 1, *MEMORY[0x24BE1ADC8], CFSTR("deleted-details"), objc_opt_class(), sel_setDeletedDetails_);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@:%@"), v5, CFSTR("deleted-details"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v4, "initWithObjectsAndKeys:", v6, v7, 0);

  objc_msgSend(v3, "addEntriesFromDictionary:", v8);
  return v3;
}

- (NSString)componentType
{
  return self->_componentType;
}

- (void)setComponentType:(id)a3
{
  objc_storeStrong((id *)&self->_componentType, a3);
}

- (NSString)summary
{
  return self->_summary;
}

- (void)setSummary:(id)a3
{
  objc_storeStrong((id *)&self->_summary, a3);
}

- (NSString)displayName
{
  return self->_displayName;
}

- (void)setDisplayName:(id)a3
{
  objc_storeStrong((id *)&self->_displayName, a3);
}

- (ICSDateValue)nextInstance
{
  return self->_nextInstance;
}

- (void)setNextInstance:(id)a3
{
  objc_storeStrong((id *)&self->_nextInstance, a3);
}

- (BOOL)hadMoreInstances
{
  return self->_hadMoreInstances;
}

- (void)setHadMoreInstances:(BOOL)a3
{
  self->_hadMoreInstances = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_nextInstance, 0);
  objc_storeStrong((id *)&self->_displayName, 0);
  objc_storeStrong((id *)&self->_summary, 0);
  objc_storeStrong((id *)&self->_componentType, 0);
}

@end
