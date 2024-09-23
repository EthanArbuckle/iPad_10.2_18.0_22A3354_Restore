@implementation CalDAVCalendarQueryTask

- (id)description
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  const __CFString *v8;
  _BOOL4 v9;
  const __CFString *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  objc_super v23;

  v3 = objc_alloc_init(MEMORY[0x24BDD16A8]);
  v4 = objc_alloc(MEMORY[0x24BDBCE48]);
  v5 = (void *)objc_msgSend(v4, "initWithCalendarIdentifier:", *MEMORY[0x24BDBCA18]);
  objc_msgSend(MEMORY[0x24BDBCF38], "timeZoneWithName:", CFSTR("UTC"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setTimeZone:", v6);

  v23.receiver = self;
  v23.super_class = (Class)CalDAVCalendarQueryTask;
  -[CoreDAVPropertyFindBaseTask description](&v23, sel_description);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("%@"), v7);

  if (-[CalDAVCalendarQueryTask syncEvents](self, "syncEvents"))
    v8 = CFSTR(" Events");
  else
    v8 = &stru_24C1FD208;
  v9 = -[CalDAVCalendarQueryTask syncTodos](self, "syncTodos");
  v10 = CFSTR(" Todos");
  if (!v9)
    v10 = &stru_24C1FD208;
  objc_msgSend(v3, "appendFormat:", CFSTR("\n  Syncing:%@%@"), v8, v10);
  -[CalDAVCalendarQueryTask eventFilterStartDate](self, "eventFilterStartDate");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
  {

    goto LABEL_9;
  }
  -[CalDAVCalendarQueryTask eventFilterEndDate](self, "eventFilterEndDate");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
LABEL_9:
    -[CalDAVCalendarQueryTask eventFilterStartDate](self, "eventFilterStartDate");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (v13)
    {
      -[CalDAVCalendarQueryTask eventFilterStartDate](self, "eventFilterStartDate");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "dateFromComponents:", v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v15 = 0;
    }

    -[CalDAVCalendarQueryTask eventFilterEndDate](self, "eventFilterEndDate");
    v16 = objc_claimAutoreleasedReturnValue();
    if (v16)
    {
      v17 = (void *)v16;
      -[CalDAVCalendarQueryTask eventFilterEndDate](self, "eventFilterEndDate");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "dateFromComponents:", v18);
      v19 = (void *)objc_claimAutoreleasedReturnValue();

      if (v15 && v19)
      {
        objc_msgSend(MEMORY[0x24BDD1500], "localizedStringFromDate:dateStyle:timeStyle:", v15, 1, 1);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDD1500], "localizedStringFromDate:dateStyle:timeStyle:", v19, 1, 1);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "appendFormat:", CFSTR("\n Event filter Start: (%@), End: (%@)"), v20, v21);

LABEL_20:
        goto LABEL_21;
      }
      if (!v15)
      {
        if (!v19)
          goto LABEL_21;
        objc_msgSend(MEMORY[0x24BDD1500], "localizedStringFromDate:dateStyle:timeStyle:", v19, 1, 1);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "appendFormat:", CFSTR("\n Event filter End: (%@)"), v20);
        goto LABEL_20;
      }
    }
    else
    {
      if (!v15)
      {
LABEL_21:

        goto LABEL_22;
      }
      v19 = 0;
    }
    objc_msgSend(MEMORY[0x24BDD1500], "localizedStringFromDate:dateStyle:timeStyle:", v15, 1, 1);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "appendFormat:", CFSTR("\n Event filter Start: (%@)"), v20);
    goto LABEL_20;
  }
LABEL_22:

  return v3;
}

- (id)httpMethod
{
  return CFSTR("REPORT");
}

- (id)_icsDateStringForNSDateComponents:(id)a3
{
  objc_class *v3;
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _BOOL8 v9;
  _BOOL8 v10;
  uint64_t v11;
  void *v12;
  void *v13;

  if (a3)
  {
    v3 = (objc_class *)MEMORY[0x24BEC6FA0];
    v4 = a3;
    v5 = [v3 alloc];
    v6 = objc_msgSend(v4, "year");
    v7 = objc_msgSend(v4, "month");
    v8 = objc_msgSend(v4, "day");
    v9 = objc_msgSend(v4, "hour") != 0x7FFFFFFFFFFFFFFFLL;
    v10 = objc_msgSend(v4, "minute") != 0x7FFFFFFFFFFFFFFFLL;
    v11 = objc_msgSend(v4, "second");

    v12 = (void *)objc_msgSend(v5, "initWithYear:month:day:hour:minute:second:", v6, v7, v8, v9, v10, v11 != 0x7FFFFFFFFFFFFFFFLL);
    objc_msgSend(v12, "icsString");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v13 = 0;
  }
  return v13;
}

