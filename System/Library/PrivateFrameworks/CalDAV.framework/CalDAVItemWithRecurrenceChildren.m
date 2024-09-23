@implementation CalDAVItemWithRecurrenceChildren

- (void)addRecurrence:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v4 = a3;
  -[CalDAVItemWithRecurrenceChildren recurrences](self, "recurrences");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEF0]), "initWithCapacity:", 1);
    -[CalDAVItemWithRecurrenceChildren setRecurrences:](self, "setRecurrences:", v6);

  }
  -[CalDAVItemWithRecurrenceChildren recurrences](self, "recurrences");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addObject:", v4);

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
  objc_msgSend(MEMORY[0x24BE1AB88], "ruleWithMinimumNumber:maximumNumber:nameSpace:elementName:objectClass:setterMethod:", 1, 0x7FFFFFFFLL, *MEMORY[0x24BE1ADC8], CFSTR("recurrence"), objc_opt_class(), sel_addRecurrence_);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@:%@"), v3, CFSTR("recurrence"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v2, "initWithObjectsAndKeys:", v4, v5, 0);

  return v6;
}

- (NSMutableSet)recurrences
{
  return self->_recurrences;
}

- (void)setRecurrences:(id)a3
{
  objc_storeStrong((id *)&self->_recurrences, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_recurrences, 0);
}

@end
