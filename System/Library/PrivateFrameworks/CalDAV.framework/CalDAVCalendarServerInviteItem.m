@implementation CalDAVCalendarServerInviteItem

- (CalDAVCalendarServerInviteItem)init
{
  return -[CalDAVCalendarServerInviteItem initWithNameSpace:andName:](self, "initWithNameSpace:andName:", *MEMORY[0x24BE1ADC8], CFSTR("invite"));
}

- (CalDAVCalendarServerInviteItem)initWithNameSpace:(id)a3 andName:(id)a4
{
  CalDAVCalendarServerInviteItem *v4;
  NSMutableSet *v5;
  NSMutableSet *users;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)CalDAVCalendarServerInviteItem;
  v4 = -[CoreDAVItem initWithNameSpace:andName:](&v8, sel_initWithNameSpace_andName_, a3, a4);
  if (v4)
  {
    v5 = (NSMutableSet *)objc_alloc_init(MEMORY[0x24BDBCEF0]);
    users = v4->_users;
    v4->_users = v5;

  }
  return v4;
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
  objc_msgSend(MEMORY[0x24BE1AB88], "ruleWithMinimumNumber:maximumNumber:nameSpace:elementName:objectClass:setterMethod:", 0, 1, *MEMORY[0x24BE1ADC8], CFSTR("user"), objc_opt_class(), sel_addUser_);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@:%@"), v3, CFSTR("user"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v2, "initWithObjectsAndKeys:", v4, v5, 0);

  return v6;
}

- (void)addUser:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[CalDAVCalendarServerInviteItem users](self, "users");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObject:", v4);

}

- (NSMutableSet)users
{
  return self->_users;
}

- (void)setUsers:(id)a3
{
  objc_storeStrong((id *)&self->_users, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_users, 0);
}

@end
