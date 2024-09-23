@implementation CalDAVPostCalendarItemRecurrenceSplitTask

- (CalDAVPostCalendarItemRecurrenceSplitTask)initWithResourceURL:(id)a3 recurrenceDate:(id)a4 floating:(BOOL)a5 allday:(BOOL)a6
{
  _BOOL8 v6;
  _BOOL8 v7;
  id v10;
  id v11;
  CalDAVPostCalendarItemRecurrenceSplitTask *v12;
  CalDAVPostCalendarItemRecurrenceSplitTask *v13;
  objc_super v15;

  v6 = a6;
  v7 = a5;
  v10 = a3;
  v11 = a4;
  v15.receiver = self;
  v15.super_class = (Class)CalDAVPostCalendarItemRecurrenceSplitTask;
  v12 = -[CoreDAVPropertyFindBaseTask initWithPropertiesToFind:atURL:](&v15, sel_initWithPropertiesToFind_atURL_, 0, 0);
  v13 = v12;
  if (v12)
  {
    -[CalDAVPostCalendarItemRecurrenceSplitTask setResourceURL:](v12, "setResourceURL:", v10);
    -[CalDAVPostCalendarItemRecurrenceSplitTask setRecurrenceDate:](v13, "setRecurrenceDate:", v11);
    -[CalDAVPostCalendarItemRecurrenceSplitTask setIsFloating:](v13, "setIsFloating:", v7);
    -[CalDAVPostCalendarItemRecurrenceSplitTask setIsAllDay:](v13, "setIsAllDay:", v6);
  }

  return v13;
}

- (id)_recurrenceDateString
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  objc_class *v10;
  void *v11;

  objc_msgSend(MEMORY[0x24BDBCE48], "calendarWithIdentifier:", *MEMORY[0x24BDBCA18]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCF38], "timeZoneWithName:", CFSTR("UTC"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[CalDAVPostCalendarItemRecurrenceSplitTask recurrenceDate](self, "recurrenceDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[CalDAVPostCalendarItemRecurrenceSplitTask recurrenceDate](self, "recurrenceDate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "componentsInTimeZone:fromDate:", v4, v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (-[CalDAVPostCalendarItemRecurrenceSplitTask isAllDay](self, "isAllDay"))
    {
      v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEC6FB0]), "initWithYear:month:day:", objc_msgSend(v7, "year"), objc_msgSend(v7, "month"), objc_msgSend(v7, "day"));
    }
    else
    {
      if (-[CalDAVPostCalendarItemRecurrenceSplitTask isFloating](self, "isFloating"))
        v10 = (objc_class *)MEMORY[0x24BEC6FA8];
      else
        v10 = (objc_class *)MEMORY[0x24BEC6FA0];
      v8 = (void *)objc_msgSend([v10 alloc], "initWithYear:month:day:hour:minute:second:", objc_msgSend(v7, "year"), objc_msgSend(v7, "month"), objc_msgSend(v7, "day"), objc_msgSend(v7, "hour"), objc_msgSend(v7, "minute"), objc_msgSend(v7, "second"));
    }
    v11 = v8;
    objc_msgSend(v8, "icsString");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (id)urlWithQuery
{
  NSURL *postURLWithQuery;
  void *v4;
  void *v5;
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
  NSURL *v17;
  NSURL *v18;
  _QWORD v20[2];
  _QWORD v21[4];

  v21[3] = *MEMORY[0x24BDAC8D0];
  postURLWithQuery = self->_postURLWithQuery;
  if (!postURLWithQuery)
  {
    v4 = (void *)MEMORY[0x24BDD1808];
    -[CalDAVPostCalendarItemRecurrenceSplitTask resourceURL](self, "resourceURL");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "componentsWithURL:resolvingAgainstBaseURL:", v5, 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BDD1838], "queryItemWithName:value:", CFSTR("action"), CFSTR("split"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)MEMORY[0x24BDD1838];
    -[CalDAVPostCalendarItemRecurrenceSplitTask _recurrenceDateString](self, "_recurrenceDateString");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "queryItemWithName:value:", CFSTR("rid"), v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    -[CalDAVPostCalendarItemRecurrenceSplitTask uidForCreatedSeries](self, "uidForCreatedSeries");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "length");

    if (v12)
    {
      v13 = (void *)MEMORY[0x24BDD1838];
      -[CalDAVPostCalendarItemRecurrenceSplitTask uidForCreatedSeries](self, "uidForCreatedSeries");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "queryItemWithName:value:", CFSTR("uid"), v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      v21[0] = v7;
      v21[1] = v10;
      v21[2] = v15;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v21, 3);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setQueryItems:", v16);

    }
    else
    {
      v20[0] = v7;
      v20[1] = v10;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v20, 2);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setQueryItems:", v15);
    }

    objc_msgSend(v6, "URL");
    v17 = (NSURL *)objc_claimAutoreleasedReturnValue();
    v18 = self->_postURLWithQuery;
    self->_postURLWithQuery = v17;

    postURLWithQuery = self->_postURLWithQuery;
  }
  return postURLWithQuery;
}

