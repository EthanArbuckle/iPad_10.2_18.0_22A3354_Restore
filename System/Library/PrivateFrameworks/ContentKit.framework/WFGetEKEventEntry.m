@implementation WFGetEKEventEntry

id __WFGetEKEventEntry_block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  double v6;
  double v7;
  void *v8;
  double v9;
  double v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t i;
  void *v21;
  void *v22;
  void *v23;
  char v24;
  id v25;
  void *v26;
  void *v28;
  void *v29;
  id v30;
  void *v31;
  id value;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  _BYTE v37[128];
  uint64_t v38;

  v38 = *MEMORY[0x24BDAC8D0];
  v2 = a2;
  WFGetWorkflowEventStore();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "wfObjectOfClass:forKey:", objc_opt_class(), CFSTR("link.contentkit.ekcalendaritem"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "wfObjectOfClass:forKey:", objc_opt_class(), CFSTR("startDate"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "doubleValue");
  v7 = v6;

  objc_msgSend(v4, "wfObjectOfClass:forKey:", objc_opt_class(), CFSTR("endDate"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "doubleValue");
  v10 = v9;

  objc_msgSend(MEMORY[0x24BDBCE60], "dateWithTimeIntervalSince1970:", v7);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCE60], "dateWithTimeIntervalSince1970:", v10);
  v12 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "wfObjectOfClass:forKey:", objc_opt_class(), CFSTR("calendarItemIdentifier"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "wfObjectOfClass:forKey:", objc_opt_class(), CFSTR("calendarItemExternalIdentifier"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  v36 = 0u;
  v31 = (void *)v12;
  objc_msgSend(v3, "predicateForEventsWithStartDate:endDate:calendars:", v11, v12, 0);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  value = v3;
  objc_msgSend(v3, "eventsMatchingPredicate:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
  if (v17)
  {
    v18 = v17;
    v19 = *(_QWORD *)v34;
    v29 = v4;
    v30 = v2;
    v28 = v11;
    while (2)
    {
      for (i = 0; i != v18; ++i)
      {
        if (*(_QWORD *)v34 != v19)
          objc_enumerationMutation(v16);
        v21 = *(void **)(*((_QWORD *)&v33 + 1) + 8 * i);
        objc_msgSend(v21, "calendarItemIdentifier");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v22, "isEqualToString:", v13))
        {

LABEL_12:
          v26 = value;
          objc_setAssociatedObject(v21, &WFDeserializingEventStoreKey, value, (void *)1);
          v25 = v21;

          v4 = v29;
          v2 = v30;
          v11 = v28;
          goto LABEL_13;
        }
        objc_msgSend(v21, "calendarItemExternalIdentifier");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v24 = objc_msgSend(v23, "isEqualToString:", v14);

        if ((v24 & 1) != 0)
          goto LABEL_12;
      }
      v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
      v4 = v29;
      v2 = v30;
      v11 = v28;
      if (v18)
        continue;
      break;
    }
  }

  WFGetEKCalendarItemFromSerializedRepresentation(v2);
  v25 = (id)objc_claimAutoreleasedReturnValue();
  v26 = value;
LABEL_13:

  return v25;
}

id __WFGetEKEventEntry_block_invoke(uint64_t a1, void *a2)
{
  id v2;
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  v2 = a2;
  getEKCalendarItemClass();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v3 = v2;
    WFGetSerializedRepresentationForEKCalendarItem(v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (void *)objc_msgSend(v4, "mutableCopy");

    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("link.contentkit.ekcalendaritem"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)objc_msgSend(v6, "mutableCopy");

    v8 = (void *)MEMORY[0x24BDD16E0];
    objc_msgSend(v3, "startDate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "timeIntervalSince1970");
    objc_msgSend(v8, "numberWithDouble:");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setObject:forKey:", v10, CFSTR("startDate"));

    v11 = (void *)MEMORY[0x24BDD16E0];
    objc_msgSend(v3, "endDate");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v12, "timeIntervalSince1970");
    objc_msgSend(v11, "numberWithDouble:");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setObject:forKey:", v13, CFSTR("endDate"));

    objc_msgSend(v5, "setObject:forKeyedSubscript:", v7, CFSTR("link.contentkit.ekcalendaritem"));
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

@end
