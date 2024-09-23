@implementation WFRemoveCalendarItemsAction

- (unint64_t)entityType
{
  void *v2;
  void *v3;
  int v4;

  -[WFRemoveCalendarItemsAction definition](self, "definition");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", CFSTR("WFCalendarItemEntityType"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", CFSTR("Event"));

  return v4 ^ 1u;
}

- (Class)contentItemClass
{
  void *v2;
  void *v3;

  -[WFRemoveCalendarItemsAction definition](self, "definition");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", CFSTR("WFCalendarItemEntityType"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "isEqualToString:", CFSTR("Event"));

  objc_opt_class();
  return (Class)(id)objc_claimAutoreleasedReturnValue();
}

- (id)accessResource
{
  void *v3;
  void *v4;
  void *v5;

  -[WFRemoveCalendarItemsAction resourceManager](self, "resourceManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFRemoveCalendarItemsAction entityType](self, "entityType");
  objc_msgSend(v3, "resourceObjectsOfClass:", objc_opt_class());
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "anyObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)runAsynchronouslyWithInput:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  id v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[WFRemoveCalendarItemsAction accessResource](self, "accessResource");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "status") == 4)
  {
    -[WFRemoveCalendarItemsAction entityType](self, "entityType");
    v22 = 0;
    objc_msgSend(v4, "collectionByFilteringToItemClass:excludedItems:", objc_opt_class(), &v22);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v22;
    objc_msgSend(v6, "items");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    v20 = 0u;
    v21 = 0u;
    v18 = 0u;
    v19 = 0u;
    v17 = v7;
    objc_msgSend(v7, "items");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v18, v23, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v19;
      do
      {
        v13 = 0;
        do
        {
          if (*(_QWORD *)v19 != v12)
            objc_enumerationMutation(v9);
          v14 = *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * v13);
          -[WFRemoveCalendarItemsAction output](self, "output");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "addItem:", v14);

          ++v13;
        }
        while (v11 != v13);
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v18, v23, 16);
      }
      while (v11);
    }

    if (objc_msgSend(v8, "count"))
      -[WFRemoveCalendarItemsAction deleteItems:](self, "deleteItems:", v8);
    else
      -[WFRemoveCalendarItemsAction finishRunningWithError:](self, "finishRunningWithError:", 0);

  }
  else
  {
    objc_msgSend(v5, "availabilityError");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFRemoveCalendarItemsAction finishRunningWithError:](self, "finishRunningWithError:", v16);

  }
}

- (void)deleteItems:(id)a3
{
  void *v4;
  void *v5;
  objc_class *v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  unsigned int v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t j;
  void *v21;
  void *v22;
  void *v23;
  char v24;
  id v25;
  id v26;
  _QWORD v27[5];
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  id v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  _QWORD v37[5];
  uint64_t v38;
  uint64_t *v39;
  uint64_t v40;
  uint64_t v41;
  _BYTE v42[128];
  _BYTE v43[128];
  uint64_t v44;

  v44 = *MEMORY[0x24BDAC8D0];
  v26 = a3;
  if (-[WFRemoveCalendarItemsAction entityType](self, "entityType"))
  {
    WFGetWorkflowReminderStore();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v38 = 0;
    v39 = &v38;
    v40 = 0x2050000000;
    v5 = (void *)getREMSaveRequestClass_softClass;
    v41 = getREMSaveRequestClass_softClass;
    if (!getREMSaveRequestClass_softClass)
    {
      v37[0] = MEMORY[0x24BDAC760];
      v37[1] = 3221225472;
      v37[2] = __getREMSaveRequestClass_block_invoke;
      v37[3] = &unk_24F8BB430;
      v37[4] = &v38;
      __getREMSaveRequestClass_block_invoke((uint64_t)v37);
      v5 = (void *)v39[3];
    }
    v6 = objc_retainAutorelease(v5);
    _Block_object_dispose(&v38, 8);
    v7 = (void *)objc_msgSend([v6 alloc], "initWithStore:", v4);
    v30 = 0u;
    v31 = 0u;
    v28 = 0u;
    v29 = 0u;
    v8 = v26;
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v28, v42, 16);
    if (v9)
    {
      v10 = *(_QWORD *)v29;
      do
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v29 != v10)
            objc_enumerationMutation(v8);
          objc_msgSend(*(id *)(*((_QWORD *)&v28 + 1) + 8 * i), "reminder");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "updateReminder:", v12);
          v13 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v13, "removeFromList");
        }
        v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v28, v42, 16);
      }
      while (v9);
    }

    dispatch_get_global_queue(0, 0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v27[0] = MEMORY[0x24BDAC760];
    v27[1] = 3221225472;
    v27[2] = __43__WFRemoveCalendarItemsAction_deleteItems___block_invoke;
    v27[3] = &unk_24F8BB370;
    v27[4] = self;
    objc_msgSend(v7, "saveWithQueue:completion:", v14, v27);

  }
  else
  {
    -[WFRemoveCalendarItemsAction parameterValueForKey:ofClass:](self, "parameterValueForKey:ofClass:", CFSTR("WFCalendarIncludeFutureEvents"), objc_opt_class());
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "BOOLValue");

    v35 = 0u;
    v36 = 0u;
    v34 = 0u;
    v33 = 0u;
    v17 = v26;
    v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v33, v43, 16);
    if (v18)
    {
      v19 = *(_QWORD *)v34;
      while (2)
      {
        for (j = 0; j != v18; ++j)
        {
          if (*(_QWORD *)v34 != v19)
            objc_enumerationMutation(v17);
          v21 = *(void **)(*((_QWORD *)&v33 + 1) + 8 * j);
          objc_msgSend(v21, "eventStore");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "event");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          v32 = 0;
          v24 = objc_msgSend(v22, "removeEvent:span:commit:error:", v23, v16, 1, &v32);
          v25 = v32;

          if ((v24 & 1) == 0)
          {
            -[WFRemoveCalendarItemsAction finishRunningWithError:](self, "finishRunningWithError:", v25);

            goto LABEL_22;
          }

        }
        v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v33, v43, 16);
        if (v18)
          continue;
        break;
      }
    }

    -[WFRemoveCalendarItemsAction finishRunningWithError:](self, "finishRunningWithError:", 0);
  }
LABEL_22:

}

- (id)contentDestinationWithError:(id *)a3
{
  return 0;
}

uint64_t __43__WFRemoveCalendarItemsAction_deleteItems___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "finishRunningWithError:", a2);
}

@end
