@implementation CalDAVCalendarServerScheduleChangesItem

- (CalDAVCalendarServerScheduleChangesItem)init
{
  return -[CoreDAVItem initWithNameSpace:andName:](self, "initWithNameSpace:andName:", *MEMORY[0x24BE1ADC8], CFSTR("schedule-changes"));
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

  v2 = objc_alloc(MEMORY[0x24BDBCE70]);
  v3 = *MEMORY[0x24BE1ADC8];
  objc_msgSend(MEMORY[0x24BE1AB88], "ruleWithMinimumNumber:maximumNumber:nameSpace:elementName:objectClass:setterMethod:", 0, 1, *MEMORY[0x24BE1ADC8], CFSTR("dtstamp"), objc_opt_class(), sel_setDtstamp_);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@:%@"), v3, CFSTR("dtstamp"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BE1AB88], "ruleWithMinimumNumber:maximumNumber:nameSpace:elementName:objectClass:setterMethod:", 0, 1, v3, CFSTR("action"), objc_opt_class(), sel_setAction_);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@:%@"), v3, CFSTR("action"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v2, "initWithObjectsAndKeys:", v4, v5, v6, v7, 0);

  return v8;
}

- (CoreDAVLeafItem)dtstamp
{
  return self->_dtstamp;
}

- (void)setDtstamp:(id)a3
{
  objc_storeStrong((id *)&self->_dtstamp, a3);
}

- (CalDAVCalendarServerActionItem)action
{
  return self->_action;
}

- (void)setAction:(id)a3
{
  objc_storeStrong((id *)&self->_action, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_action, 0);
  objc_storeStrong((id *)&self->_dtstamp, 0);
}

@end
