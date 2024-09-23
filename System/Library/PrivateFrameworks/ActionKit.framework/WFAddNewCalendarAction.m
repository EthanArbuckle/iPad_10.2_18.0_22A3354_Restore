@implementation WFAddNewCalendarAction

- (void)runAsynchronouslyWithInput:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  id v19;
  _QWORD v20[4];
  id v21;
  uint64_t v22;
  _QWORD v23[2];

  v23[1] = *MEMORY[0x24BDAC8D0];
  -[WFAddNewCalendarAction parameterValueForKey:ofClass:](self, "parameterValueForKey:ofClass:", CFSTR("CalendarName"), objc_opt_class());
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "length"))
  {
    v5 = objc_alloc_init(MEMORY[0x24BDC74E8]);
    objc_msgSend(v5, "calendarsForEntityType:", 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v20[0] = MEMORY[0x24BDAC760];
    v20[1] = 3221225472;
    v20[2] = __53__WFAddNewCalendarAction_runAsynchronouslyWithInput___block_invoke;
    v20[3] = &unk_24F8BA7A0;
    v7 = v4;
    v21 = v7;
    objc_msgSend(v6, "if_firstObjectPassingTest:", v20);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      -[WFAddNewCalendarAction finishWithCalendar:error:](self, "finishWithCalendar:error:", v8, 0);
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDC7488], "calendarForEntityType:eventStore:", 0, v5);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "setTitle:", v7);
      objc_msgSend(v5, "defaultCalendarForNewEvents");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "source");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      if (v15)
      {
        objc_msgSend(v13, "setSource:", v15);
      }
      else
      {
        objc_msgSend(v5, "sources");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "if_firstObjectPassingTest:", &__block_literal_global_46208);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "setSource:", v17);

      }
      v19 = 0;
      objc_msgSend(v5, "saveCalendar:commit:error:", v13, 1, &v19);
      v18 = v19;
      -[WFAddNewCalendarAction finishWithCalendar:error:](self, "finishWithCalendar:error:", v13, v18);

    }
  }
  else
  {
    v9 = (void *)MEMORY[0x24BDD1540];
    v10 = *MEMORY[0x24BEC4270];
    v22 = *MEMORY[0x24BDD0FC8];
    WFLocalizedString(CFSTR("No calendar name was provided. Please provide a name for this calendar."));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v23[0] = v11;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v23, &v22, 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "errorWithDomain:code:userInfo:", v10, 5, v12);
    v5 = (id)objc_claimAutoreleasedReturnValue();

    -[WFAddNewCalendarAction finishRunningWithError:](self, "finishRunningWithError:", v5);
  }

}

- (void)finishWithCalendar:(id)a3 error:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a4;
  if (a3)
  {
    v6 = a3;
    -[WFAddNewCalendarAction output](self, "output");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "title");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v7, "addObject:", v8);
  }
  -[WFAddNewCalendarAction finishRunningWithError:](self, "finishRunningWithError:", v9);

}

- (id)preferredSourceWithStore:(id)a3
{
  void *v3;
  void *v4;

  objc_msgSend(a3, "sources");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "if_firstObjectPassingTest:", &__block_literal_global_127);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

BOOL __51__WFAddNewCalendarAction_preferredSourceWithStore___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "sourceType") < 4;
}

BOOL __53__WFAddNewCalendarAction_runAsynchronouslyWithInput___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  _BOOL8 v4;

  objc_msgSend(a2, "title");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "localizedStandardCompare:", *(_QWORD *)(a1 + 32)) == 0;

  return v4;
}

BOOL __53__WFAddNewCalendarAction_runAsynchronouslyWithInput___block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  _BOOL8 v3;

  v2 = a2;
  if (objc_msgSend(v2, "allowsCalendarAddDeleteModify"))
    v3 = objc_msgSend(v2, "sourceType") < 4;
  else
    v3 = 0;

  return v3;
}

@end