- (id)httpMethod
{
  return CFSTR("POST");
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  objc_super v10;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v10.receiver = self;
  v10.super_class = (Class)CalDAVPostCalendarItemRecurrenceSplitTask;
  -[CoreDAVPropertyFindBaseTask description](&v10, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[CalDAVPostCalendarItemRecurrenceSplitTask recurrenceDate](self, "recurrenceDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CalDAVPostCalendarItemRecurrenceSplitTask previousScheduleTag](self, "previousScheduleTag");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[CalDAVPostCalendarItemRecurrenceSplitTask previousETag](self, "previousETag");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("[%@], recurrenceDate: [%@], previousScheduleTag: [%@], previousETag: [%@]"), v4, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)additionalHeaderValues
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  __CFString **v7;
  void *v8;
  uint64_t v9;

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CalDAVPostCalendarItemRecurrenceSplitTask previousScheduleTag](self, "previousScheduleTag");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "length");

  if (v5)
  {
    -[CalDAVPostCalendarItemRecurrenceSplitTask previousScheduleTag](self, "previousScheduleTag");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = CalDAVHTTPHeader_IfScheduleTagMatch;
LABEL_5:
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, *v7);

    goto LABEL_6;
  }
  -[CalDAVPostCalendarItemRecurrenceSplitTask previousETag](self, "previousETag");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "length");

  if (v9)
  {
    -[CalDAVPostCalendarItemRecurrenceSplitTask previousETag](self, "previousETag");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (__CFString **)MEMORY[0x24BE1AA88];
    goto LABEL_5;
  }
LABEL_6:
  objc_msgSend(v3, "setObject:forKeyedSubscript:", CFSTR("return=representation"), *MEMORY[0x24BE1AAA0]);
  return v3;
}

- (void)_updateBothResponseItems
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  int *v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  -[CalDAVPostCalendarItemRecurrenceSplitTask resourceURL](self, "resourceURL");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "path");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "lastPathComponent");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  -[CoreDAVPropertyFindBaseTask multiStatus](self, "multiStatus");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "responses");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v19;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v19 != v10)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * i);
        objc_msgSend(v12, "firstHref");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "payloadAsString");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "lastPathComponent");
        v15 = (void *)objc_claimAutoreleasedReturnValue();

        v16 = objc_msgSend(v15, "isEqualToString:", v5);
        v17 = &OBJC_IVAR___CalDAVPostCalendarItemRecurrenceSplitTask__createdResponseItem;
        if (v16)
          v17 = &OBJC_IVAR___CalDAVPostCalendarItemRecurrenceSplitTask__updatedResponseItem;
        objc_storeStrong((id *)((char *)&self->super.super.super.isa + *v17), v12);

      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v9);
  }

}

- (CoreDAVResponseItem)createdResponseItem
{
  CoreDAVResponseItem *createdResponseItem;

  createdResponseItem = self->_createdResponseItem;
  if (!createdResponseItem)
  {
    -[CalDAVPostCalendarItemRecurrenceSplitTask _updateBothResponseItems](self, "_updateBothResponseItems");
    createdResponseItem = self->_createdResponseItem;
  }
  return createdResponseItem;
}

- (CoreDAVResponseItem)updatedResponseItem
{
  CoreDAVResponseItem *updatedResponseItem;

  updatedResponseItem = self->_updatedResponseItem;
  if (!updatedResponseItem)
  {
    -[CalDAVPostCalendarItemRecurrenceSplitTask _updateBothResponseItems](self, "_updateBothResponseItems");
    updatedResponseItem = self->_updatedResponseItem;
  }
  return updatedResponseItem;
}

- (id)_etagForItem:(id)a3
{
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(a3, "successfulPropertiesToValues");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "CDVObjectForKeyWithNameSpace:andName:", *MEMORY[0x24BE1AE30], *MEMORY[0x24BE1AE58]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "payloadAsString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)_scheduleTagForItem:(id)a3
{
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(a3, "successfulPropertiesToValues");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "CDVObjectForKeyWithNameSpace:andName:", *MEMORY[0x24BE1ACF8], CFSTR("schedule-tag"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "payloadAsString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)_dataForItem:(id)a3
{
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(a3, "successfulPropertiesToValues");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "CDVObjectForKeyWithNameSpace:andName:", *MEMORY[0x24BE1ACF8], CFSTR("calendar-data"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "payload");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)_documentForItem:(id)a3
{
  void *v3;
  void *v4;

  -[CalDAVPostCalendarItemRecurrenceSplitTask _dataForItem:](self, "_dataForItem:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
    v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEC6FB8]), "initWithData:options:error:", v3, 0, 0);
  else
    v4 = 0;

  return v4;
}

- (id)updatedETag
{
  void *v3;
  void *v4;
  id v5;
  void *v6;

  -[CalDAVPostCalendarItemRecurrenceSplitTask responseHeaders](self, "responseHeaders");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", *MEMORY[0x24BE1AA80]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    v5 = v4;
  }
  else
  {
    -[CalDAVPostCalendarItemRecurrenceSplitTask updatedResponseItem](self, "updatedResponseItem");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[CalDAVPostCalendarItemRecurrenceSplitTask _etagForItem:](self, "_etagForItem:", v6);
    v5 = (id)objc_claimAutoreleasedReturnValue();

  }
  return v5;
}

