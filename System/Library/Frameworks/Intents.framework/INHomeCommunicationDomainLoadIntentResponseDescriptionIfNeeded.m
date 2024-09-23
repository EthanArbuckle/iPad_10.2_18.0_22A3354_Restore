@implementation INHomeCommunicationDomainLoadIntentResponseDescriptionIfNeeded

void ___INHomeCommunicationDomainLoadIntentResponseDescriptionIfNeeded_block_invoke()
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
  INIntentResponseDescription *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  INIntentResponseDescription *v15;
  INIntentResponseDescription *v16;
  uint64_t v17;
  uint64_t v18;
  INIntentSlotDescription *v19;
  void *v20;
  void *v21;
  INIntentResponseDescription *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  id v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t i;
  void *v32;
  void *v33;
  void *v34;
  uint64_t v35;
  void *v36;
  uint64_t v37;
  void *v38;
  void *v39;
  void *v40;
  INIntentSlotDescription *v41;
  INIntentResponseDescription *v42;
  void *v43;
  void *v44;
  INIntentSlotDescription *v45;
  INIntentResponseDescription *v46;
  void *v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  _BYTE v52[128];
  INIntentSlotDescription *v53;
  INIntentSlotDescription *v54;
  INIntentSlotDescription *v55;
  _QWORD v56[7];

  v56[5] = *MEMORY[0x1E0C80C00];
  v0 = [INIntentResponseDescription alloc];
  v1 = objc_opt_class();
  v2 = objc_opt_class();
  v3 = (void *)MEMORY[0x1E0C9AA60];
  _INIntentSchemaBuildIntentSlotDescriptionMap(MEMORY[0x1E0C9AA60]);
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  v46 = -[INIntentResponseDescription initWithName:facadeClass:dataClass:type:isPrivate:slotsByName:](v0, "initWithName:facadeClass:dataClass:type:isPrivate:slotsByName:", CFSTR("PlayAnnouncementSoundIntentResponse"), v1, v2, CFSTR("sirikit.intent.home.communication.PlayAnnouncementSoundIntentResponse"), 0, v47);
  v56[0] = v46;
  v4 = [INIntentResponseDescription alloc];
  v5 = objc_opt_class();
  v6 = objc_opt_class();
  v45 = -[INIntentSlotDescription initWithName:tag:facadePropertyName:dataPropertyName:isExtended:isPrivate:valueType:valueStyle:defaultValueSelectorStrings:provideOptionsSelectorStrings:resolutionResultClass:resolveSelectors:]([INIntentSlotDescription alloc], "initWithName:tag:facadePropertyName:dataPropertyName:isExtended:isPrivate:valueType:valueStyle:defaultValueSelectorStrings:provideOptionsSelectorStrings:resolutionResultClass:resolveSelectors:", CFSTR("announcementRecords"), 1, CFSTR("announcementRecords"), CFSTR("announcementRecords"), 0, 0, 94, 3, 0, 0, 0, 0);
  v55 = v45;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v55, 1);
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  _INIntentSchemaBuildIntentSlotDescriptionMap(v44);
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  v42 = -[INIntentResponseDescription initWithName:facadeClass:dataClass:type:isPrivate:slotsByName:](v4, "initWithName:facadeClass:dataClass:type:isPrivate:slotsByName:", CFSTR("ReadAnnouncementIntentResponse"), v5, v6, CFSTR("sirikit.intent.home.communication.ReadAnnouncementIntentResponse"), 0, v43);
  v56[1] = v42;
  v7 = [INIntentResponseDescription alloc];
  v8 = objc_opt_class();
  v9 = objc_opt_class();
  v41 = -[INIntentSlotDescription initWithName:tag:facadePropertyName:dataPropertyName:isExtended:isPrivate:valueType:valueStyle:defaultValueSelectorStrings:provideOptionsSelectorStrings:resolutionResultClass:resolveSelectors:]([INIntentSlotDescription alloc], "initWithName:tag:facadePropertyName:dataPropertyName:isExtended:isPrivate:valueType:valueStyle:defaultValueSelectorStrings:provideOptionsSelectorStrings:resolutionResultClass:resolveSelectors:", CFSTR("sentAnnouncements"), 1, CFSTR("sentAnnouncements"), CFSTR("sentAnnouncements"), 0, 0, 94, 3, 0, 0, 0, 0);
  v54 = v41;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v54, 1);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  _INIntentSchemaBuildIntentSlotDescriptionMap(v40);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[INIntentResponseDescription initWithName:facadeClass:dataClass:type:isPrivate:slotsByName:](v7, "initWithName:facadeClass:dataClass:type:isPrivate:slotsByName:", CFSTR("SendAnnouncementIntentResponse"), v8, v9, CFSTR("sirikit.intent.home.communication.SendAnnouncementIntentResponse"), 0, v39);
  v56[2] = v10;
  v11 = [INIntentResponseDescription alloc];
  v12 = objc_opt_class();
  v13 = objc_opt_class();
  _INIntentSchemaBuildIntentSlotDescriptionMap(v3);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = -[INIntentResponseDescription initWithName:facadeClass:dataClass:type:isPrivate:slotsByName:](v11, "initWithName:facadeClass:dataClass:type:isPrivate:slotsByName:", CFSTR("SkipAnnouncementIntentResponse"), v12, v13, CFSTR("sirikit.intent.home.communication.SkipAnnouncementIntentResponse"), 0, v14);
  v56[3] = v15;
  v16 = [INIntentResponseDescription alloc];
  v17 = objc_opt_class();
  v18 = objc_opt_class();
  v19 = -[INIntentSlotDescription initWithName:tag:facadePropertyName:dataPropertyName:isExtended:isPrivate:valueType:valueStyle:defaultValueSelectorStrings:provideOptionsSelectorStrings:resolutionResultClass:resolveSelectors:]([INIntentSlotDescription alloc], "initWithName:tag:facadePropertyName:dataPropertyName:isExtended:isPrivate:valueType:valueStyle:defaultValueSelectorStrings:provideOptionsSelectorStrings:resolutionResultClass:resolveSelectors:", CFSTR("stoppedAnnouncementRecords"), 1, CFSTR("stoppedAnnouncementRecords"), CFSTR("stoppedAnnouncementRecords"), 0, 0, 94, 3, 0, 0, 0, 0);
  v53 = v19;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v53, 1);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  _INIntentSchemaBuildIntentSlotDescriptionMap(v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = -[INIntentResponseDescription initWithName:facadeClass:dataClass:type:isPrivate:slotsByName:](v16, "initWithName:facadeClass:dataClass:type:isPrivate:slotsByName:", CFSTR("StopAnnouncementIntentResponse"), v17, v18, CFSTR("sirikit.intent.home.communication.StopAnnouncementIntentResponse"), 0, v21);
  v56[4] = v22;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v56, 5);
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  v24 = objc_msgSend(v23, "count");
  v25 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", v24);
  v26 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", v24);
  v48 = 0u;
  v49 = 0u;
  v50 = 0u;
  v51 = 0u;
  v27 = v23;
  v28 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v48, v52, 16);
  if (v28)
  {
    v29 = v28;
    v30 = *(_QWORD *)v49;
    do
    {
      for (i = 0; i != v29; ++i)
      {
        if (*(_QWORD *)v49 != v30)
          objc_enumerationMutation(v27);
        v32 = *(void **)(*((_QWORD *)&v48 + 1) + 8 * i);
        objc_msgSend(v32, "name");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "setObject:forKey:", v32, v33);

        objc_msgSend(v32, "type");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "setObject:forKey:", v32, v34);

      }
      v29 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v48, v52, 16);
    }
    while (v29);
  }

  v35 = objc_msgSend(v25, "copy");
  v36 = (void *)sHomeCommunicationDomain_intentResponseDescsByName;
  sHomeCommunicationDomain_intentResponseDescsByName = v35;

  v37 = objc_msgSend(v26, "copy");
  v38 = (void *)sHomeCommunicationDomain_intentResponseDescsByType;
  sHomeCommunicationDomain_intentResponseDescsByType = v37;

}

@end
