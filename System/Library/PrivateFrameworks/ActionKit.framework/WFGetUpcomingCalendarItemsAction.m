@implementation WFGetUpcomingCalendarItemsAction

- (void)wasAddedToWorkflow:(id)a3
{
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)WFGetUpcomingCalendarItemsAction;
  -[WFGetUpcomingCalendarItemsAction wasAddedToWorkflow:](&v5, sel_wasAddedToWorkflow_, a3);
  -[WFGetUpcomingCalendarItemsAction resourceManager](self, "resourceManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addTarget:selector:", self, sel_updateCalendars);

}

- (void)wasRemovedFromWorkflow:(id)a3
{
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)WFGetUpcomingCalendarItemsAction;
  -[WFGetUpcomingCalendarItemsAction wasRemovedFromWorkflow:](&v5, sel_wasRemovedFromWorkflow_, a3);
  -[WFGetUpcomingCalendarItemsAction resourceManager](self, "resourceManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeTarget:selector:", self, sel_updateCalendars);

}

- (void)updateCalendars
{
  id v2;

  -[WFGetUpcomingCalendarItemsAction parameterForKey:](self, "parameterForKey:", CFSTR("WFGetUpcomingItemCalendar"));
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v2, "loadPossibleStatesWithCompletionHandler:", &__block_literal_global_5353);
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      objc_msgSend(v2, "reloadStates");
  }

}

