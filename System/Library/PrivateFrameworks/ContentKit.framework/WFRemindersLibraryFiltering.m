@implementation WFRemindersLibraryFiltering

+ (void)performCustomFilteringUsingContentPredicates:(id)a3 compoundPredicateType:(unint64_t)a4 forQuery:(id)a5 withInput:(id)a6 resultHandler:(id)a7
{
  id v11;
  void *v12;
  void *v13;
  uint64_t v14;
  NSObject *v15;
  const __CFString *v16;
  void *v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t i;
  void *v22;
  void *v23;
  void *v24;
  _BOOL4 v25;
  void *v26;
  BOOL v27;
  id v28;
  void *v29;
  uint64_t v30;
  uint64_t j;
  id v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  int v37;
  uint64_t v38;
  void *v39;
  void *v40;
  void *v41;
  int v42;
  void *v43;
  void *v44;
  void *v45;
  int v46;
  void *v47;
  _BOOL4 v48;
  _BOOL4 v49;
  void *v50;
  void *v51;
  void *v52;
  id v53;
  void *v54;
  void *v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  id v59;
  void *v60;
  void *v61;
  uint64_t v62;
  void *v63;
  id v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t k;
  void *v68;
  BOOL v69;
  id obj;
  id obja;
  id v73;
  id v74;
  uint64_t v75;
  id v76;
  id v77;
  unint64_t v78;
  id v79;
  void *v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  _QWORD v85[4];
  id v86;
  id v87;
  _QWORD v88[4];
  id v89;
  id v90;
  id v91;
  _QWORD v92[5];
  __int128 v93;
  __int128 v94;
  __int128 v95;
  __int128 v96;
  __int128 v97;
  __int128 v98;
  __int128 v99;
  __int128 v100;
  _BYTE v101[128];
  _BYTE v102[128];
  void *v103;
  _BYTE buf[24];
  void *v105;
  __int128 *v106;
  uint64_t v107;

  v107 = *MEMORY[0x24BDAC8D0];
  v11 = a3;
  v79 = a5;
  v74 = a6;
  v77 = a7;
  v78 = a4;
  if (!a4)
  {
    objc_msgSend(v11, "firstObject");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    +[WFContentCompoundPredicate notPredicateWithSubpredicate:](WFContentCompoundPredicate, "notPredicateWithSubpredicate:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v103 = v13;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v103, 1);
    v14 = objc_claimAutoreleasedReturnValue();

    v78 = 1;
    v11 = (id)v14;
  }
  if (getWFRemindersLibraryFilteringLogObject_onceToken != -1)
    dispatch_once(&getWFRemindersLibraryFilteringLogObject_onceToken, &__block_literal_global_5472);
  v15 = (id)getWFRemindersLibraryFilteringLogObject_log;
  if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
  {
    v16 = CFSTR("OR");
    *(_QWORD *)&buf[4] = "+[WFRemindersLibraryFiltering performCustomFilteringUsingContentPredicates:compoundPredicateTyp"
                         "e:forQuery:withInput:resultHandler:]";
    *(_DWORD *)buf = 136315650;
    if (v78 == 1)
      v16 = CFSTR("AND");
    *(_WORD *)&buf[12] = 2114;
    *(_QWORD *)&buf[14] = v16;
    *(_WORD *)&buf[22] = 2112;
    v105 = v11;
    _os_log_impl(&dword_20BBAD000, v15, OS_LOG_TYPE_INFO, "%s Filtering using predicate of type %{public}@ and subpredicates %@", buf, 0x20u);
  }

  v80 = (void *)objc_opt_new();
  v17 = (void *)objc_opt_new();
  v95 = 0u;
  v96 = 0u;
  v93 = 0u;
  v94 = 0u;
  v18 = v11;
  v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v93, v102, 16);
  if (v19)
  {
    v20 = *(_QWORD *)v94;
    do
    {
      for (i = 0; i != v19; ++i)
      {
        if (*(_QWORD *)v94 != v20)
          objc_enumerationMutation(v18);
        v22 = *(void **)(*((_QWORD *)&v93 + 1) + 8 * i);
        WFReminderPredicateDescriptorFromContentPredicate(v22);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        if (v23)
          objc_msgSend(v17, "addObject:", v23);
        else
          objc_msgSend(v80, "addObject:", v22);

      }
      v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v93, v102, 16);
    }
    while (v19);
  }

  if (v78 == 2 && objc_msgSend(v80, "count"))
  {
    v92[0] = MEMORY[0x24BDAC760];
    v92[1] = 3221225472;
    v92[2] = __131__WFRemindersLibraryFiltering_performCustomFilteringUsingContentPredicates_compoundPredicateType_forQuery_withInput_resultHandler___block_invoke;
    v92[3] = &__block_descriptor_40_e60_v32__0__WFContentPredicate_8Q16___v____NSArray___NSError__24l;
    v92[4] = a1;
    v88[0] = MEMORY[0x24BDAC760];
    v88[1] = 3221225472;
    v88[2] = __131__WFRemindersLibraryFiltering_performCustomFilteringUsingContentPredicates_compoundPredicateType_forQuery_withInput_resultHandler___block_invoke_3;
    v88[3] = &unk_24C4DF260;
    v91 = a1;
    v89 = v79;
    v90 = v77;
    objc_msgSend(v18, "if_flatMapAsynchronously:completionHandler:", v92, v88);

    v24 = v89;
  }
  else
  {
    if (objc_msgSend(v80, "count")
      || (objc_msgSend(v79, "sortDescriptors"),
          v26 = (void *)objc_claimAutoreleasedReturnValue(),
          v27 = objc_msgSend(v26, "count") == 0,
          v26,
          v27))
    {
      v73 = 0;
      v25 = 1;
    }
    else
    {
      objc_msgSend(v79, "sortDescriptors");
      v28 = (id)objc_claimAutoreleasedReturnValue();
      v29 = (void *)objc_opt_new();
      v99 = 0u;
      v100 = 0u;
      v97 = 0u;
      v98 = 0u;
      obj = v28;
      v30 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v97, buf, 16);
      if (v30)
      {
        v75 = *(_QWORD *)v98;
        while (2)
        {
          for (j = 0; j != v30; ++j)
          {
            if (*(_QWORD *)v98 != v75)
              objc_enumerationMutation(obj);
            v32 = *(id *)(*((_QWORD *)&v97 + 1) + 8 * j);
            objc_msgSend(v32, "comparator");
            v33 = (void *)objc_claimAutoreleasedReturnValue();

            if (v33)
            {
LABEL_41:

LABEL_42:
              v73 = 0;
              goto LABEL_43;
            }
            objc_msgSend(v32, "property");
            v34 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v34, "name");
            v35 = (void *)objc_claimAutoreleasedReturnValue();
            WFLocalizedContentPropertyNameMarker(CFSTR("Creation Date"));
            v36 = (void *)objc_claimAutoreleasedReturnValue();
            v37 = objc_msgSend(v35, "isEqualToString:", v36);

            if (v37)
            {
              objc_msgSend(getREMReminderSortDescriptorClass(), "sortDescriptorSortingByCreationDateAscending:", objc_msgSend(v32, "ascending"));
              v38 = objc_claimAutoreleasedReturnValue();
            }
            else
            {
              objc_msgSend(v32, "property");
              v39 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v39, "name");
              v40 = (void *)objc_claimAutoreleasedReturnValue();
              WFLocalizedContentPropertyNameMarker(CFSTR("Due Date"));
              v41 = (void *)objc_claimAutoreleasedReturnValue();
              v42 = objc_msgSend(v40, "isEqualToString:", v41);

              if (v42)
              {
                objc_msgSend(getREMReminderSortDescriptorClass(), "sortDescriptorSortingByDueDateAscending:", objc_msgSend(v32, "ascending"));
                v38 = objc_claimAutoreleasedReturnValue();
              }
              else
              {
                objc_msgSend(v32, "property");
                v43 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v43, "name");
                v44 = (void *)objc_claimAutoreleasedReturnValue();
                WFLocalizedContentPropertyNameMarker(CFSTR("Priority"));
                v45 = (void *)objc_claimAutoreleasedReturnValue();
                v46 = objc_msgSend(v44, "isEqualToString:", v45);

                if (!v46)
                  goto LABEL_41;
                objc_msgSend(getREMReminderSortDescriptorClass(), "sortDescriptorSortingByPriorityAscending:", objc_msgSend(v32, "ascending"));
                v38 = objc_claimAutoreleasedReturnValue();
              }
            }
            v47 = (void *)v38;

            if (!v47)
              goto LABEL_42;
            objc_msgSend(v29, "addObject:", v47);

          }
          v30 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v97, buf, 16);
          if (v30)
            continue;
          break;
        }
      }

      v73 = v29;
