@implementation INNotebookDomainLoadIntentResponseDescriptionIfNeeded

void ___INNotebookDomainLoadIntentResponseDescriptionIfNeeded_block_invoke()
{
  INIntentResponseDescription *v0;
  uint64_t v1;
  uint64_t v2;
  INIntentResponseDescription *v3;
  uint64_t v4;
  uint64_t v5;
  INIntentResponseDescription *v6;
  uint64_t v7;
  uint64_t v8;
  INIntentResponseDescription *v9;
  uint64_t v10;
  uint64_t v11;
  INIntentResponseDescription *v12;
  uint64_t v13;
  uint64_t v14;
  INIntentResponseDescription *v15;
  uint64_t v16;
  uint64_t v17;
  INIntentResponseDescription *v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  void *v22;
  INIntentResponseDescription *v23;
  INIntentResponseDescription *v24;
  uint64_t v25;
  uint64_t v26;
  INIntentSlotDescription *v27;
  void *v28;
  void *v29;
  INIntentResponseDescription *v30;
  void *v31;
  uint64_t v32;
  void *v33;
  void *v34;
  id v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t i;
  void *v40;
  void *v41;
  void *v42;
  uint64_t v43;
  void *v44;
  uint64_t v45;
  void *v46;
  INIntentSlotDescription *v47;
  INIntentSlotDescription *v48;
  INIntentResponseDescription *v49;
  void *v50;
  void *v51;
  INIntentSlotDescription *v52;
  INIntentSlotDescription *v53;
  INIntentSlotDescription *v54;
  INIntentSlotDescription *v55;
  INIntentResponseDescription *v56;
  void *v57;
  void *v58;
  INIntentSlotDescription *v59;
  INIntentResponseDescription *v60;
  void *v61;
  void *v62;
  INIntentSlotDescription *v63;
  INIntentResponseDescription *v64;
  void *v65;
  void *v66;
  INIntentSlotDescription *v67;
  INIntentResponseDescription *v68;
  void *v69;
  void *v70;
  INIntentSlotDescription *v71;
  INIntentResponseDescription *v72;
  void *v73;
  void *v74;
  INIntentSlotDescription *v75;
  INIntentSlotDescription *v76;
  INIntentSlotDescription *v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  _BYTE v82[128];
  INIntentSlotDescription *v83;
  _QWORD v84[2];
  _QWORD v85[4];
  INIntentSlotDescription *v86;
  INIntentSlotDescription *v87;
  INIntentSlotDescription *v88;
  INIntentSlotDescription *v89;
  _QWORD v90[3];
  _QWORD v91[10];

  v91[8] = *MEMORY[0x1E0C80C00];
  v0 = [INIntentResponseDescription alloc];
  v1 = objc_opt_class();
  v2 = objc_opt_class();
  v77 = -[INIntentSlotDescription initWithName:tag:facadePropertyName:dataPropertyName:isExtended:isPrivate:valueType:valueStyle:defaultValueSelectorStrings:provideOptionsSelectorStrings:resolutionResultClass:resolveSelectors:]([INIntentSlotDescription alloc], "initWithName:tag:facadePropertyName:dataPropertyName:isExtended:isPrivate:valueType:valueStyle:defaultValueSelectorStrings:provideOptionsSelectorStrings:resolutionResultClass:resolveSelectors:", CFSTR("modifiedTaskList"), 1, CFSTR("modifiedTaskList"), CFSTR("modifiedTaskList"), 0, 0, 135, 1, 0, 0, 0, 0);
  v90[0] = v77;
  v76 = -[INIntentSlotDescription initWithName:tag:facadePropertyName:dataPropertyName:isExtended:isPrivate:valueType:valueStyle:defaultValueSelectorStrings:provideOptionsSelectorStrings:resolutionResultClass:resolveSelectors:]([INIntentSlotDescription alloc], "initWithName:tag:facadePropertyName:dataPropertyName:isExtended:isPrivate:valueType:valueStyle:defaultValueSelectorStrings:provideOptionsSelectorStrings:resolutionResultClass:resolveSelectors:", CFSTR("addedTasks"), 2, CFSTR("addedTasks"), CFSTR("addedTasks"), 0, 0, 134, 3, 0, 0, 0, 0);
  v90[1] = v76;
  v75 = -[INIntentSlotDescription initWithName:tag:facadePropertyName:dataPropertyName:isExtended:isPrivate:valueType:valueStyle:defaultValueSelectorStrings:provideOptionsSelectorStrings:resolutionResultClass:resolveSelectors:]([INIntentSlotDescription alloc], "initWithName:tag:facadePropertyName:dataPropertyName:isExtended:isPrivate:valueType:valueStyle:defaultValueSelectorStrings:provideOptionsSelectorStrings:resolutionResultClass:resolveSelectors:", CFSTR("warnings"), 3, CFSTR("warnings"), CFSTR("warnings"), 0, 1, 142, 3, 0, 0, 0, 0);
  v90[2] = v75;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v90, 3);
  v74 = (void *)objc_claimAutoreleasedReturnValue();
  _INIntentSchemaBuildIntentSlotDescriptionMap(v74);
  v73 = (void *)objc_claimAutoreleasedReturnValue();
  v72 = -[INIntentResponseDescription initWithName:facadeClass:dataClass:type:isPrivate:slotsByName:](v0, "initWithName:facadeClass:dataClass:type:isPrivate:slotsByName:", CFSTR("AddTasksIntentResponse"), v1, v2, CFSTR("sirikit.intent.notes.AddTasksIntentResponse"), 0, v73);
  v91[0] = v72;
  v3 = [INIntentResponseDescription alloc];
  v4 = objc_opt_class();
  v5 = objc_opt_class();
  v71 = -[INIntentSlotDescription initWithName:tag:facadePropertyName:dataPropertyName:isExtended:isPrivate:valueType:valueStyle:defaultValueSelectorStrings:provideOptionsSelectorStrings:resolutionResultClass:resolveSelectors:]([INIntentSlotDescription alloc], "initWithName:tag:facadePropertyName:dataPropertyName:isExtended:isPrivate:valueType:valueStyle:defaultValueSelectorStrings:provideOptionsSelectorStrings:resolutionResultClass:resolveSelectors:", CFSTR("note"), 1, CFSTR("note"), CFSTR("note"), 0, 0, 133, 1, 0, 0, 0, 0);
  v89 = v71;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v89, 1);
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  _INIntentSchemaBuildIntentSlotDescriptionMap(v70);
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  v68 = -[INIntentResponseDescription initWithName:facadeClass:dataClass:type:isPrivate:slotsByName:](v3, "initWithName:facadeClass:dataClass:type:isPrivate:slotsByName:", CFSTR("AppendToNoteIntentResponse"), v4, v5, CFSTR("sirikit.intent.notes.AppendToNoteIntentResponse"), 0, v69);
  v91[1] = v68;
  v6 = [INIntentResponseDescription alloc];
  v7 = objc_opt_class();
  v8 = objc_opt_class();
  v67 = -[INIntentSlotDescription initWithName:tag:facadePropertyName:dataPropertyName:isExtended:isPrivate:valueType:valueStyle:defaultValueSelectorStrings:provideOptionsSelectorStrings:resolutionResultClass:resolveSelectors:]([INIntentSlotDescription alloc], "initWithName:tag:facadePropertyName:dataPropertyName:isExtended:isPrivate:valueType:valueStyle:defaultValueSelectorStrings:provideOptionsSelectorStrings:resolutionResultClass:resolveSelectors:", CFSTR("createdNote"), 1, CFSTR("createdNote"), CFSTR("createdNote"), 0, 0, 133, 1, 0, 0, 0, 0);
  v88 = v67;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v88, 1);
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  _INIntentSchemaBuildIntentSlotDescriptionMap(v66);
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  v64 = -[INIntentResponseDescription initWithName:facadeClass:dataClass:type:isPrivate:slotsByName:](v6, "initWithName:facadeClass:dataClass:type:isPrivate:slotsByName:", CFSTR("CreateNoteIntentResponse"), v7, v8, CFSTR("sirikit.intent.notes.CreateNoteIntentResponse"), 0, v65);
  v91[2] = v64;
  v9 = [INIntentResponseDescription alloc];
  v10 = objc_opt_class();
  v11 = objc_opt_class();
  v63 = -[INIntentSlotDescription initWithName:tag:facadePropertyName:dataPropertyName:isExtended:isPrivate:valueType:valueStyle:defaultValueSelectorStrings:provideOptionsSelectorStrings:resolutionResultClass:resolveSelectors:]([INIntentSlotDescription alloc], "initWithName:tag:facadePropertyName:dataPropertyName:isExtended:isPrivate:valueType:valueStyle:defaultValueSelectorStrings:provideOptionsSelectorStrings:resolutionResultClass:resolveSelectors:", CFSTR("createdTaskList"), 1, CFSTR("createdTaskList"), CFSTR("createdTaskList"), 0, 0, 135, 1, 0, 0, 0, 0);
  v87 = v63;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v87, 1);
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  _INIntentSchemaBuildIntentSlotDescriptionMap(v62);
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  v60 = -[INIntentResponseDescription initWithName:facadeClass:dataClass:type:isPrivate:slotsByName:](v9, "initWithName:facadeClass:dataClass:type:isPrivate:slotsByName:", CFSTR("CreateTaskListIntentResponse"), v10, v11, CFSTR("sirikit.intent.notes.CreateTaskListIntentResponse"), 0, v61);
  v91[3] = v60;
  v12 = [INIntentResponseDescription alloc];
  v13 = objc_opt_class();
  v14 = objc_opt_class();
  v59 = -[INIntentSlotDescription initWithName:tag:facadePropertyName:dataPropertyName:isExtended:isPrivate:valueType:valueStyle:defaultValueSelectorStrings:provideOptionsSelectorStrings:resolutionResultClass:resolveSelectors:]([INIntentSlotDescription alloc], "initWithName:tag:facadePropertyName:dataPropertyName:isExtended:isPrivate:valueType:valueStyle:defaultValueSelectorStrings:provideOptionsSelectorStrings:resolutionResultClass:resolveSelectors:", CFSTR("deletedTasks"), 1, CFSTR("deletedTasks"), CFSTR("deletedTasks"), 0, 0, 134, 3, 0, 0, 0, 0);
  v86 = v59;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v86, 1);
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  _INIntentSchemaBuildIntentSlotDescriptionMap(v58);
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  v56 = -[INIntentResponseDescription initWithName:facadeClass:dataClass:type:isPrivate:slotsByName:](v12, "initWithName:facadeClass:dataClass:type:isPrivate:slotsByName:", CFSTR("DeleteTasksIntentResponse"), v13, v14, CFSTR("sirikit.intent.notes.DeleteTasksIntentResponse"), 0, v57);
  v91[4] = v56;
  v15 = [INIntentResponseDescription alloc];
  v16 = objc_opt_class();
  v17 = objc_opt_class();
  v55 = -[INIntentSlotDescription initWithName:tag:facadePropertyName:dataPropertyName:isExtended:isPrivate:valueType:valueStyle:defaultValueSelectorStrings:provideOptionsSelectorStrings:resolutionResultClass:resolveSelectors:]([INIntentSlotDescription alloc], "initWithName:tag:facadePropertyName:dataPropertyName:isExtended:isPrivate:valueType:valueStyle:defaultValueSelectorStrings:provideOptionsSelectorStrings:resolutionResultClass:resolveSelectors:", CFSTR("notes"), 1, CFSTR("notes"), CFSTR("notes"), 0, 0, 133, 3, 0, 0, 0, 0);
  v85[0] = v55;
  v54 = -[INIntentSlotDescription initWithName:tag:facadePropertyName:dataPropertyName:isExtended:isPrivate:valueType:valueStyle:defaultValueSelectorStrings:provideOptionsSelectorStrings:resolutionResultClass:resolveSelectors:]([INIntentSlotDescription alloc], "initWithName:tag:facadePropertyName:dataPropertyName:isExtended:isPrivate:valueType:valueStyle:defaultValueSelectorStrings:provideOptionsSelectorStrings:resolutionResultClass:resolveSelectors:", CFSTR("taskLists"), 2, CFSTR("taskLists"), CFSTR("taskLists"), 0, 0, 135, 3, 0, 0, 0, 0);
  v85[1] = v54;
  v53 = -[INIntentSlotDescription initWithName:tag:facadePropertyName:dataPropertyName:isExtended:isPrivate:valueType:valueStyle:defaultValueSelectorStrings:provideOptionsSelectorStrings:resolutionResultClass:resolveSelectors:]([INIntentSlotDescription alloc], "initWithName:tag:facadePropertyName:dataPropertyName:isExtended:isPrivate:valueType:valueStyle:defaultValueSelectorStrings:provideOptionsSelectorStrings:resolutionResultClass:resolveSelectors:", CFSTR("tasks"), 3, CFSTR("tasks"), CFSTR("tasks"), 0, 0, 134, 3, 0, 0, 0, 0);
  v85[2] = v53;
  v52 = -[INIntentSlotDescription initWithName:tag:facadePropertyName:dataPropertyName:isExtended:isPrivate:valueType:valueStyle:defaultValueSelectorStrings:provideOptionsSelectorStrings:resolutionResultClass:resolveSelectors:]([INIntentSlotDescription alloc], "initWithName:tag:facadePropertyName:dataPropertyName:isExtended:isPrivate:valueType:valueStyle:defaultValueSelectorStrings:provideOptionsSelectorStrings:resolutionResultClass:resolveSelectors:", CFSTR("sortType"), 4, CFSTR("sortType"), CFSTR("sortType"), 0, 0, 131, 1, 0, 0, 0, 0);
  v85[3] = v52;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v85, 4);
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  _INIntentSchemaBuildIntentSlotDescriptionMap(v51);
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  v49 = -[INIntentResponseDescription initWithName:facadeClass:dataClass:type:isPrivate:slotsByName:](v15, "initWithName:facadeClass:dataClass:type:isPrivate:slotsByName:", CFSTR("SearchForNotebookItemsIntentResponse"), v16, v17, CFSTR("sirikit.intent.notes.SearchForNotebookItemsIntentResponse"), 0, v50);
  v91[5] = v49;
  v18 = [INIntentResponseDescription alloc];
  v19 = objc_opt_class();
  v20 = objc_opt_class();
  v48 = -[INIntentSlotDescription initWithName:tag:facadePropertyName:dataPropertyName:isExtended:isPrivate:valueType:valueStyle:defaultValueSelectorStrings:provideOptionsSelectorStrings:resolutionResultClass:resolveSelectors:]([INIntentSlotDescription alloc], "initWithName:tag:facadePropertyName:dataPropertyName:isExtended:isPrivate:valueType:valueStyle:defaultValueSelectorStrings:provideOptionsSelectorStrings:resolutionResultClass:resolveSelectors:", CFSTR("modifiedTask"), 1, CFSTR("modifiedTask"), CFSTR("modifiedTask"), 0, 0, 134, 1, 0, 0, 0, 0);
  v84[0] = v48;
  v47 = -[INIntentSlotDescription initWithName:tag:facadePropertyName:dataPropertyName:isExtended:isPrivate:valueType:valueStyle:defaultValueSelectorStrings:provideOptionsSelectorStrings:resolutionResultClass:resolveSelectors:]([INIntentSlotDescription alloc], "initWithName:tag:facadePropertyName:dataPropertyName:isExtended:isPrivate:valueType:valueStyle:defaultValueSelectorStrings:provideOptionsSelectorStrings:resolutionResultClass:resolveSelectors:", CFSTR("warnings"), 2, CFSTR("warnings"), CFSTR("warnings"), 0, 1, 142, 3, 0, 0, 0, 0);
  v84[1] = v47;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v84, 2);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  _INIntentSchemaBuildIntentSlotDescriptionMap(v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = -[INIntentResponseDescription initWithName:facadeClass:dataClass:type:isPrivate:slotsByName:](v18, "initWithName:facadeClass:dataClass:type:isPrivate:slotsByName:", CFSTR("SetTaskAttributeIntentResponse"), v19, v20, CFSTR("sirikit.intent.notes.SetTaskAttributeIntentResponse"), 0, v22);
  v91[6] = v23;
  v24 = [INIntentResponseDescription alloc];
  v25 = objc_opt_class();
  v26 = objc_opt_class();
  v27 = -[INIntentSlotDescription initWithName:tag:facadePropertyName:dataPropertyName:isExtended:isPrivate:valueType:valueStyle:defaultValueSelectorStrings:provideOptionsSelectorStrings:resolutionResultClass:resolveSelectors:]([INIntentSlotDescription alloc], "initWithName:tag:facadePropertyName:dataPropertyName:isExtended:isPrivate:valueType:valueStyle:defaultValueSelectorStrings:provideOptionsSelectorStrings:resolutionResultClass:resolveSelectors:", CFSTR("snoozedTasks"), 1, CFSTR("snoozedTasks"), CFSTR("snoozedTasks"), 0, 0, 134, 3, 0, 0, 0, 0);
  v83 = v27;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v83, 1);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  _INIntentSchemaBuildIntentSlotDescriptionMap(v28);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = -[INIntentResponseDescription initWithName:facadeClass:dataClass:type:isPrivate:slotsByName:](v24, "initWithName:facadeClass:dataClass:type:isPrivate:slotsByName:", CFSTR("SnoozeTasksIntentResponse"), v25, v26, CFSTR("sirikit.intent.notes.SnoozeTasksIntentResponse"), 0, v29);
  v91[7] = v30;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v91, 8);
  v31 = (void *)objc_claimAutoreleasedReturnValue();

  v32 = objc_msgSend(v31, "count");
  v33 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", v32);
  v34 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", v32);
  v78 = 0u;
  v79 = 0u;
  v80 = 0u;
  v81 = 0u;
  v35 = v31;
  v36 = objc_msgSend(v35, "countByEnumeratingWithState:objects:count:", &v78, v82, 16);
  if (v36)
  {
    v37 = v36;
    v38 = *(_QWORD *)v79;
    do
    {
      for (i = 0; i != v37; ++i)
      {
        if (*(_QWORD *)v79 != v38)
          objc_enumerationMutation(v35);
        v40 = *(void **)(*((_QWORD *)&v78 + 1) + 8 * i);
        objc_msgSend(v40, "name");
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v33, "setObject:forKey:", v40, v41);

        objc_msgSend(v40, "type");
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v34, "setObject:forKey:", v40, v42);

      }
      v37 = objc_msgSend(v35, "countByEnumeratingWithState:objects:count:", &v78, v82, 16);
    }
    while (v37);
  }

  v43 = objc_msgSend(v33, "copy");
  v44 = (void *)sNotebookDomain_intentResponseDescsByName;
  sNotebookDomain_intentResponseDescsByName = v43;

  v45 = objc_msgSend(v34, "copy");
  v46 = (void *)sNotebookDomain_intentResponseDescsByType;
  sNotebookDomain_intentResponseDescsByType = v45;

}

@end
