@implementation CalDAVCalendarServerResourceChangeElement

- (CalDAVCalendarServerResourceChangeElement)init
{
  void *v4;

  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CalDAVCalendarServerResourceChangeElement.m"), 19, CFSTR("Don't initialize CalDAVCalendarServerResourceChange directly. Use a subclass, dude."));

  return 0;
}

- (NSURL)fullHrefURL
{
  void *v2;
  void *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CalDAVCalendarServerResourceChangeElement;
  -[CoreDAVItemWithHrefChildItem href](&v5, sel_href);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "payloadAsFullURL");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSURL *)v3;
}

- (id)copyParseRules
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;

  v2 = objc_alloc(MEMORY[0x24BDBCED8]);
  v3 = *MEMORY[0x24BE1AE30];
  v4 = *MEMORY[0x24BE1AE70];
  objc_msgSend(MEMORY[0x24BE1AB88], "ruleWithMinimumNumber:maximumNumber:nameSpace:elementName:objectClass:setterMethod:", 1, 1, *MEMORY[0x24BE1AE30], *MEMORY[0x24BE1AE70], objc_opt_class(), sel_setHref_);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@:%@"), v3, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = *MEMORY[0x24BE1ADC8];
  objc_msgSend(MEMORY[0x24BE1AB88], "ruleWithMinimumNumber:maximumNumber:nameSpace:elementName:objectClass:setterMethod:", 0, 1, *MEMORY[0x24BE1ADC8], CFSTR("changed-by"), objc_opt_class(), sel_setChangedBy_);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@:%@"), v7, CFSTR("changed-by"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v2, "initWithObjectsAndKeys:", v5, v6, v8, v9, 0);

  return v10;
}

- (CalDAVUpdateOwnerItem)changedBy
{
  return self->_changedBy;
}

- (void)setChangedBy:(id)a3
{
  objc_storeStrong((id *)&self->_changedBy, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_changedBy, 0);
}

@end
