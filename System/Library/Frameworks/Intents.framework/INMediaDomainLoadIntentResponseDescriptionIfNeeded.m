@implementation INMediaDomainLoadIntentResponseDescriptionIfNeeded

void ___INMediaDomainLoadIntentResponseDescriptionIfNeeded_block_invoke()
{
  INIntentResponseDescription *v0;
  uint64_t v1;
  uint64_t v2;
  INIntentResponseDescription *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  INIntentResponseDescription *v7;
  INIntentResponseDescription *v8;
  uint64_t v9;
  uint64_t v10;
  INIntentSlotDescription *v11;
  void *v12;
  void *v13;
  INIntentResponseDescription *v14;
  INIntentResponseDescription *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  INIntentResponseDescription *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  id v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t i;
  void *v29;
  void *v30;
  void *v31;
  uint64_t v32;
  void *v33;
  uint64_t v34;
  void *v35;
  void *v36;
  INIntentSlotDescription *v37;
  INIntentResponseDescription *v38;
  void *v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  _BYTE v44[128];
  INIntentSlotDescription *v45;
  INIntentSlotDescription *v46;
  _QWORD v47[6];

  v47[4] = *MEMORY[0x1E0C80C00];
  v0 = [INIntentResponseDescription alloc];
  v1 = objc_opt_class();
  v2 = objc_opt_class();
  _INIntentSchemaBuildIntentSlotDescriptionMap(MEMORY[0x1E0C9AA60]);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  v38 = -[INIntentResponseDescription initWithName:facadeClass:dataClass:type:isPrivate:slotsByName:](v0, "initWithName:facadeClass:dataClass:type:isPrivate:slotsByName:", CFSTR("AddMediaIntentResponse"), v1, v2, CFSTR("sirikit.intent.media.AddMediaIntentResponse"), 0, v39);
  v47[0] = v38;
  v3 = [INIntentResponseDescription alloc];
  v4 = objc_opt_class();
  v5 = objc_opt_class();
  v37 = -[INIntentSlotDescription initWithName:tag:facadePropertyName:dataPropertyName:isExtended:isPrivate:valueType:valueStyle:defaultValueSelectorStrings:provideOptionsSelectorStrings:resolutionResultClass:resolveSelectors:]([INIntentSlotDescription alloc], "initWithName:tag:facadePropertyName:dataPropertyName:isExtended:isPrivate:valueType:valueStyle:defaultValueSelectorStrings:provideOptionsSelectorStrings:resolutionResultClass:resolveSelectors:", CFSTR("nowPlayingInfo"), 1, CFSTR("nowPlayingInfo"), CFSTR("nowPlayingInfo"), 0, 0, 35, 1, 0, 0, 0, 0);
  v46 = v37;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v46, 1);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  _INIntentSchemaBuildIntentSlotDescriptionMap(v36);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[INIntentResponseDescription initWithName:facadeClass:dataClass:type:isPrivate:slotsByName:](v3, "initWithName:facadeClass:dataClass:type:isPrivate:slotsByName:", CFSTR("PlayMediaIntentResponse"), v4, v5, CFSTR("sirikit.intent.media.PlayMediaIntentResponse"), 0, v6);
  v47[1] = v7;
  v8 = [INIntentResponseDescription alloc];
  v9 = objc_opt_class();
  v10 = objc_opt_class();
  v11 = -[INIntentSlotDescription initWithName:tag:facadePropertyName:dataPropertyName:isExtended:isPrivate:valueType:valueStyle:defaultValueSelectorStrings:provideOptionsSelectorStrings:resolutionResultClass:resolveSelectors:]([INIntentSlotDescription alloc], "initWithName:tag:facadePropertyName:dataPropertyName:isExtended:isPrivate:valueType:valueStyle:defaultValueSelectorStrings:provideOptionsSelectorStrings:resolutionResultClass:resolveSelectors:", CFSTR("mediaItems"), 1, CFSTR("mediaItems"), CFSTR("mediaItems"), 0, 0, 153, 3, 0, 0, 0, 0);
  v45 = v11;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v45, 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  _INIntentSchemaBuildIntentSlotDescriptionMap(v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = -[INIntentResponseDescription initWithName:facadeClass:dataClass:type:isPrivate:slotsByName:](v8, "initWithName:facadeClass:dataClass:type:isPrivate:slotsByName:", CFSTR("SearchForMediaIntentResponse"), v9, v10, CFSTR("sirikit.intent.media.SearchForMediaIntentResponse"), 0, v13);
  v47[2] = v14;
  v15 = [INIntentResponseDescription alloc];
  v16 = objc_opt_class();
  v17 = objc_opt_class();
  _INIntentSchemaBuildIntentSlotDescriptionMap(MEMORY[0x1E0C9AA60]);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = -[INIntentResponseDescription initWithName:facadeClass:dataClass:type:isPrivate:slotsByName:](v15, "initWithName:facadeClass:dataClass:type:isPrivate:slotsByName:", CFSTR("UpdateMediaAffinityIntentResponse"), v16, v17, CFSTR("sirikit.intent.media.UpdateMediaAffinityIntentResponse"), 0, v18);
  v47[3] = v19;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v47, 4);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  v21 = objc_msgSend(v20, "count");
  v22 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", v21);
  v23 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", v21);
  v40 = 0u;
  v41 = 0u;
  v42 = 0u;
  v43 = 0u;
  v24 = v20;
  v25 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v40, v44, 16);
  if (v25)
  {
    v26 = v25;
    v27 = *(_QWORD *)v41;
    do
    {
      for (i = 0; i != v26; ++i)
      {
        if (*(_QWORD *)v41 != v27)
          objc_enumerationMutation(v24);
        v29 = *(void **)(*((_QWORD *)&v40 + 1) + 8 * i);
        objc_msgSend(v29, "name");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "setObject:forKey:", v29, v30);

        objc_msgSend(v29, "type");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "setObject:forKey:", v29, v31);

      }
      v26 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v40, v44, 16);
    }
    while (v26);
  }

  v32 = objc_msgSend(v22, "copy");
  v33 = (void *)sMediaDomain_intentResponseDescsByName;
  sMediaDomain_intentResponseDescsByName = v32;

  v34 = objc_msgSend(v23, "copy");
  v35 = (void *)sMediaDomain_intentResponseDescsByType;
  sMediaDomain_intentResponseDescsByType = v34;

}

@end
