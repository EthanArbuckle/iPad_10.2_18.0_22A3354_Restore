@implementation CalDAVCalendarServerActionItem

- (CalDAVCalendarServerActionItem)init
{
  return -[CoreDAVItem initWithNameSpace:andName:](self, "initWithNameSpace:andName:", *MEMORY[0x24BE1ADC8], CFSTR("action"));
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
  objc_msgSend(MEMORY[0x24BE1AB88], "ruleWithMinimumNumber:maximumNumber:nameSpace:elementName:objectClass:setterMethod:", 0, 1, *MEMORY[0x24BE1ADC8], CFSTR("create"), objc_opt_class(), sel_setCreate_);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@:%@"), v2, CFSTR("create"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BE1AB88], "ruleWithMinimumNumber:maximumNumber:nameSpace:elementName:objectClass:setterMethod:", 0, 1, v2, CFSTR("update"), objc_opt_class(), sel_setUpdate_);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@:%@"), v2, CFSTR("update"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BE1AB88], "ruleWithMinimumNumber:maximumNumber:nameSpace:elementName:objectClass:setterMethod:", 0, 1, v2, CFSTR("reply"), objc_opt_class(), sel_setReply_);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@:%@"), v2, CFSTR("reply"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BE1AB88], "ruleWithMinimumNumber:maximumNumber:nameSpace:elementName:objectClass:setterMethod:", 0, 1, v2, CFSTR("cancel"), objc_opt_class(), sel_setCancel_);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@:%@"), v2, CFSTR("cancel"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v13, "initWithObjectsAndKeys:", v12, v3, v4, v5, v6, v7, v8, v9, 0);

  return v10;
}

- (CoreDAVItemWithNoChildren)create
{
  return self->_create;
}

- (void)setCreate:(id)a3
{
  objc_storeStrong((id *)&self->_create, a3);
}

- (CalDAVCalendarServerUpdateItem)update
{
  return self->_update;
}

- (void)setUpdate:(id)a3
{
  objc_storeStrong((id *)&self->_update, a3);
}

- (CalDAVCalendarServerCancelItem)cancel
{
  return self->_cancel;
}

- (void)setCancel:(id)a3
{
  objc_storeStrong((id *)&self->_cancel, a3);
}

- (CalDAVCalendarServerReplyItem)reply
{
  return self->_reply;
}

- (void)setReply:(id)a3
{
  objc_storeStrong((id *)&self->_reply, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_reply, 0);
  objc_storeStrong((id *)&self->_cancel, 0);
  objc_storeStrong((id *)&self->_update, 0);
  objc_storeStrong((id *)&self->_create, 0);
}

@end
