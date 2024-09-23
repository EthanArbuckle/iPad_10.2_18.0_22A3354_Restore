@implementation CalDAVCalendarServerRecurrenceItem

- (CalDAVCalendarServerRecurrenceItem)init
{
  return -[CoreDAVItem initWithNameSpace:andName:](self, "initWithNameSpace:andName:", *MEMORY[0x24BE1ADC8], CFSTR("recurrence"));
}

- (id)copyParseRules
{
  id v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v2 = objc_alloc(MEMORY[0x24BDBCE70]);
  v3 = *MEMORY[0x24BE1ADC8];
  objc_msgSend(MEMORY[0x24BE1AB88], "ruleWithMinimumNumber:maximumNumber:nameSpace:elementName:objectClass:setterMethod:", 0, 1, *MEMORY[0x24BE1ADC8], CFSTR("master"), objc_opt_class(), sel_setMaster_);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@:%@"), v3, CFSTR("master"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BE1AB88], "ruleWithMinimumNumber:maximumNumber:nameSpace:elementName:objectClass:setterMethod:", 0, 1, v3, CFSTR("recurrenceid"), objc_opt_class(), sel_setRecurrenceID_);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@:%@"), v3, CFSTR("recurrenceid"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BE1AB88], "ruleWithMinimumNumber:maximumNumber:nameSpace:elementName:objectClass:setterMethod:", 0, 1, v3, CFSTR("changes"), objc_opt_class(), sel_setChanges_);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@:%@"), v3, CFSTR("changes"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v2, "initWithObjectsAndKeys:", v4, v5, v6, v7, v8, v9, 0);

  return v10;
}

- (BOOL)isMaster
{
  void *v2;
  BOOL v3;

  -[CalDAVCalendarServerRecurrenceItem master](self, "master");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

- (CoreDAVItemWithNoChildren)master
{
  return self->_master;
}

- (void)setMaster:(id)a3
{
  objc_storeStrong((id *)&self->_master, a3);
}

- (CoreDAVLeafItem)recurrenceID
{
  return self->_recurrenceID;
}

- (void)setRecurrenceID:(id)a3
{
  objc_storeStrong((id *)&self->_recurrenceID, a3);
}

- (CalDAVCalendarServerChangesItem)changes
{
  return self->_changes;
}

- (void)setChanges:(id)a3
{
  objc_storeStrong((id *)&self->_changes, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_changes, 0);
  objc_storeStrong((id *)&self->_recurrenceID, 0);
  objc_storeStrong((id *)&self->_master, 0);
}

@end
