@implementation CalDAVScheduleCalendarTranspItem

- (CalDAVScheduleCalendarTranspItem)init
{
  uint64_t v2;
  uint64_t v3;
  objc_super v5;

  v2 = *MEMORY[0x24BE1AE30];
  v3 = *MEMORY[0x24BE1AF30];
  v5.receiver = self;
  v5.super_class = (Class)CalDAVScheduleCalendarTranspItem;
  return -[CoreDAVItem initWithNameSpace:andName:](&v5, sel_initWithNameSpace_andName_, v2, v3);
}

- (BOOL)isScheduleTransparent
{
  void *v2;
  BOOL v3;

  -[CalDAVScheduleCalendarTranspItem transparent](self, "transparent");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

- (id)copyParseRules
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;

  v2 = objc_alloc(MEMORY[0x24BDBCE70]);
  v3 = *MEMORY[0x24BE1ACF8];
  v4 = *MEMORY[0x24BE1AF78];
  objc_msgSend(MEMORY[0x24BE1AB88], "ruleWithMinimumNumber:maximumNumber:nameSpace:elementName:objectClass:setterMethod:", 0, 1, *MEMORY[0x24BE1ACF8], *MEMORY[0x24BE1AF78], objc_opt_class(), sel_setTransparent_);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@:%@"), v3, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v2, "initWithObjectsAndKeys:", v5, v6, 0);

  return v7;
}

- (CoreDAVItemWithNoChildren)transparent
{
  return self->_transparent;
}

- (void)setTransparent:(id)a3
{
  objc_storeStrong((id *)&self->_transparent, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_transparent, 0);
}

@end
