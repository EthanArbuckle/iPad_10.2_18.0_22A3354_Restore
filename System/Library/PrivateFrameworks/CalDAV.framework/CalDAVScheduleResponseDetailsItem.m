@implementation CalDAVScheduleResponseDetailsItem

- (void)_setCalendarDataWithLeafItem:(id)a3
{
  objc_class *v4;
  id v5;
  id v6;
  void *v7;
  id v8;

  v4 = (objc_class *)MEMORY[0x24BEC6FB8];
  v5 = a3;
  v6 = [v4 alloc];
  objc_msgSend(v5, "payloadAsString");
  v8 = (id)objc_claimAutoreleasedReturnValue();

  v7 = (void *)objc_msgSend(v6, "initWithICSString:options:error:", v8, 0, 0);
  -[CalDAVScheduleResponseDetailsItem setCalendarData:](self, "setCalendarData:", v7);

}

- (id)copyParseRules
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;

  v17 = objc_alloc(MEMORY[0x24BDBCE70]);
  v2 = *MEMORY[0x24BE1ACF8];
  objc_msgSend(MEMORY[0x24BE1AB88], "ruleWithMinimumNumber:maximumNumber:nameSpace:elementName:objectClass:setterMethod:", 0, 1, *MEMORY[0x24BE1ACF8], CFSTR("recipient"), objc_opt_class(), sel_setRecipientHREF_);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@:%@"), v2, CFSTR("recipient"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BE1AB88], "ruleWithMinimumNumber:maximumNumber:nameSpace:elementName:objectClass:setterMethod:", 0, 1, v2, CFSTR("request-status"), objc_opt_class(), sel_setRequestStatus_);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@:%@"), v2, CFSTR("request-status"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BE1AB88], "ruleWithMinimumNumber:maximumNumber:nameSpace:elementName:objectClass:setterMethod:", 0, 1, v2, CFSTR("calendar-data"), objc_opt_class(), sel__setCalendarDataWithLeafItem_);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@:%@"), v2, CFSTR("calendar-data"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = *MEMORY[0x24BE1AE30];
  v7 = *MEMORY[0x24BE1AE40];
  objc_msgSend(MEMORY[0x24BE1AB88], "ruleWithMinimumNumber:maximumNumber:nameSpace:elementName:objectClass:setterMethod:", 0, 1, *MEMORY[0x24BE1AE30], *MEMORY[0x24BE1AE40], objc_opt_class(), sel_setTopLevelErrorItem_);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@:%@"), v6, v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = *MEMORY[0x24BE1AF28];
  objc_msgSend(MEMORY[0x24BE1AB88], "ruleWithMinimumNumber:maximumNumber:nameSpace:elementName:objectClass:setterMethod:", 0, 1, v6, *MEMORY[0x24BE1AF28], objc_opt_class(), sel_setResponseDescription_);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@:%@"), v6, v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = (void *)objc_msgSend(v17, "initWithObjectsAndKeys:", v16, v15, v14, v3, v4, v5, v8, v9, v11, v12, 0);

  return v18;
}

- (NSString)recipientString
{
  void *v2;
  void *v3;
  void *v4;

  -[CalDAVScheduleResponseDetailsItem recipientHREF](self, "recipientHREF");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "href");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "payloadAsString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v4;
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  CoreDAVItemWithHrefChildItem *recipientHREF;
  void *v7;
  void *v8;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  recipientHREF = self->_recipientHREF;
  -[CoreDAVLeafItem payloadAsString](self->_requestStatus, "payloadAsString");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %p: RecipientHREF: %@, RequestStatus: %@ CalendarData:\n%@ TopLevelErrorItem: %@ ResponseDescription:\n%@\n"), v5, self, recipientHREF, v7, self->_calendarData, self->_topLevelErrorItem, self->_responseDescription);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (CoreDAVItemWithHrefChildItem)recipientHREF
{
  return self->_recipientHREF;
}

- (void)setRecipientHREF:(id)a3
{
  objc_storeStrong((id *)&self->_recipientHREF, a3);
}

- (CoreDAVLeafItem)requestStatus
{
  return self->_requestStatus;
}

- (void)setRequestStatus:(id)a3
{
  objc_storeStrong((id *)&self->_requestStatus, a3);
}

- (ICSDocument)calendarData
{
  return self->_calendarData;
}

- (void)setCalendarData:(id)a3
{
  objc_storeStrong((id *)&self->_calendarData, a3);
}

- (CoreDAVErrorItem)topLevelErrorItem
{
  return self->_topLevelErrorItem;
}

- (void)setTopLevelErrorItem:(id)a3
{
  objc_storeStrong((id *)&self->_topLevelErrorItem, a3);
}

- (NSString)responseDescription
{
  return self->_responseDescription;
}

- (void)setResponseDescription:(id)a3
{
  objc_storeStrong((id *)&self->_responseDescription, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_responseDescription, 0);
  objc_storeStrong((id *)&self->_topLevelErrorItem, 0);
  objc_storeStrong((id *)&self->_calendarData, 0);
  objc_storeStrong((id *)&self->_requestStatus, 0);
  objc_storeStrong((id *)&self->_recipientHREF, 0);
}

@end
