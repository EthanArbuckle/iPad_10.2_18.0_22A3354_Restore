@implementation CalDAVCalendarServerNotificationItem

- (CalDAVCalendarServerNotificationItem)init
{
  return -[CoreDAVItem initWithNameSpace:andName:](self, "initWithNameSpace:andName:", *MEMORY[0x24BE1ADC8], CFSTR("notification"));
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
  void *v9;
  void *v10;
  void *v12;
  id v13;

  v13 = objc_alloc(MEMORY[0x24BDBCE70]);
  v2 = *MEMORY[0x24BE1ADC8];
  objc_msgSend(MEMORY[0x24BE1AB88], "ruleWithMinimumNumber:maximumNumber:nameSpace:elementName:objectClass:setterMethod:", 1, 1, *MEMORY[0x24BE1ADC8], CFSTR("dtstamp"), objc_opt_class(), sel_setDtstamp_);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@:%@"), v2, CFSTR("dtstamp"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BE1AB88], "ruleWithMinimumNumber:maximumNumber:nameSpace:elementName:objectClass:setterMethod:", 0, 1, v2, CFSTR("invite-notification"), objc_opt_class(), sel_setContent_);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@:%@"), v2, CFSTR("invite-notification"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BE1AB88], "ruleWithMinimumNumber:maximumNumber:nameSpace:elementName:objectClass:setterMethod:", 0, 1, v2, CFSTR("invite-reply"), objc_opt_class(), sel_setContent_);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@:%@"), v2, CFSTR("invite-reply"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BE1AB88], "ruleWithMinimumNumber:maximumNumber:nameSpace:elementName:objectClass:setterMethod:", 0, 1, v2, CFSTR("resource-changed"), objc_opt_class(), sel_setContent_);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@:%@"), v2, CFSTR("resource-changed"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v13, "initWithObjectsAndKeys:", v12, v3, v4, v5, v6, v7, v8, v9, 0);

  return v10;
}

- (CoreDAVLeafItem)dtstamp
{
  return self->_dtstamp;
}

- (void)setDtstamp:(id)a3
{
  objc_storeStrong((id *)&self->_dtstamp, a3);
}

- (CoreDAVItem)content
{
  return self->_content;
}

- (void)setContent:(id)a3
{
  objc_storeStrong((id *)&self->_content, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_content, 0);
  objc_storeStrong((id *)&self->_dtstamp, 0);
}

@end