LABEL_43:

      v25 = v73 != 0;
    }
    if (objc_msgSend(v80, "count"))
      v48 = 0;
    else
      v48 = v25;
    v69 = v48;
    if (v79)
      v49 = v48;
    else
      v49 = 0;
    WFGetWorkflowReminderStore();
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v17, "count"))
    {
      WFCompoundReminderPredicateDescriptorWithSubpredicates(v17, v78);
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      *(_QWORD *)&v97 = 0;
      *((_QWORD *)&v97 + 1) = &v97;
      *(_QWORD *)&v98 = 0x2050000000;
      v52 = (void *)getREMReminderClass_softClass_5442;
      *((_QWORD *)&v98 + 1) = getREMReminderClass_softClass_5442;
      if (!getREMReminderClass_softClass_5442)
      {
        *(_QWORD *)buf = MEMORY[0x24BDAC760];
        *(_QWORD *)&buf[8] = 3221225472;
        *(_QWORD *)&buf[16] = __getREMReminderClass_block_invoke_5443;
        v105 = &unk_24C4E3118;
        v106 = &v97;
        __getREMReminderClass_block_invoke_5443((uint64_t)buf);
        v52 = *(void **)(*((_QWORD *)&v97 + 1) + 24);
      }
      v53 = objc_retainAutorelease(v52);
      _Block_object_dispose(&v97, 8);
      objc_msgSend(v53, "fetchRequestWithPredicateDescriptor:sortDescriptors:", v51, v73);
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      v87 = 0;
      objc_msgSend(v50, "executeFetchRequest:error:", v54, &v87);
      v76 = (id)objc_claimAutoreleasedReturnValue();
      obja = v87;

    }
    else
    {
      v55 = (void *)objc_opt_new();
      v85[0] = MEMORY[0x24BDAC760];
      v85[1] = 3221225472;
      v85[2] = __131__WFRemindersLibraryFiltering_performCustomFilteringUsingContentPredicates_compoundPredicateType_forQuery_withInput_resultHandler___block_invoke_4;
      v85[3] = &unk_24C4DD5B8;
      v76 = v55;
      v86 = v76;
      objc_msgSend(v50, "enumerateAllRemindersWithBlock:", v85);
      obja = 0;
      v51 = v86;
    }

    if (v76)
    {
      v56 = objc_msgSend(v79, "slice");
      v58 = v57;
      v59 = v76;
      v60 = v59;
      if (v49)
      {
        WFIndexSetFromContentSlice(v56, v58, objc_msgSend(v59, "count"));
        v61 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v60, "objectsAtIndexes:", v61);
        v62 = objc_claimAutoreleasedReturnValue();

        v60 = (void *)v62;
      }
      v63 = (void *)objc_opt_new();
      v83 = 0u;
      v84 = 0u;
      v81 = 0u;
      v82 = 0u;
      v64 = v60;
      v65 = objc_msgSend(v64, "countByEnumeratingWithState:objects:count:", &v81, v101, 16);
      if (v65)
      {
        v66 = *(_QWORD *)v82;
        do
        {
          for (k = 0; k != v65; ++k)
          {
            if (*(_QWORD *)v82 != v66)
              objc_enumerationMutation(v64);
            +[WFReminderContentItem itemWithReminder:fromReminderStore:](WFReminderContentItem, "itemWithReminder:fromReminderStore:", *(_QWORD *)(*((_QWORD *)&v81 + 1) + 8 * k), v50);
            v68 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v63, "addObject:", v68);

          }
          v65 = objc_msgSend(v64, "countByEnumeratingWithState:objects:count:", &v81, v101, 16);
        }
        while (v65);
      }

      if (v69)
        (*((void (**)(id, void *, _QWORD))v77 + 2))(v77, v63, 0);
      else
        objc_msgSend(a1, "performFallbackFilteringWithItems:withContentPredicates:compoundPredicateType:originalQuery:resultHandler:", v63, v80, v78, v79, v77);

    }
    else
    {
      (*((void (**)(id, _QWORD, id))v77 + 2))(v77, 0, obja);
    }

    v24 = v73;
  }

}

