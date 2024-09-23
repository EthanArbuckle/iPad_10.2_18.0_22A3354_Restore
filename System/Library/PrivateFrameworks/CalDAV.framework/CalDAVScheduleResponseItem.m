@implementation CalDAVScheduleResponseItem

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
  v4 = *MEMORY[0x24BE1AF20];
  objc_msgSend(MEMORY[0x24BE1AB88], "ruleWithMinimumNumber:maximumNumber:nameSpace:elementName:objectClass:setterMethod:", 0, 0x7FFFFFFFLL, *MEMORY[0x24BE1ACF8], *MEMORY[0x24BE1AF20], objc_opt_class(), sel_addNewTopLevelItem_);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@:%@"), v3, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v2, "initWithObjectsAndKeys:", v5, v6, 0);

  return v7;
}

- (void)addNewTopLevelItem:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  NSObject *v20;
  NSObject *v21;
  NSObject *v22;
  NSObject *v23;
  void *v24;
  void *v25;
  int v26;
  id v27;
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    -[CalDAVScheduleResponseItem responses](self, "responses");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v6)
    {
      objc_msgSend(MEMORY[0x24BDBCEF0], "set");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[CalDAVScheduleResponseItem setResponses:](self, "setResponses:", v7);

    }
    -[CalDAVScheduleResponseItem responses](self, "responses");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addObject:", v5);

    objc_msgSend(v5, "recipientHREF");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "href");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "payloadAsString");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "length");

    if (v12)
    {
      objc_msgSend(v5, "requestStatus");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "payloadAsString");
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      if ((objc_msgSend(v14, "hasPrefix:", CFSTR("2.")) & 1) != 0
        || objc_msgSend(v14, "hasPrefix:", CFSTR("1.")))
      {
        objc_msgSend(v5, "calendarData");
        v15 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v15)
        {
LABEL_23:

          goto LABEL_24;
        }
        -[CalDAVScheduleResponseItem successfulICS](self, "successfulICS");
        v16 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v16)
        {
          objc_msgSend(MEMORY[0x24BDBCEF0], "set");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          -[CalDAVScheduleResponseItem setSuccessfulICS:](self, "setSuccessfulICS:", v17);

        }
        -[CalDAVScheduleResponseItem successfulICS](self, "successfulICS");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "calendarData");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "addObject:", v19);

      }
      else
      {
        -[CalDAVScheduleResponseItem failedResponseItems](self, "failedResponseItems");
        v24 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v24)
        {
          objc_msgSend(MEMORY[0x24BDBCEF0], "set");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          -[CalDAVScheduleResponseItem setFailedResponseItems:](self, "setFailedResponseItems:", v25);

        }
        -[CalDAVScheduleResponseItem failedResponseItems](self, "failedResponseItems");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "addObject:", v5);
      }

      goto LABEL_23;
    }
    objc_msgSend(MEMORY[0x24BE1AB50], "sharedLogging");
    v21 = objc_claimAutoreleasedReturnValue();
    -[NSObject logHandleForAccountInfoProvider:](v21, "logHandleForAccountInfoProvider:", 0);
    v22 = objc_claimAutoreleasedReturnValue();
    v23 = v22;
    if (v22 && os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
    {
      v26 = 138412290;
      v27 = v5;
      _os_log_impl(&dword_2096EB000, v23, OS_LOG_TYPE_DEBUG, "Ignoring strange response item with no parsed recipient %@", (uint8_t *)&v26, 0xCu);
    }

  }
  else
  {
    objc_msgSend(MEMORY[0x24BE1AB50], "sharedLogging");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "logHandleForAccountInfoProvider:", 0);
    v20 = objc_claimAutoreleasedReturnValue();
    v21 = v20;
    if (v20 && os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
    {
      v26 = 138412290;
      v27 = v4;
      _os_log_impl(&dword_2096EB000, v21, OS_LOG_TYPE_DEBUG, "Dropping unexpected child %@", (uint8_t *)&v26, 0xCu);
    }
  }

LABEL_24:
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %p: FailedAttendees:\n%@\nSuccessfulICS:\n%@"), v5, self, self->_failedResponseItems, self->_successfulICS);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (NSMutableSet)responses
{
  return self->_responses;
}

- (void)setResponses:(id)a3
{
  objc_storeStrong((id *)&self->_responses, a3);
}

- (NSMutableSet)successfulICS
{
  return self->_successfulICS;
}

- (void)setSuccessfulICS:(id)a3
{
  objc_storeStrong((id *)&self->_successfulICS, a3);
}

- (NSMutableSet)failedResponseItems
{
  return self->_failedResponseItems;
}

- (void)setFailedResponseItems:(id)a3
{
  objc_storeStrong((id *)&self->_failedResponseItems, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_failedResponseItems, 0);
  objc_storeStrong((id *)&self->_successfulICS, 0);
  objc_storeStrong((id *)&self->_responses, 0);
}

@end
