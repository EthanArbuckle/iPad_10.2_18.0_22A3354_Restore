@implementation INHomeKitDomainLoadIntentDescriptionIfNeeded

void ___INHomeKitDomainLoadIntentDescriptionIfNeeded_block_invoke()
{
  INIntentDescription *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  INIntentDescription *v5;
  uint64_t v6;
  uint64_t v7;
  INIntentDescription *v8;
  uint64_t v9;
  uint64_t v10;
  INIntentSlotDescription *v11;
  INIntentSlotDescription *v12;
  void *v13;
  void *v14;
  INIntentDescription *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t i;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  void *v29;
  uint64_t v30;
  void *v31;
  INIntentDescription *v32;
  void *v33;
  void *v34;
  INIntentSlotDescription *v35;
  INIntentDescription *v36;
  INIntentDescription *v37;
  void *v38;
  void *v39;
  INIntentSlotDescription *v40;
  INIntentSlotDescription *v41;
  INIntentSlotDescription *v42;
  INIntentDescription *v43;
  void *v44;
  void *v45;
  INIntentSlotDescription *v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  _BYTE v51[128];
  _QWORD v52[2];
  INIntentSlotDescription *v53;
  _QWORD v54[3];
  INIntentSlotDescription *v55;
  _QWORD v56[6];

  v56[4] = *MEMORY[0x1E0C80C00];
  v0 = [INIntentDescription alloc];
  v1 = objc_opt_class();
  v2 = objc_opt_class();
  v46 = -[INIntentSlotDescription initWithName:tag:facadePropertyName:dataPropertyName:isExtended:isPrivate:valueType:valueStyle:defaultValueSelectorStrings:provideOptionsSelectorStrings:resolutionResultClass:resolveSelectors:]([INIntentSlotDescription alloc], "initWithName:tag:facadePropertyName:dataPropertyName:isExtended:isPrivate:valueType:valueStyle:defaultValueSelectorStrings:provideOptionsSelectorStrings:resolutionResultClass:resolveSelectors:", CFSTR("entities"), 2, CFSTR("entities"), CFSTR("entities"), 0, 0, 46, 3, &unk_1E23F7488, &unk_1E23F74A0, objc_opt_class(), sel_resolveEntitiesForConfigureHome_withCompletion_, sel_resolveEntitiesForConfigureHome_completion_, 0);
  v55 = v46;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v55, 1);
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  _INIntentSchemaBuildIntentSlotDescriptionMap(v45);
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  v43 = -[INIntentDescription initWithName:responseName:facadeClass:dataClass:type:isPrivate:handleSelector:confirmSelector:slotsByName:](v0, "initWithName:responseName:facadeClass:dataClass:type:isPrivate:handleSelector:confirmSelector:slotsByName:", CFSTR("ConfigureHomeIntent"), CFSTR("ConfigureHomeIntentResponse"), v1, v2, CFSTR("sirikit.intent.home.ConfigureHomeIntent"), 0, sel_handleConfigureHome_completion_, sel_confirmConfigureHome_completion_, v44);
  v56[0] = v43;
  v36 = [INIntentDescription alloc];
  v3 = objc_opt_class();
  v4 = objc_opt_class();
  v42 = -[INIntentSlotDescription initWithName:tag:facadePropertyName:dataPropertyName:isExtended:isPrivate:valueType:valueStyle:defaultValueSelectorStrings:provideOptionsSelectorStrings:resolutionResultClass:resolveSelectors:]([INIntentSlotDescription alloc], "initWithName:tag:facadePropertyName:dataPropertyName:isExtended:isPrivate:valueType:valueStyle:defaultValueSelectorStrings:provideOptionsSelectorStrings:resolutionResultClass:resolveSelectors:", CFSTR("userTask"), 5, CFSTR("userTask"), CFSTR("userTask"), 0, 0, 48, 1, &unk_1E23F74B8, &unk_1E23F74D0, objc_opt_class(), sel_resolveUserTaskForControlHome_withCompletion_, sel_resolveUserTaskForControlHome_completion_, 0);
  v54[0] = v42;
  v41 = -[INIntentSlotDescription initWithName:tag:facadePropertyName:dataPropertyName:isExtended:isPrivate:valueType:valueStyle:defaultValueSelectorStrings:provideOptionsSelectorStrings:resolutionResultClass:resolveSelectors:]([INIntentSlotDescription alloc], "initWithName:tag:facadePropertyName:dataPropertyName:isExtended:isPrivate:valueType:valueStyle:defaultValueSelectorStrings:provideOptionsSelectorStrings:resolutionResultClass:resolveSelectors:", CFSTR("filters"), 6, CFSTR("filters"), CFSTR("filters"), 0, 0, 49, 3, &unk_1E23F74E8, &unk_1E23F7500, objc_opt_class(), sel_resolveFiltersForControlHome_withCompletion_, sel_resolveFiltersForControlHome_completion_, 0);
  v54[1] = v41;
  v40 = -[INIntentSlotDescription initWithName:tag:facadePropertyName:dataPropertyName:isExtended:isPrivate:valueType:valueStyle:defaultValueSelectorStrings:provideOptionsSelectorStrings:resolutionResultClass:resolveSelectors:]([INIntentSlotDescription alloc], "initWithName:tag:facadePropertyName:dataPropertyName:isExtended:isPrivate:valueType:valueStyle:defaultValueSelectorStrings:provideOptionsSelectorStrings:resolutionResultClass:resolveSelectors:", CFSTR("time"), 7, CFSTR("time"), CFSTR("time"), 0, 0, 16, 1, &unk_1E23F7518, &unk_1E23F7530, objc_opt_class(), sel_resolveTimeForControlHome_withCompletion_, sel_resolveTimeForControlHome_completion_, 0);
  v54[2] = v40;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v54, 3);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  _INIntentSchemaBuildIntentSlotDescriptionMap(v39);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v37 = -[INIntentDescription initWithName:responseName:facadeClass:dataClass:type:isPrivate:handleSelector:confirmSelector:slotsByName:](v36, "initWithName:responseName:facadeClass:dataClass:type:isPrivate:handleSelector:confirmSelector:slotsByName:", CFSTR("ControlHomeIntent"), CFSTR("ControlHomeIntentResponse"), v3, v4, CFSTR("sirikit.intent.home.ControlHomeIntent"), 0, sel_handleControlHome_completion_, sel_confirmControlHome_completion_, v38);
  v56[1] = v37;
  v5 = [INIntentDescription alloc];
  v6 = objc_opt_class();
  v7 = objc_opt_class();
  v35 = -[INIntentSlotDescription initWithName:tag:facadePropertyName:dataPropertyName:isExtended:isPrivate:valueType:valueStyle:defaultValueSelectorStrings:provideOptionsSelectorStrings:resolutionResultClass:resolveSelectors:]([INIntentSlotDescription alloc], "initWithName:tag:facadePropertyName:dataPropertyName:isExtended:isPrivate:valueType:valueStyle:defaultValueSelectorStrings:provideOptionsSelectorStrings:resolutionResultClass:resolveSelectors:", CFSTR("entities"), 2, CFSTR("entities"), CFSTR("entities"), 0, 0, 46, 3, &unk_1E23F7548, &unk_1E23F7560, objc_opt_class(), sel_resolveEntitiesForQueryHome_withCompletion_, sel_resolveEntitiesForQueryHome_completion_, 0);
  v53 = v35;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v53, 1);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  _INIntentSchemaBuildIntentSlotDescriptionMap(v34);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[INIntentDescription initWithName:responseName:facadeClass:dataClass:type:isPrivate:handleSelector:confirmSelector:slotsByName:](v5, "initWithName:responseName:facadeClass:dataClass:type:isPrivate:handleSelector:confirmSelector:slotsByName:", CFSTR("QueryHomeIntent"), CFSTR("QueryHomeIntentResponse"), v6, v7, CFSTR("sirikit.intent.home.QueryHomeIntent"), 0, sel_handleQueryHome_completion_, sel_confirmQueryHome_completion_, v33);
  v56[2] = v8;
  v32 = [INIntentDescription alloc];
  v9 = objc_opt_class();
  v10 = objc_opt_class();
  v11 = -[INIntentSlotDescription initWithName:tag:facadePropertyName:dataPropertyName:isExtended:isPrivate:valueType:valueStyle:defaultValueSelectorStrings:provideOptionsSelectorStrings:resolutionResultClass:resolveSelectors:]([INIntentSlotDescription alloc], "initWithName:tag:facadePropertyName:dataPropertyName:isExtended:isPrivate:valueType:valueStyle:defaultValueSelectorStrings:provideOptionsSelectorStrings:resolutionResultClass:resolveSelectors:", CFSTR("filters"), 2, CFSTR("filters"), CFSTR("filters"), 0, 0, 49, 3, &unk_1E23F7578, &unk_1E23F7590, objc_opt_class(), sel_resolveFiltersForShowHome_withCompletion_, sel_resolveFiltersForShowHome_completion_, 0);
  v52[0] = v11;
  v12 = -[INIntentSlotDescription initWithName:tag:facadePropertyName:dataPropertyName:isExtended:isPrivate:valueType:valueStyle:defaultValueSelectorStrings:provideOptionsSelectorStrings:resolutionResultClass:resolveSelectors:]([INIntentSlotDescription alloc], "initWithName:tag:facadePropertyName:dataPropertyName:isExtended:isPrivate:valueType:valueStyle:defaultValueSelectorStrings:provideOptionsSelectorStrings:resolutionResultClass:resolveSelectors:", CFSTR("time"), 3, CFSTR("time"), CFSTR("time"), 0, 0, 16, 1, &unk_1E23F75A8, &unk_1E23F75C0, objc_opt_class(), sel_resolveTimeForShowHome_withCompletion_, sel_resolveTimeForShowHome_completion_, 0);
  v52[1] = v12;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v52, 2);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  _INIntentSchemaBuildIntentSlotDescriptionMap(v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = -[INIntentDescription initWithName:responseName:facadeClass:dataClass:type:isPrivate:handleSelector:confirmSelector:slotsByName:](v32, "initWithName:responseName:facadeClass:dataClass:type:isPrivate:handleSelector:confirmSelector:slotsByName:", CFSTR("ShowHomeIntent"), CFSTR("ShowHomeIntentResponse"), v9, v10, CFSTR("sirikit.intent.home.ShowHomeIntent"), 0, sel_handleShowHome_completion_, sel_confirmShowHome_completion_, v14);
  v56[3] = v15;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v56, 4);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  v17 = objc_msgSend(v16, "count");
  v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", v17);
  v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", v17);
  v47 = 0u;
  v48 = 0u;
  v49 = 0u;
  v50 = 0u;
  v20 = v16;
  v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v47, v51, 16);
  if (v21)
  {
    v22 = v21;
    v23 = *(_QWORD *)v48;
    do
    {
      for (i = 0; i != v22; ++i)
      {
        if (*(_QWORD *)v48 != v23)
          objc_enumerationMutation(v20);
        v25 = *(void **)(*((_QWORD *)&v47 + 1) + 8 * i);
        objc_msgSend(v25, "name");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "setObject:forKey:", v25, v26);

        objc_msgSend(v25, "type");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "setObject:forKey:", v25, v27);

      }
      v22 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v47, v51, 16);
    }
    while (v22);
  }

  v28 = objc_msgSend(v18, "copy");
  v29 = (void *)sHomeKitDomain_intentDescsByName;
  sHomeKitDomain_intentDescsByName = v28;

  v30 = objc_msgSend(v19, "copy");
  v31 = (void *)sHomeKitDomain_intentDescsByType;
  sHomeKitDomain_intentDescsByType = v30;

}

@end
