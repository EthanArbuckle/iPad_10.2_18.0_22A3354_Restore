@implementation CalDAVCalendarServerDeletedDetailsItem

- (CalDAVCalendarServerDeletedDetailsItem)init
{
  return -[CoreDAVItem initWithNameSpace:andName:](self, "initWithNameSpace:andName:", *MEMORY[0x24BE1ADC8], CFSTR("deleted-details"));
}

- (void)setComponentTypeItem:(id)a3
{
  id v4;

  objc_msgSend(a3, "payloadAsString");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[CalDAVCalendarServerDeletedDetailsItem setComponentType:](self, "setComponentType:", v4);

}

- (void)setSummaryItem:(id)a3
{
  id v4;

  objc_msgSend(a3, "payloadAsString");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[CalDAVCalendarServerDeletedDetailsItem setSummary:](self, "setSummary:", v4);

}

- (void)setDisplayNameItem:(id)a3
{
  id v4;

  objc_msgSend(a3, "payloadAsString");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[CalDAVCalendarServerDeletedDetailsItem setDisplayName:](self, "setDisplayName:", v4);

}

- (void)setNextInstanceItem:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v4 = (void *)MEMORY[0x24BEC6FB0];
  objc_msgSend(a3, "payloadAsString");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "dateFromICSString:", v6);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CalDAVCalendarServerDeletedDetailsItem setNextInstance:](self, "setNextInstance:", v5);

}

- (void)setHadMoreInstancesItem:(id)a3
{
  -[CalDAVCalendarServerDeletedDetailsItem setHadMoreInstances:](self, "setHadMoreInstances:", 1);
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
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;

  v14 = objc_alloc(MEMORY[0x24BDBCE70]);
  v2 = *MEMORY[0x24BE1ADC8];
  objc_msgSend(MEMORY[0x24BE1AB88], "ruleWithMinimumNumber:maximumNumber:nameSpace:elementName:objectClass:setterMethod:", 0, 1, *MEMORY[0x24BE1ADC8], CFSTR("deleted-component"), objc_opt_class(), sel_setComponentTypeItem_);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@:%@"), v2, CFSTR("deleted-component"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BE1AB88], "ruleWithMinimumNumber:maximumNumber:nameSpace:elementName:objectClass:setterMethod:", 0, 1, v2, CFSTR("deleted-summary"), objc_opt_class(), sel_setSummaryItem_);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@:%@"), v2, CFSTR("deleted-summary"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BE1AB88], "ruleWithMinimumNumber:maximumNumber:nameSpace:elementName:objectClass:setterMethod:", 0, 1, v2, CFSTR("deleted-next-instance"), objc_opt_class(), sel_setNextInstanceItem_);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@:%@"), v2, CFSTR("deleted-next-instance"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BE1AB88], "ruleWithMinimumNumber:maximumNumber:nameSpace:elementName:objectClass:setterMethod:", 0, 1, v2, CFSTR("deleted-had-more-instances"), objc_opt_class(), sel_setHadMoreInstancesItem_);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@:%@"), v2, CFSTR("deleted-had-more-instances"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BE1AB88], "ruleWithMinimumNumber:maximumNumber:nameSpace:elementName:objectClass:setterMethod:", 0, 1, v2, CFSTR("deleted-displayname"), objc_opt_class(), sel_setDisplayNameItem_);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@:%@"), v2, CFSTR("deleted-displayname"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (void *)objc_msgSend(v14, "initWithObjectsAndKeys:", v13, v12, v11, v10, v3, v4, v5, v6, v7, v8, 0);

  return v15;
}

- (NSString)componentType
{
  return *(NSString **)&self->_hadMoreInstances;
}

- (void)setComponentType:(id)a3
{
  objc_storeStrong((id *)&self->_hadMoreInstances, a3);
}

- (NSString)summary
{
  return self->_componentType;
}

- (void)setSummary:(id)a3
{
  objc_storeStrong((id *)&self->_componentType, a3);
}

- (NSString)displayName
{
  return self->_summary;
}

- (void)setDisplayName:(id)a3
{
  objc_storeStrong((id *)&self->_summary, a3);
}

- (ICSDateValue)nextInstance
{
  return (ICSDateValue *)self->_displayName;
}

- (void)setNextInstance:(id)a3
{
  objc_storeStrong((id *)&self->_displayName, a3);
}

- (BOOL)hadMoreInstances
{
  return *(&self->super._useCDATA + 1);
}

- (void)setHadMoreInstances:(BOOL)a3
{
  *(&self->super._useCDATA + 1) = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_displayName, 0);
  objc_storeStrong((id *)&self->_summary, 0);
  objc_storeStrong((id *)&self->_componentType, 0);
  objc_storeStrong((id *)&self->_hadMoreInstances, 0);
}

@end
