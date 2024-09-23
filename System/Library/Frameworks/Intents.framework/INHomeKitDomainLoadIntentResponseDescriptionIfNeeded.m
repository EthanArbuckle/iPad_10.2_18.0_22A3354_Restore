@implementation INHomeKitDomainLoadIntentResponseDescriptionIfNeeded

void ___INHomeKitDomainLoadIntentResponseDescriptionIfNeeded_block_invoke()
{
  INIntentResponseDescription *v0;
  uint64_t v1;
  uint64_t v2;
  INIntentResponseDescription *v3;
  uint64_t v4;
  uint64_t v5;
  INIntentSlotDescription *v6;
  void *v7;
  void *v8;
  INIntentResponseDescription *v9;
  INIntentResponseDescription *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  INIntentResponseDescription *v15;
  INIntentResponseDescription *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  INIntentResponseDescription *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  id v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t i;
  void *v30;
  void *v31;
  void *v32;
  uint64_t v33;
  void *v34;
  uint64_t v35;
  void *v36;
  INIntentResponseDescription *v37;
  void *v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  _BYTE v43[128];
  INIntentSlotDescription *v44;
  _QWORD v45[6];

  v45[4] = *MEMORY[0x1E0C80C00];
  v0 = [INIntentResponseDescription alloc];
  v1 = objc_opt_class();
  v2 = objc_opt_class();
  _INIntentSchemaBuildIntentSlotDescriptionMap(MEMORY[0x1E0C9AA60]);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v37 = -[INIntentResponseDescription initWithName:facadeClass:dataClass:type:isPrivate:slotsByName:](v0, "initWithName:facadeClass:dataClass:type:isPrivate:slotsByName:", CFSTR("ConfigureHomeIntentResponse"), v1, v2, CFSTR("sirikit.intent.home.ConfigureHomeIntentResponse"), 0, v38);
  v45[0] = v37;
  v3 = [INIntentResponseDescription alloc];
  v4 = objc_opt_class();
  v5 = objc_opt_class();
  v6 = -[INIntentSlotDescription initWithName:tag:facadePropertyName:dataPropertyName:isExtended:isPrivate:valueType:valueStyle:defaultValueSelectorStrings:provideOptionsSelectorStrings:resolutionResultClass:resolveSelectors:]([INIntentSlotDescription alloc], "initWithName:tag:facadePropertyName:dataPropertyName:isExtended:isPrivate:valueType:valueStyle:defaultValueSelectorStrings:provideOptionsSelectorStrings:resolutionResultClass:resolveSelectors:", CFSTR("entityResponses"), 2, CFSTR("entityResponses"), CFSTR("entityResponses"), 0, 0, 50, 3, 0, 0, 0, 0);
  v44 = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v44, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  _INIntentSchemaBuildIntentSlotDescriptionMap(v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[INIntentResponseDescription initWithName:facadeClass:dataClass:type:isPrivate:slotsByName:](v3, "initWithName:facadeClass:dataClass:type:isPrivate:slotsByName:", CFSTR("ControlHomeIntentResponse"), v4, v5, CFSTR("sirikit.intent.home.ControlHomeIntentResponse"), 0, v8);
  v45[1] = v9;
  v10 = [INIntentResponseDescription alloc];
  v11 = objc_opt_class();
  v12 = objc_opt_class();
  v13 = (void *)MEMORY[0x1E0C9AA60];
  _INIntentSchemaBuildIntentSlotDescriptionMap(MEMORY[0x1E0C9AA60]);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = -[INIntentResponseDescription initWithName:facadeClass:dataClass:type:isPrivate:slotsByName:](v10, "initWithName:facadeClass:dataClass:type:isPrivate:slotsByName:", CFSTR("QueryHomeIntentResponse"), v11, v12, CFSTR("sirikit.intent.home.QueryHomeIntentResponse"), 0, v14);
  v45[2] = v15;
  v16 = [INIntentResponseDescription alloc];
  v17 = objc_opt_class();
  v18 = objc_opt_class();
  _INIntentSchemaBuildIntentSlotDescriptionMap(v13);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = -[INIntentResponseDescription initWithName:facadeClass:dataClass:type:isPrivate:slotsByName:](v16, "initWithName:facadeClass:dataClass:type:isPrivate:slotsByName:", CFSTR("ShowHomeIntentResponse"), v17, v18, CFSTR("sirikit.intent.home.ShowHomeIntentResponse"), 0, v19);
  v45[3] = v20;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v45, 4);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  v22 = objc_msgSend(v21, "count");
  v23 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", v22);
  v24 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", v22);
  v39 = 0u;
  v40 = 0u;
  v41 = 0u;
  v42 = 0u;
  v25 = v21;
  v26 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v39, v43, 16);
  if (v26)
  {
    v27 = v26;
    v28 = *(_QWORD *)v40;
    do
    {
      for (i = 0; i != v27; ++i)
      {
        if (*(_QWORD *)v40 != v28)
          objc_enumerationMutation(v25);
        v30 = *(void **)(*((_QWORD *)&v39 + 1) + 8 * i);
        objc_msgSend(v30, "name");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "setObject:forKey:", v30, v31);

        objc_msgSend(v30, "type");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "setObject:forKey:", v30, v32);

      }
      v27 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v39, v43, 16);
    }
    while (v27);
  }

  v33 = objc_msgSend(v23, "copy");
  v34 = (void *)sHomeKitDomain_intentResponseDescsByName;
  sHomeKitDomain_intentResponseDescsByName = v33;

  v35 = objc_msgSend(v24, "copy");
  v36 = (void *)sHomeKitDomain_intentResponseDescsByType;
  sHomeKitDomain_intentResponseDescsByType = v35;

}

@end