+ (void)getItemsMatchingQuery:(id)a3 withInput:(id)a4 resultHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  id v13;
  objc_super v14;

  v8 = a4;
  if (v8)
  {
    v9 = a5;
    v10 = a3;
    +[WFContentItem contentPropertySubstitutor](WFContentItem, "contentPropertySubstitutor");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "runWithObjects:propertySubstitutor:completionHandler:", v8, v11, v9);

  }
  else
  {
    v14.receiver = a1;
    v14.super_class = (Class)&OBJC_METACLASS___WFRemindersLibraryFiltering;
    v12 = a5;
    v13 = a3;
    objc_msgSendSuper2(&v14, sel_getItemsMatchingQuery_withInput_resultHandler_, v13, 0, v12);

  }
}

void __131__WFRemindersLibraryFiltering_performCustomFilteringUsingContentPredicates_compoundPredicateType_forQuery_withInput_resultHandler___block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  id v11;
  _QWORD v12[4];
  id v13;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x24BDAC8D0];
  v6 = a4;
  v7 = *(void **)(a1 + 32);
  v14[0] = a2;
  v8 = (void *)MEMORY[0x24BDBCE30];
  v9 = a2;
  objc_msgSend(v8, "arrayWithObjects:count:", v14, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __131__WFRemindersLibraryFiltering_performCustomFilteringUsingContentPredicates_compoundPredicateType_forQuery_withInput_resultHandler___block_invoke_2;
  v12[3] = &unk_24C4E33B0;
  v13 = v6;
  v11 = v6;
  objc_msgSend(v7, "performCustomFilteringUsingContentPredicates:compoundPredicateType:forQuery:withInput:resultHandler:", v10, 1, 0, 0, v12);

}

void __131__WFRemindersLibraryFiltering_performCustomFilteringUsingContentPredicates_compoundPredicateType_forQuery_withInput_resultHandler___block_invoke_3(_QWORD *a1, void *a2)
{
  objc_class *v3;
  id v4;
  void *v5;
  void *v6;
  id v7;

  v3 = (objc_class *)MEMORY[0x24BDBCEE0];
  v4 = a2;
  v7 = (id)objc_msgSend([v3 alloc], "initWithArray:", v4);

  v5 = (void *)a1[6];
  objc_msgSend(v7, "array");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "performFallbackFilteringWithItems:withContentPredicates:compoundPredicateType:originalQuery:resultHandler:", v6, 0, 0, a1[4], a1[5]);

}

uint64_t __131__WFRemindersLibraryFiltering_performCustomFilteringUsingContentPredicates_compoundPredicateType_forQuery_withInput_resultHandler___block_invoke_4(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "addObject:", a2);
}

uint64_t __131__WFRemindersLibraryFiltering_performCustomFilteringUsingContentPredicates_compoundPredicateType_forQuery_withInput_resultHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

@end
