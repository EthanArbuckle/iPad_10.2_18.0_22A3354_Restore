@implementation WFCalendarEventFiltering

+ (id)itemsToQueryForPredicate:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  BOOL v11;
  NSObject *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v22;
  _QWORD v23[4];
  id v24;
  _QWORD v25[4];
  id v26;
  uint8_t buf[4];
  const char *v28;
  __int16 v29;
  id v30;
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  WFRequiredContentComparisonPredicatesFromPredicate(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("property.propertyClass = %@ AND value != nil"), objc_opt_class());
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "filteredArrayUsingPredicate:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "if_objectsPassingTest:", &__block_literal_global_16993);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "valueForKeyPath:", CFSTR("@max.value"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "if_objectsPassingTest:", &__block_literal_global_11_16995);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "valueForKeyPath:", CFSTR("@min.value"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
    v11 = v10 == 0;
  else
    v11 = 1;
  if (v11)
  {
    getWFGeneralLogObject();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v28 = "+[WFCalendarEventFiltering itemsToQueryForPredicate:]";
      v29 = 2112;
      v30 = v3;
      _os_log_impl(&dword_20BBAD000, v12, OS_LOG_TYPE_ERROR, "%s Failed to parse calendar predicate %@", buf, 0x16u);
    }
    v13 = 0;
  }
  else
  {
    v22 = v4;
    if (objc_msgSend(v8, "isEqualToDate:", v10))
    {
      objc_msgSend(v10, "dateByAddingTimeInterval:", 60.0);
      v14 = objc_claimAutoreleasedReturnValue();

      v10 = (void *)v14;
    }
    WFGetWorkflowEventStore();
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "calendarsForEntityType:", 0);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = MEMORY[0x24BDAC760];
    v25[0] = MEMORY[0x24BDAC760];
    v25[1] = 3221225472;
    v25[2] = __53__WFCalendarEventFiltering_itemsToQueryForPredicate___block_invoke_3;
    v25[3] = &unk_24C4E0E78;
    v26 = v3;
    objc_msgSend(v16, "if_objectsPassingTest:", v25);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v15, "predicateForEventsWithStartDate:endDate:calendars:", v8, v10, v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "eventsMatchingPredicate:", v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v23[0] = v17;
    v23[1] = 3221225472;
    v23[2] = __53__WFCalendarEventFiltering_itemsToQueryForPredicate___block_invoke_4;
    v23[3] = &unk_24C4E0EA0;
    v24 = v15;
    v12 = v15;
    objc_msgSend(v20, "if_map:", v23);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    v4 = v22;
  }

  return v13;
}

uint64_t __53__WFCalendarEventFiltering_itemsToQueryForPredicate___block_invoke_3(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(a2, "title");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  WFEKCalendarMatchesContentPredicate(v2, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "BOOLValue");

  return v5;
}

WFCalendarEventContentItem *__53__WFCalendarEventFiltering_itemsToQueryForPredicate___block_invoke_4(uint64_t a1, uint64_t a2)
{
  return +[WFCalendarEventContentItem itemWithEKEvent:fromEventStore:](WFCalendarEventContentItem, "itemWithEKEvent:fromEventStore:", a2, *(_QWORD *)(a1 + 32));
}

BOOL __53__WFCalendarEventFiltering_itemsToQueryForPredicate___block_invoke_2(uint64_t a1, void *a2)
{
  unint64_t v2;

  v2 = objc_msgSend(a2, "comparisonType");
  return v2 < 2 || v2 == 4;
}

BOOL __53__WFCalendarEventFiltering_itemsToQueryForPredicate___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2;

  v2 = objc_msgSend(a2, "comparisonType");
  return v2 == 4 || (v2 & 0xFFFFFFFFFFFFFFFELL) == 2;
}

@end