- (id)updatedScheduleTag
{
  void *v3;
  void *v4;
  id v5;
  void *v6;

  -[CalDAVPostCalendarItemRecurrenceSplitTask responseHeaders](self, "responseHeaders");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("Schedule-Tag"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    v5 = v4;
  }
  else
  {
    -[CalDAVPostCalendarItemRecurrenceSplitTask updatedResponseItem](self, "updatedResponseItem");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[CalDAVPostCalendarItemRecurrenceSplitTask _scheduleTagForItem:](self, "_scheduleTagForItem:", v6);
    v5 = (id)objc_claimAutoreleasedReturnValue();

  }
  return v5;
}

- (id)updatedICSDocument
{
  void *v3;
  void *v4;

  -[CalDAVPostCalendarItemRecurrenceSplitTask updatedResponseItem](self, "updatedResponseItem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CalDAVPostCalendarItemRecurrenceSplitTask _documentForItem:](self, "_documentForItem:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)createdURL
{
  void *v2;
  void *v3;
  void *v4;

  -[CalDAVPostCalendarItemRecurrenceSplitTask createdResponseItem](self, "createdResponseItem");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "firstHref");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "payloadAsFullURL");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)createdETag
{
  void *v3;
  void *v4;

  -[CalDAVPostCalendarItemRecurrenceSplitTask createdResponseItem](self, "createdResponseItem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CalDAVPostCalendarItemRecurrenceSplitTask _etagForItem:](self, "_etagForItem:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)createdScheduleTag
{
  void *v3;
  void *v4;

  -[CalDAVPostCalendarItemRecurrenceSplitTask createdResponseItem](self, "createdResponseItem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CalDAVPostCalendarItemRecurrenceSplitTask _scheduleTagForItem:](self, "_scheduleTagForItem:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)createdICSDocument
{
  void *v3;
  void *v4;

  -[CalDAVPostCalendarItemRecurrenceSplitTask createdResponseItem](self, "createdResponseItem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CalDAVPostCalendarItemRecurrenceSplitTask _documentForItem:](self, "_documentForItem:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)createdICSData
{
  void *v3;
  void *v4;

  -[CalDAVPostCalendarItemRecurrenceSplitTask createdResponseItem](self, "createdResponseItem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CalDAVPostCalendarItemRecurrenceSplitTask _dataForItem:](self, "_dataForItem:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)requestBody
{
  return 0;
}

- (NSURL)resourceURL
{
  return self->_resourceURL;
}

- (void)setResourceURL:(id)a3
{
  objc_storeStrong((id *)&self->_resourceURL, a3);
}

- (NSDate)recurrenceDate
{
  return self->_recurrenceDate;
}

- (void)setRecurrenceDate:(id)a3
{
  objc_storeStrong((id *)&self->_recurrenceDate, a3);
}

- (NSString)uidForCreatedSeries
{
  return self->_uidForCreatedSeries;
}

- (void)setUidForCreatedSeries:(id)a3
{
  objc_storeStrong((id *)&self->_uidForCreatedSeries, a3);
}

- (NSString)previousScheduleTag
{
  return self->_previousScheduleTag;
}

- (void)setPreviousScheduleTag:(id)a3
{
  objc_storeStrong((id *)&self->_previousScheduleTag, a3);
}

- (NSString)previousETag
{
  return self->_previousETag;
}

- (void)setPreviousETag:(id)a3
{
  objc_storeStrong((id *)&self->_previousETag, a3);
}

- (BOOL)isFloating
{
  return self->_isFloating;
}

- (void)setIsFloating:(BOOL)a3
{
  self->_isFloating = a3;
}

- (BOOL)isAllDay
{
  return self->_isAllDay;
}

- (void)setIsAllDay:(BOOL)a3
{
  self->_isAllDay = a3;
}

- (NSURL)postURLWithQuery
{
  return self->_postURLWithQuery;
}

- (void)setPostURLWithQuery:(id)a3
{
  objc_storeStrong((id *)&self->_postURLWithQuery, a3);
}

- (void)setUpdatedResponseItem:(id)a3
{
  objc_storeStrong((id *)&self->_updatedResponseItem, a3);
}

- (void)setCreatedResponseItem:(id)a3
{
  objc_storeStrong((id *)&self->_createdResponseItem, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_createdResponseItem, 0);
  objc_storeStrong((id *)&self->_updatedResponseItem, 0);
  objc_storeStrong((id *)&self->_postURLWithQuery, 0);
  objc_storeStrong((id *)&self->_previousETag, 0);
  objc_storeStrong((id *)&self->_previousScheduleTag, 0);
  objc_storeStrong((id *)&self->_uidForCreatedSeries, 0);
  objc_storeStrong((id *)&self->_recurrenceDate, 0);
  objc_storeStrong((id *)&self->_resourceURL, 0);
}

@end