- (void)_appendTimeRangeFilterToXMLData:(id)a3 startDate:(id)a4 endDate:(id)a5
{
  id v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  const __CFString *v13;
  void *v14;
  uint64_t v15;
  id v16;

  v16 = a3;
  v8 = a5;
  -[CalDAVCalendarQueryTask _icsDateStringForNSDateComponents:](self, "_icsDateStringForNSDateComponents:", a4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[CalDAVCalendarQueryTask _icsDateStringForNSDateComponents:](self, "_icsDateStringForNSDateComponents:", v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9 && v10)
  {
    v11 = *MEMORY[0x24BE1AF70];
    v12 = *MEMORY[0x24BE1ACF8];
    v14 = v10;
    v15 = 0;
    v13 = CFSTR("end");
LABEL_6:
    objc_msgSend(v16, "appendElement:inNamespace:withStringContent:withAttributeNamesAndValues:", v11, v12, 0, CFSTR("start"), v9, v13, v14, v15);
    goto LABEL_7;
  }
  if (v9)
  {
    v11 = *MEMORY[0x24BE1AF70];
    v12 = *MEMORY[0x24BE1ACF8];
    v13 = 0;
    goto LABEL_6;
  }
  if (v10)
    objc_msgSend(v16, "appendElement:inNamespace:withStringContent:withAttributeNamesAndValues:", *MEMORY[0x24BE1AF70], *MEMORY[0x24BE1ACF8], 0, CFSTR("end"), v10, 0, v14, v15);
LABEL_7:

}

- (void)_appendComponentFiltersToXMLData:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  id v11;

  v11 = a3;
  v4 = objc_alloc(MEMORY[0x24BDBCED8]);
  v5 = *MEMORY[0x24BE1AEE0];
  v6 = (void *)objc_msgSend(v4, "initWithObjectsAndKeys:", CFSTR("VCALENDAR"), *MEMORY[0x24BE1AEE0], 0);
  if (-[CalDAVCalendarQueryTask syncEvents](self, "syncEvents")
    && -[CalDAVCalendarQueryTask syncTodos](self, "syncTodos"))
  {
    objc_msgSend(v6, "setValue:forKey:", *MEMORY[0x24BE1ADD8], *MEMORY[0x24BE1AE08]);
  }
  v7 = *MEMORY[0x24BE1AE20];
  v8 = *MEMORY[0x24BE1ACF8];
  objc_msgSend(v11, "startElement:inNamespace:withAttributes:", *MEMORY[0x24BE1AE20], *MEMORY[0x24BE1ACF8], v6);
  if (-[CalDAVCalendarQueryTask syncEvents](self, "syncEvents"))
  {
    objc_msgSend(v11, "startElement:inNamespace:withAttributeNamesAndValues:", v7, v8, v5, CFSTR("VEVENT"), 0);
    -[CalDAVCalendarQueryTask eventFilterStartDate](self, "eventFilterStartDate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[CalDAVCalendarQueryTask eventFilterEndDate](self, "eventFilterEndDate");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[CalDAVCalendarQueryTask _appendTimeRangeFilterToXMLData:startDate:endDate:](self, "_appendTimeRangeFilterToXMLData:startDate:endDate:", v11, v9, v10);

    objc_msgSend(v11, "endElement:inNamespace:", v7, v8);
  }
  objc_msgSend(v11, "endElement:inNamespace:", v7, v8);

}

- (id)requestBody
{
  uint64_t v3;
  void *v4;
  void *v5;
  uint64_t v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  uint64_t v21;
  uint64_t v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  -[CoreDAVPropertyFindBaseTask propertiesToFind](self, "propertiesToFind");
  v3 = objc_claimAutoreleasedReturnValue();
  if (!v3)
    return 0;
  v4 = (void *)v3;
  -[CoreDAVPropertyFindBaseTask propertiesToFind](self, "propertiesToFind");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count");

  if (!v6)
    return 0;
  v7 = objc_alloc_init(MEMORY[0x24BE1ABD8]);
  v8 = *MEMORY[0x24BE1ACF8];
  v22 = *MEMORY[0x24BE1ACC0];
  objc_msgSend(v7, "startElement:inNamespace:withAttributeNamesAndValues:");
  v9 = *MEMORY[0x24BE1AE30];
  v21 = *MEMORY[0x24BE1AF00];
  objc_msgSend(v7, "startElement:inNamespace:withAttributeNamesAndValues:");
  v25 = 0u;
  v26 = 0u;
  v23 = 0u;
  v24 = 0u;
  -[CoreDAVPropertyFindBaseTask propertiesToFind](self, "propertiesToFind");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v24;
    do
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v24 != v13)
          objc_enumerationMutation(v10);
        v15 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * i);
        objc_msgSend(v15, "name");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "nameSpace");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "appendElement:inNamespace:withStringContent:withAttributeNamesAndValues:", v16, v17, 0, 0);

      }
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
    }
    while (v12);
  }

  objc_msgSend(v7, "endElement:inNamespace:", v21, v9);
  v18 = *MEMORY[0x24BE1AE48];
  objc_msgSend(v7, "startElement:inNamespace:withAttributeNamesAndValues:", *MEMORY[0x24BE1AE48], v8, 0);
  -[CalDAVCalendarQueryTask _appendComponentFiltersToXMLData:](self, "_appendComponentFiltersToXMLData:", v7);
  objc_msgSend(v7, "endElement:inNamespace:", v18, v8);
  objc_msgSend(v7, "endElement:inNamespace:", v22, v8);
  objc_msgSend(v7, "data");
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  return v19;
}

- (BOOL)syncEvents
{
  return self->_syncEvents;
}

- (void)setSyncEvents:(BOOL)a3
{
  self->_syncEvents = a3;
}

- (BOOL)syncTodos
{
  return self->_syncTodos;
}

- (void)setSyncTodos:(BOOL)a3
{
  self->_syncTodos = a3;
}

- (NSDateComponents)eventFilterStartDate
{
  return self->_eventFilterStartDate;
}

- (void)setEventFilterStartDate:(id)a3
{
  objc_storeStrong((id *)&self->_eventFilterStartDate, a3);
}

- (NSDateComponents)eventFilterEndDate
{
  return self->_eventFilterEndDate;
}

- (void)setEventFilterEndDate:(id)a3
{
  objc_storeStrong((id *)&self->_eventFilterEndDate, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_eventFilterEndDate, 0);
  objc_storeStrong((id *)&self->_eventFilterStartDate, 0);
}

@end
