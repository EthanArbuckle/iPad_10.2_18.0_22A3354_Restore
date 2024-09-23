@implementation CalDAVCalendarServerReplyItem

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
  objc_msgSend(MEMORY[0x24BE1AB88], "ruleWithMinimumNumber:maximumNumber:nameSpace:elementName:objectClass:setterMethod:", 0, 1, *MEMORY[0x24BE1ADC8], CFSTR("attendee"), objc_opt_class(), sel_setAttendee_);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@:%@"), v3, CFSTR("attendee"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BE1AB88], "ruleWithMinimumNumber:maximumNumber:nameSpace:elementName:objectClass:setterMethod:", 1, 0x7FFFFFFFLL, v3, CFSTR("recurrence"), objc_opt_class(), sel_addRecurrence_);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@:%@"), v3, CFSTR("recurrence"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v2, "initWithObjectsAndKeys:", v4, v5, v6, v7, 0);

  return v8;
}

- (CoreDAVLeafItem)attendee
{
  return self->_attendee;
}

- (void)setAttendee:(id)a3
{
  objc_storeStrong((id *)&self->_attendee, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_attendee, 0);
}

@end
