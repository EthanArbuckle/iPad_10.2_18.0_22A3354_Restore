@implementation CalDAVCalendarServerOrganizerItem

- (CalDAVCalendarServerOrganizerItem)init
{
  return -[CoreDAVItem initWithNameSpace:andName:](self, "initWithNameSpace:andName:", *MEMORY[0x24BE1ADC8], CFSTR("organizer"));
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

  v2 = objc_alloc(MEMORY[0x24BDBCE70]);
  v3 = *MEMORY[0x24BE1AE30];
  v4 = *MEMORY[0x24BE1AE70];
  objc_msgSend(MEMORY[0x24BE1AB88], "ruleWithMinimumNumber:maximumNumber:nameSpace:elementName:objectClass:setterMethod:", 1, 1, *MEMORY[0x24BE1AE30], *MEMORY[0x24BE1AE70], objc_opt_class(), sel_setHref_);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@:%@"), v3, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = *MEMORY[0x24BE1ADC8];
  objc_msgSend(MEMORY[0x24BE1AB88], "ruleWithMinimumNumber:maximumNumber:nameSpace:elementName:objectClass:setterMethod:", 0, 1, *MEMORY[0x24BE1ADC8], CFSTR("common-name"), objc_opt_class(), sel_setCommonName_);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@:%@"), v7, CFSTR("common-name"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v2, "initWithObjectsAndKeys:", v5, v6, v8, v9, 0);

  return v10;
}

- (CoreDAVHrefItem)href
{
  return self->_href;
}

- (void)setHref:(id)a3
{
  objc_storeStrong((id *)&self->_href, a3);
}

- (CoreDAVLeafItem)commonName
{
  return self->_commonName;
}

- (void)setCommonName:(id)a3
{
  objc_storeStrong((id *)&self->_commonName, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_commonName, 0);
  objc_storeStrong((id *)&self->_href, 0);
}

@end