- (void)runAsynchronouslyWithInput:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  uint64_t v32;
  double v33;
  unint64_t v34;
  uint64_t v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  uint64_t v41;
  void *v42;
  void *v43;
  id v44;
  BOOL v45;
  void *v46;
  void *v47;
  id v48;
  void *v49;
  void *v50;
  void *v51;
  id v52;
  void *v53;
  int v54;
  int v55;
  id v56;
  void *v57;
  void *v58;
  void *v59;
  int v60;
  void *v61;
  uint64_t v62;
  _QWORD v63[5];
  _QWORD v64[5];
  id v65;
  _QWORD v66[4];
  id v67;
  uint64_t *v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t *v71;
  uint64_t v72;
  char v73;
  _QWORD v74[3];

  v74[1] = *MEMORY[0x24BDAC8D0];
  v56 = a3;
  -[WFGetUpcomingCalendarItemsAction parameterValueForKey:ofClass:](self, "parameterValueForKey:ofClass:", CFSTR("WFGetUpcomingItemCount"), objc_opt_class());
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v62 = objc_msgSend(v4, "integerValue");

  -[WFGetUpcomingCalendarItemsAction definition](self, "definition");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", CFSTR("WFGetUpcomingItemType"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "unsignedIntegerValue");

  -[WFGetUpcomingCalendarItemsAction parameterValueForKey:ofClass:](self, "parameterValueForKey:ofClass:", CFSTR("WFGetUpcomingItemCalendar"), objc_opt_class());
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFGetUpcomingCalendarItemsAction resourceManager](self, "resourceManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "resourceObjectsOfClass:", objc_opt_class());
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "anyObject");
  v58 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v58, "status") != 4)
  {
    objc_msgSend(v58, "availabilityError");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFGetUpcomingCalendarItemsAction finishRunningWithError:](self, "finishRunningWithError:", v30);

    goto LABEL_26;
  }
  if (!v7)
  {
    WFGetWorkflowEventStore();
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "calendarsForEntityType:", 0);
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    if (v57)
    {
      objc_msgSend(v57, "matchingCalendarsFromArray:", v61);
      v32 = objc_claimAutoreleasedReturnValue();

      v61 = (void *)v32;
    }
    v59 = (void *)objc_opt_new();
    -[WFGetUpcomingCalendarItemsAction parameterValueForKey:ofClass:](self, "parameterValueForKey:ofClass:", CFSTR("WFDateSpecifier"), objc_opt_class());
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    v60 = objc_msgSend(v53, "isEqualToString:", CFSTR("Today"));
    v55 = objc_msgSend(v53, "isEqualToString:", CFSTR("Tomorrow"));
    v54 = objc_msgSend(v53, "isEqualToString:", CFSTR("Specified Day"));
    v33 = 0.0;
    v34 = -86400;
    v35 = 86400;
    while (1)
    {
      v70 = 0;
      v71 = &v70;
      v72 = 0x2020000000;
      v73 = 0;
      if (v60)
        break;
      if (v55)
      {
        objc_msgSend(MEMORY[0x24BDBCE48], "currentCalendar", v33);
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDBCE60], "date");
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v36, "components:fromDate:", 28, v42);
        v38 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v38, "setDay:", objc_msgSend(v38, "day") + 1);
        objc_msgSend(v36, "dateFromComponents:", v38);
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v38, "setDay:", objc_msgSend(v38, "day") + 1);
        objc_msgSend(v36, "dateFromComponents:", v38);
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v31, "predicateForEventsWithStartDate:endDate:calendars:", v39, v40, v61);
        v41 = objc_claimAutoreleasedReturnValue();
        goto LABEL_14;
      }
      if (v54)
      {
        -[WFGetUpcomingCalendarItemsAction parameterValueForKey:ofClass:](self, "parameterValueForKey:ofClass:", CFSTR("WFSpecifiedDate"), objc_opt_class());
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        v47 = v46;
        if (v46)
        {
          v48 = v46;
        }
        else
        {
          objc_msgSend(MEMORY[0x24BDBCE60], "date");
          v48 = (id)objc_claimAutoreleasedReturnValue();
        }
        v36 = v48;

        objc_msgSend(MEMORY[0x24BDBCE48], "currentCalendar");
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v38, "components:fromDate:", 28, v36);
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v38, "dateFromComponents:", v39);
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v39, "setDay:", objc_msgSend(v39, "day") + 1);
        objc_msgSend(v38, "dateFromComponents:", v39);
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v31, "predicateForEventsWithStartDate:endDate:calendars:", v40, v49, v61);
        v43 = (void *)objc_claimAutoreleasedReturnValue();

        goto LABEL_15;
      }
      v73 = 1;
      objc_msgSend(MEMORY[0x24BDBCE60], "dateWithTimeIntervalSinceNow:", v33);
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDBCE60], "dateWithTimeIntervalSinceNow:", (double)v35);
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "predicateForEventsWithStartDate:endDate:calendars:", v36, v38, v61);
      v43 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_16:

      v66[0] = MEMORY[0x24BDAC760];
      v66[1] = 3221225472;
      v66[2] = __63__WFGetUpcomingCalendarItemsAction_runAsynchronouslyWithInput___block_invoke;
      v66[3] = &unk_24F8B0FE0;
      v44 = v59;
      v67 = v44;
      v68 = &v70;
      v69 = v62;
      objc_msgSend(v31, "enumerateEventsMatchingPredicate:usingBlock:", v43, v66);
      v45 = *((_BYTE *)v71 + 24) == 0;

      _Block_object_dispose(&v70, 8);
      if (!v45)
      {
        v33 = (double)v35;
        v35 += 86400;
        v34 += 86400;
        if (v34 <= 0x784CDFF)
          continue;
      }
      objc_msgSend(v44, "allValues");
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v50, "sortedArrayUsingSelector:", sel_compareStartDateWithEvent_);
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      v64[0] = MEMORY[0x24BDAC760];
      v64[1] = 3221225472;
      v64[2] = __63__WFGetUpcomingCalendarItemsAction_runAsynchronouslyWithInput___block_invoke_2;
      v64[3] = &unk_24F8B1008;
      v64[4] = self;
      v65 = v31;
      v52 = v31;
      objc_msgSend(v51, "enumerateObjectsUsingBlock:", v64);

      -[WFGetUpcomingCalendarItemsAction finishRunningWithError:](self, "finishRunningWithError:", 0);
      goto LABEL_26;
    }
    objc_msgSend(MEMORY[0x24BDBCE48], "currentCalendar", v33);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDBCE60], "date");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "components:fromDate:", 28, v37);
    v38 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v38, "setDay:", objc_msgSend(v38, "day") + 1);
    objc_msgSend(MEMORY[0x24BDBCE60], "date");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "dateFromComponents:", v38);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "predicateForEventsWithStartDate:endDate:calendars:", v39, v40, v61);
    v41 = objc_claimAutoreleasedReturnValue();
