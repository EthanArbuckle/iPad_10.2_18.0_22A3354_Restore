@implementation INMessagesDomainLoadIntentResponseDescriptionIfNeeded

void ___INMessagesDomainLoadIntentResponseDescriptionIfNeeded_block_invoke()
{
  INIntentResponseDescription *v0;
  uint64_t v1;
  uint64_t v2;
  void *v3;
  INIntentResponseDescription *v4;
  uint64_t v5;
  uint64_t v6;
  INIntentResponseDescription *v7;
  uint64_t v8;
  uint64_t v9;
  INIntentResponseDescription *v10;
  uint64_t v11;
  uint64_t v12;
  INIntentResponseDescription *v13;
  uint64_t v14;
  uint64_t v15;
  INIntentSlotDescription *v16;
  void *v17;
  void *v18;
  INIntentResponseDescription *v19;
  INIntentResponseDescription *v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  void *v24;
  INIntentResponseDescription *v25;
  INIntentResponseDescription *v26;
  uint64_t v27;
  uint64_t v28;
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
  INIntentResponseDescription *v47;
  void *v48;
  void *v49;
  INIntentSlotDescription *v50;
  INIntentResponseDescription *v51;
  void *v52;
  INIntentResponseDescription *v53;
  void *v54;
  INIntentResponseDescription *v55;
  void *v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  _BYTE v61[128];
  INIntentSlotDescription *v62;
  INIntentSlotDescription *v63;
  _QWORD v64[9];

  v64[7] = *MEMORY[0x1E0C80C00];
  v0 = [INIntentResponseDescription alloc];
  v1 = objc_opt_class();
  v2 = objc_opt_class();
  v3 = (void *)MEMORY[0x1E0C9AA60];
  _INIntentSchemaBuildIntentSlotDescriptionMap(MEMORY[0x1E0C9AA60]);
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  v55 = -[INIntentResponseDescription initWithName:facadeClass:dataClass:type:isPrivate:slotsByName:](v0, "initWithName:facadeClass:dataClass:type:isPrivate:slotsByName:", CFSTR("EditMessageIntentResponse"), v1, v2, CFSTR("sirikit.intent.messages.EditMessageIntentResponse"), 0, v56);
  v64[0] = v55;
  v4 = [INIntentResponseDescription alloc];
  v5 = objc_opt_class();
  v6 = objc_opt_class();
  _INIntentSchemaBuildIntentSlotDescriptionMap(v3);
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  v53 = -[INIntentResponseDescription initWithName:facadeClass:dataClass:type:isPrivate:slotsByName:](v4, "initWithName:facadeClass:dataClass:type:isPrivate:slotsByName:", CFSTR("PlayAudioMessageIntentResponse"), v5, v6, CFSTR("sirikit.intent.messages.PlayAudioMessageIntentResponse"), 0, v54);
  v64[1] = v53;
  v7 = [INIntentResponseDescription alloc];
  v8 = objc_opt_class();
  v9 = objc_opt_class();
  _INIntentSchemaBuildIntentSlotDescriptionMap(v3);
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  v51 = -[INIntentResponseDescription initWithName:facadeClass:dataClass:type:isPrivate:slotsByName:](v7, "initWithName:facadeClass:dataClass:type:isPrivate:slotsByName:", CFSTR("PlayMessageSoundIntentResponse"), v8, v9, CFSTR("sirikit.intent.messages.PlayMessageSoundIntentResponse"), 0, v52);
  v64[2] = v51;
  v10 = [INIntentResponseDescription alloc];
  v11 = objc_opt_class();
  v12 = objc_opt_class();
  v50 = -[INIntentSlotDescription initWithName:tag:facadePropertyName:dataPropertyName:isExtended:isPrivate:valueType:valueStyle:defaultValueSelectorStrings:provideOptionsSelectorStrings:resolutionResultClass:resolveSelectors:]([INIntentSlotDescription alloc], "initWithName:tag:facadePropertyName:dataPropertyName:isExtended:isPrivate:valueType:valueStyle:defaultValueSelectorStrings:provideOptionsSelectorStrings:resolutionResultClass:resolveSelectors:", CFSTR("messages"), 2, CFSTR("messages"), CFSTR("messages"), 0, 0, 29, 3, 0, 0, 0, 0);
  v63 = v50;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v63, 1);
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  _INIntentSchemaBuildIntentSlotDescriptionMap(v49);
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  v47 = -[INIntentResponseDescription initWithName:facadeClass:dataClass:type:isPrivate:slotsByName:](v10, "initWithName:facadeClass:dataClass:type:isPrivate:slotsByName:", CFSTR("SearchForMessagesIntentResponse"), v11, v12, CFSTR("sirikit.intent.messages.SearchForMessagesIntentResponse"), 0, v48);
  v64[3] = v47;
  v13 = [INIntentResponseDescription alloc];
  v14 = objc_opt_class();
  v15 = objc_opt_class();
  v16 = -[INIntentSlotDescription initWithName:tag:facadePropertyName:dataPropertyName:isExtended:isPrivate:valueType:valueStyle:defaultValueSelectorStrings:provideOptionsSelectorStrings:resolutionResultClass:resolveSelectors:]([INIntentSlotDescription alloc], "initWithName:tag:facadePropertyName:dataPropertyName:isExtended:isPrivate:valueType:valueStyle:defaultValueSelectorStrings:provideOptionsSelectorStrings:resolutionResultClass:resolveSelectors:", CFSTR("sentMessages"), 2, CFSTR("sentMessages"), CFSTR("sentMessages"), 0, 0, 29, 3, 0, 0, 0, 0);
  v62 = v16;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v62, 1);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  _INIntentSchemaBuildIntentSlotDescriptionMap(v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = -[INIntentResponseDescription initWithName:facadeClass:dataClass:type:isPrivate:slotsByName:](v13, "initWithName:facadeClass:dataClass:type:isPrivate:slotsByName:", CFSTR("SendMessageIntentResponse"), v14, v15, CFSTR("sirikit.intent.messages.SendMessageIntentResponse"), 0, v18);
  v64[4] = v19;
  v20 = [INIntentResponseDescription alloc];
  v21 = objc_opt_class();
  v22 = objc_opt_class();
  v23 = (void *)MEMORY[0x1E0C9AA60];
  _INIntentSchemaBuildIntentSlotDescriptionMap(MEMORY[0x1E0C9AA60]);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = -[INIntentResponseDescription initWithName:facadeClass:dataClass:type:isPrivate:slotsByName:](v20, "initWithName:facadeClass:dataClass:type:isPrivate:slotsByName:", CFSTR("SetMessageAttributeIntentResponse"), v21, v22, CFSTR("sirikit.intent.messages.SetMessageAttributeIntentResponse"), 0, v24);
  v64[5] = v25;
  v26 = [INIntentResponseDescription alloc];
  v27 = objc_opt_class();
  v28 = objc_opt_class();
  _INIntentSchemaBuildIntentSlotDescriptionMap(v23);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = -[INIntentResponseDescription initWithName:facadeClass:dataClass:type:isPrivate:slotsByName:](v26, "initWithName:facadeClass:dataClass:type:isPrivate:slotsByName:", CFSTR("UnsendMessagesIntentResponse"), v27, v28, CFSTR("sirikit.intent.messages.UnsendMessagesIntentResponse"), 0, v29);
  v64[6] = v30;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v64, 7);
  v31 = (void *)objc_claimAutoreleasedReturnValue();

  v32 = objc_msgSend(v31, "count");
  v33 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", v32);
  v34 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", v32);
  v57 = 0u;
  v58 = 0u;
  v59 = 0u;
  v60 = 0u;
  v35 = v31;
  v36 = objc_msgSend(v35, "countByEnumeratingWithState:objects:count:", &v57, v61, 16);
  if (v36)
  {
    v37 = v36;
    v38 = *(_QWORD *)v58;
    do
    {
      for (i = 0; i != v37; ++i)
      {
        if (*(_QWORD *)v58 != v38)
          objc_enumerationMutation(v35);
        v40 = *(void **)(*((_QWORD *)&v57 + 1) + 8 * i);
        objc_msgSend(v40, "name");
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v33, "setObject:forKey:", v40, v41);

        objc_msgSend(v40, "type");
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v34, "setObject:forKey:", v40, v42);

      }
      v37 = objc_msgSend(v35, "countByEnumeratingWithState:objects:count:", &v57, v61, 16);
    }
    while (v37);
  }

  v43 = objc_msgSend(v33, "copy");
  v44 = (void *)sMessagesDomain_intentResponseDescsByName;
  sMessagesDomain_intentResponseDescsByName = v43;

  v45 = objc_msgSend(v34, "copy");
  v46 = (void *)sMessagesDomain_intentResponseDescsByType;
  sMessagesDomain_intentResponseDescsByType = v45;

}

@end
