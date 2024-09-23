@implementation CalDAVCalendarServerAccessItem

- (CalDAVCalendarServerAccessItem)init
{
  return -[CoreDAVItem initWithNameSpace:andName:](self, "initWithNameSpace:andName:", *MEMORY[0x24BE1ADC8], CFSTR("access"));
}

- (CalDAVCalendarServerAccessItem)initWithAccess:(int)a3
{
  CalDAVCalendarServerAccessItem *v4;
  __CFString **v5;
  id v6;
  void *v7;

  v4 = -[CalDAVCalendarServerAccessItem init](self, "init");
  if (v4)
  {
    if ((a3 - 1) > 2)
    {
      v7 = 0;
    }
    else
    {
      v5 = off_24C1FB340[a3 - 1];
      v6 = objc_alloc(MEMORY[0x24BE1AB40]);
      v7 = (void *)objc_msgSend(v6, "initWithNameSpace:andName:", *MEMORY[0x24BE1ADC8], *v5);
    }
    -[CalDAVCalendarServerAccessItem setAccessLevel:](v4, "setAccessLevel:", v7);

  }
  return v4;
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
  id v11;

  v11 = objc_alloc(MEMORY[0x24BDBCE70]);
  v2 = *MEMORY[0x24BE1ADC8];
  objc_msgSend(MEMORY[0x24BE1AB88], "ruleWithMinimumNumber:maximumNumber:nameSpace:elementName:objectClass:setterMethod:", 0, 1, *MEMORY[0x24BE1ADC8], CFSTR("read"), objc_opt_class(), sel_setAccessLevel_);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@:%@"), v2, CFSTR("read"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BE1AB88], "ruleWithMinimumNumber:maximumNumber:nameSpace:elementName:objectClass:setterMethod:", 0, 1, v2, CFSTR("read-write"), objc_opt_class(), sel_setAccessLevel_);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@:%@"), v2, CFSTR("read-write"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BE1AB88], "ruleWithMinimumNumber:maximumNumber:nameSpace:elementName:objectClass:setterMethod:", 0, 1, v2, CFSTR("read-write-schedule"), objc_opt_class(), sel_setAccessLevel_);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@:%@"), v2, CFSTR("read-write-schedule"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v11, "initWithObjectsAndKeys:", v3, v4, v5, v6, v7, v8, 0);

  return v9;
}

- (CoreDAVItemWithNoChildren)accessLevel
{
  return self->_accessLevel;
}

- (void)setAccessLevel:(id)a3
{
  objc_storeStrong((id *)&self->_accessLevel, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accessLevel, 0);
}

@end