LABEL_14:
    v43 = (void *)v41;
LABEL_15:

    goto LABEL_16;
  }
  v10 = (void *)objc_opt_new();
  v11 = (void *)MEMORY[0x24BE195D8];
  WFReminderPropertyNameDueDate();
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "propertyForName:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = (void *)MEMORY[0x24BE195D8];
  WFReminderPropertyNameList();
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "propertyForName:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  v17 = (void *)MEMORY[0x24BE195D8];
  WFReminderPropertyNameIsCompleted();
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "propertyForName:", v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(v57, "allCalendars") & 1) == 0)
  {
    v20 = (void *)MEMORY[0x24BE19440];
    objc_msgSend(v57, "calendarTitle");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "predicateWithValue:forProperty:comparisonType:", v21, v16, 4);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addObject:", v22);

  }
  objc_msgSend(MEMORY[0x24BE19440], "predicateWithValue:forProperty:comparisonType:", MEMORY[0x24BDBD1C0], v19, 4);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "addObject:", v23);

  objc_msgSend(MEMORY[0x24BE19448], "andPredicateWithSubpredicates:", v10);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE19498]), "initWithPredicate:", v24);
  objc_msgSend(MEMORY[0x24BE194A0], "sortDescriptorWithProperty:ascending:comparator:", v13, 1, 0);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v74[0] = v26;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v74, 1);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "setSortDescriptors:", v27);

  objc_msgSend(v25, "setSlice:", 0x7FFFFFFFFFFFFFFFLL, v62);
  v28 = (void *)MEMORY[0x24BE195D8];
  -[WFGetUpcomingCalendarItemsAction contentPermissionRequestor](self, "contentPermissionRequestor");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v63[0] = MEMORY[0x24BDAC760];
  v63[1] = 3221225472;
  v63[2] = __63__WFGetUpcomingCalendarItemsAction_runAsynchronouslyWithInput___block_invoke_3;
  v63[3] = &unk_24F8BB6B0;
  v63[4] = self;
  objc_msgSend(v28, "runQuery:withItems:permissionRequestor:completionHandler:", v25, 0, v29, v63);

LABEL_26:
}

void __63__WFGetUpcomingCalendarItemsAction_runAsynchronouslyWithInput___block_invoke(uint64_t a1, void *a2, _BYTE *a3)
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v5 = a2;
  v6 = *(void **)(a1 + 32);
  v11 = v5;
  objc_msgSend(v5, "eventIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKey:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v8)
  {
    v9 = *(void **)(a1 + 32);
    objc_msgSend(v11, "eventIdentifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setObject:forKey:", v11, v10);

  }
  if (objc_msgSend(*(id *)(a1 + 32), "count") == *(_QWORD *)(a1 + 48))
  {
    *a3 = 1;
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 0;
  }

}

void __63__WFGetUpcomingCalendarItemsAction_runAsynchronouslyWithInput___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  id v6;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "output");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BE193E0], "itemWithEKEvent:fromEventStore:", v4, *(_QWORD *)(a1 + 40));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "addItem:", v5);
}

void __63__WFGetUpcomingCalendarItemsAction_runAsynchronouslyWithInput___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v14;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v14 != v9)
          objc_enumerationMutation(v5);
        v11 = *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * v10);
        objc_msgSend(*(id *)(a1 + 32), "output");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "addItem:", v11);

        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v8);
  }
  objc_msgSend(*(id *)(a1 + 32), "finishRunningWithError:", v6);

}

@end
