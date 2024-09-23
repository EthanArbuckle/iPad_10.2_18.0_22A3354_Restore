@implementation INContactDomainLoadIntentResponseDescriptionIfNeeded

void ___INContactDomainLoadIntentResponseDescriptionIfNeeded_block_invoke()
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
  void *v9;
  void *v10;
  INIntentResponseDescription *v11;
  INIntentResponseDescription *v12;
  uint64_t v13;
  uint64_t v14;
  INIntentSlotDescription *v15;
  void *v16;
  void *v17;
  INIntentResponseDescription *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  id v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t i;
  void *v28;
  void *v29;
  void *v30;
  uint64_t v31;
  void *v32;
  uint64_t v33;
  void *v34;
  INIntentSlotDescription *v35;
  INIntentResponseDescription *v36;
  void *v37;
  void *v38;
  INIntentSlotDescription *v39;
  INIntentResponseDescription *v40;
  void *v41;
  void *v42;
  INIntentSlotDescription *v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  _BYTE v48[128];
  INIntentSlotDescription *v49;
  INIntentSlotDescription *v50;
  INIntentSlotDescription *v51;
  INIntentSlotDescription *v52;
  _QWORD v53[6];

  v53[4] = *MEMORY[0x1E0C80C00];
  v0 = [INIntentResponseDescription alloc];
  v1 = objc_opt_class();
  v2 = objc_opt_class();
  v43 = -[INIntentSlotDescription initWithName:tag:facadePropertyName:dataPropertyName:isExtended:isPrivate:valueType:valueStyle:defaultValueSelectorStrings:provideOptionsSelectorStrings:resolutionResultClass:resolveSelectors:]([INIntentSlotDescription alloc], "initWithName:tag:facadePropertyName:dataPropertyName:isExtended:isPrivate:valueType:valueStyle:defaultValueSelectorStrings:provideOptionsSelectorStrings:resolutionResultClass:resolveSelectors:", CFSTR("matchedContacts"), 1, CFSTR("matchedContacts"), CFSTR("matchedContacts"), 0, 0, 195, 3, 0, 0, 0, 0);
  v52 = v43;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v52, 1);
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  _INIntentSchemaBuildIntentSlotDescriptionMap(v42);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  v40 = -[INIntentResponseDescription initWithName:facadeClass:dataClass:type:isPrivate:slotsByName:](v0, "initWithName:facadeClass:dataClass:type:isPrivate:slotsByName:", CFSTR("SearchForContactIntentResponse"), v1, v2, CFSTR("sirikit.intent.contact.SearchForContactIntentResponse"), 0, v41);
  v53[0] = v40;
  v3 = [INIntentResponseDescription alloc];
  v4 = objc_opt_class();
  v5 = objc_opt_class();
  v39 = -[INIntentSlotDescription initWithName:tag:facadePropertyName:dataPropertyName:isExtended:isPrivate:valueType:valueStyle:defaultValueSelectorStrings:provideOptionsSelectorStrings:resolutionResultClass:resolveSelectors:]([INIntentSlotDescription alloc], "initWithName:tag:facadePropertyName:dataPropertyName:isExtended:isPrivate:valueType:valueStyle:defaultValueSelectorStrings:provideOptionsSelectorStrings:resolutionResultClass:resolveSelectors:", CFSTR("meCard"), 1, CFSTR("meCard"), CFSTR("meCard"), 0, 0, 195, 1, 0, 0, 0, 0);
  v51 = v39;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v51, 1);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  _INIntentSchemaBuildIntentSlotDescriptionMap(v38);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v36 = -[INIntentResponseDescription initWithName:facadeClass:dataClass:type:isPrivate:slotsByName:](v3, "initWithName:facadeClass:dataClass:type:isPrivate:slotsByName:", CFSTR("SearchForMeCardIntentResponse"), v4, v5, CFSTR("sirikit.intent.contact.SearchForMeCardIntentResponse"), 0, v37);
  v53[1] = v36;
  v6 = [INIntentResponseDescription alloc];
  v7 = objc_opt_class();
  v8 = objc_opt_class();
  v35 = -[INIntentSlotDescription initWithName:tag:facadePropertyName:dataPropertyName:isExtended:isPrivate:valueType:valueStyle:defaultValueSelectorStrings:provideOptionsSelectorStrings:resolutionResultClass:resolveSelectors:]([INIntentSlotDescription alloc], "initWithName:tag:facadePropertyName:dataPropertyName:isExtended:isPrivate:valueType:valueStyle:defaultValueSelectorStrings:provideOptionsSelectorStrings:resolutionResultClass:resolveSelectors:", CFSTR("meCard"), 1, CFSTR("meCard"), CFSTR("meCard"), 0, 0, 195, 1, 0, 0, 0, 0);
  v50 = v35;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v50, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  _INIntentSchemaBuildIntentSlotDescriptionMap(v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = -[INIntentResponseDescription initWithName:facadeClass:dataClass:type:isPrivate:slotsByName:](v6, "initWithName:facadeClass:dataClass:type:isPrivate:slotsByName:", CFSTR("SetNicknameIntentResponse"), v7, v8, CFSTR("sirikit.intent.contact.SetNicknameIntentResponse"), 0, v10);
  v53[2] = v11;
  v12 = [INIntentResponseDescription alloc];
  v13 = objc_opt_class();
  v14 = objc_opt_class();
  v15 = -[INIntentSlotDescription initWithName:tag:facadePropertyName:dataPropertyName:isExtended:isPrivate:valueType:valueStyle:defaultValueSelectorStrings:provideOptionsSelectorStrings:resolutionResultClass:resolveSelectors:]([INIntentSlotDescription alloc], "initWithName:tag:facadePropertyName:dataPropertyName:isExtended:isPrivate:valueType:valueStyle:defaultValueSelectorStrings:provideOptionsSelectorStrings:resolutionResultClass:resolveSelectors:", CFSTR("meCard"), 1, CFSTR("meCard"), CFSTR("meCard"), 0, 0, 195, 1, 0, 0, 0, 0);
  v49 = v15;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v49, 1);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  _INIntentSchemaBuildIntentSlotDescriptionMap(v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = -[INIntentResponseDescription initWithName:facadeClass:dataClass:type:isPrivate:slotsByName:](v12, "initWithName:facadeClass:dataClass:type:isPrivate:slotsByName:", CFSTR("SetRelationshipIntentResponse"), v13, v14, CFSTR("sirikit.intent.contact.SetRelationshipIntentResponse"), 0, v17);
  v53[3] = v18;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v53, 4);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  v20 = objc_msgSend(v19, "count");
  v21 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", v20);
  v22 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", v20);
  v44 = 0u;
  v45 = 0u;
  v46 = 0u;
  v47 = 0u;
  v23 = v19;
  v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v44, v48, 16);
  if (v24)
  {
    v25 = v24;
    v26 = *(_QWORD *)v45;
    do
    {
      for (i = 0; i != v25; ++i)
      {
        if (*(_QWORD *)v45 != v26)
          objc_enumerationMutation(v23);
        v28 = *(void **)(*((_QWORD *)&v44 + 1) + 8 * i);
        objc_msgSend(v28, "name");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "setObject:forKey:", v28, v29);

        objc_msgSend(v28, "type");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "setObject:forKey:", v28, v30);

      }
      v25 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v44, v48, 16);
    }
    while (v25);
  }

  v31 = objc_msgSend(v21, "copy");
  v32 = (void *)sContactDomain_intentResponseDescsByName;
  sContactDomain_intentResponseDescsByName = v31;

  v33 = objc_msgSend(v22, "copy");
  v34 = (void *)sContactDomain_intentResponseDescsByType;
  sContactDomain_intentResponseDescsByType = v33;

}

@end
