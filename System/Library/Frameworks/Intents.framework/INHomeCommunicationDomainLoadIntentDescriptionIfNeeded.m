@implementation INHomeCommunicationDomainLoadIntentDescriptionIfNeeded

void ___INHomeCommunicationDomainLoadIntentDescriptionIfNeeded_block_invoke()
{
  INIntentDescription *v0;
  uint64_t v1;
  uint64_t v2;
  INIntentDescription *v3;
  uint64_t v4;
  uint64_t v5;
  INIntentDescription *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  INIntentDescription *v10;
  INIntentDescription *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  INIntentDescription *v16;
  INIntentDescription *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  INIntentDescription *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  id v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t i;
  void *v31;
  void *v32;
  void *v33;
  uint64_t v34;
  void *v35;
  uint64_t v36;
  void *v37;
  void *v38;
  INIntentSlotDescription *v39;
  INIntentSlotDescription *v40;
  INIntentSlotDescription *v41;
  INIntentSlotDescription *v42;
  INIntentDescription *v43;
  void *v44;
  void *v45;
  INIntentSlotDescription *v46;
  INIntentSlotDescription *v47;
  INIntentSlotDescription *v48;
  INIntentDescription *v49;
  void *v50;
  void *v51;
  INIntentSlotDescription *v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  _BYTE v57[128];
  _QWORD v58[4];
  _QWORD v59[3];
  INIntentSlotDescription *v60;
  _QWORD v61[7];

  v61[5] = *MEMORY[0x1E0C80C00];
  v0 = [INIntentDescription alloc];
  v1 = objc_opt_class();
  v2 = objc_opt_class();
  v52 = -[INIntentSlotDescription initWithName:tag:facadePropertyName:dataPropertyName:isExtended:isPrivate:valueType:valueStyle:defaultValueSelectorStrings:provideOptionsSelectorStrings:resolutionResultClass:resolveSelectors:]([INIntentSlotDescription alloc], "initWithName:tag:facadePropertyName:dataPropertyName:isExtended:isPrivate:valueType:valueStyle:defaultValueSelectorStrings:provideOptionsSelectorStrings:resolutionResultClass:resolveSelectors:", CFSTR("soundType"), 2, CFSTR("soundType"), CFSTR("soundType"), 0, 0, 95, 1, 0, 0, 0, 0);
  v60 = v52;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v60, 1);
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  _INIntentSchemaBuildIntentSlotDescriptionMap(v51);
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  v49 = -[INIntentDescription initWithName:responseName:facadeClass:dataClass:type:isPrivate:handleSelector:confirmSelector:slotsByName:](v0, "initWithName:responseName:facadeClass:dataClass:type:isPrivate:handleSelector:confirmSelector:slotsByName:", CFSTR("PlayAnnouncementSoundIntent"), CFSTR("PlayAnnouncementSoundIntentResponse"), v1, v2, CFSTR("sirikit.intent.home.communication.PlayAnnouncementSoundIntent"), 0, sel_handlePlayAnnouncementSound_completion_, sel_confirmPlayAnnouncementSound_completion_, v50);
  v61[0] = v49;
  v3 = [INIntentDescription alloc];
  v4 = objc_opt_class();
  v5 = objc_opt_class();
  v48 = -[INIntentSlotDescription initWithName:tag:facadePropertyName:dataPropertyName:isExtended:isPrivate:valueType:valueStyle:defaultValueSelectorStrings:provideOptionsSelectorStrings:resolutionResultClass:resolveSelectors:]([INIntentSlotDescription alloc], "initWithName:tag:facadePropertyName:dataPropertyName:isExtended:isPrivate:valueType:valueStyle:defaultValueSelectorStrings:provideOptionsSelectorStrings:resolutionResultClass:resolveSelectors:", CFSTR("readType"), 2, CFSTR("readType"), CFSTR("readType"), 0, 0, 96, 1, 0, 0, 0, 0);
  v59[0] = v48;
  v47 = -[INIntentSlotDescription initWithName:tag:facadePropertyName:dataPropertyName:isExtended:isPrivate:valueType:valueStyle:defaultValueSelectorStrings:provideOptionsSelectorStrings:resolutionResultClass:resolveSelectors:]([INIntentSlotDescription alloc], "initWithName:tag:facadePropertyName:dataPropertyName:isExtended:isPrivate:valueType:valueStyle:defaultValueSelectorStrings:provideOptionsSelectorStrings:resolutionResultClass:resolveSelectors:", CFSTR("startAnnouncementIdentifier"), 3, CFSTR("startAnnouncementIdentifier"), CFSTR("startAnnouncementIdentifier"), 0, 0, 7, 1, 0, 0, 0, 0);
  v59[1] = v47;
  v46 = -[INIntentSlotDescription initWithName:tag:facadePropertyName:dataPropertyName:isExtended:isPrivate:valueType:valueStyle:defaultValueSelectorStrings:provideOptionsSelectorStrings:resolutionResultClass:resolveSelectors:]([INIntentSlotDescription alloc], "initWithName:tag:facadePropertyName:dataPropertyName:isExtended:isPrivate:valueType:valueStyle:defaultValueSelectorStrings:provideOptionsSelectorStrings:resolutionResultClass:resolveSelectors:", CFSTR("userNotificationType"), 4, CFSTR("userNotificationType"), CFSTR("userNotificationType"), 0, 0, 97, 1, 0, 0, 0, 0);
  v59[2] = v46;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v59, 3);
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  _INIntentSchemaBuildIntentSlotDescriptionMap(v45);
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  v43 = -[INIntentDescription initWithName:responseName:facadeClass:dataClass:type:isPrivate:handleSelector:confirmSelector:slotsByName:](v3, "initWithName:responseName:facadeClass:dataClass:type:isPrivate:handleSelector:confirmSelector:slotsByName:", CFSTR("ReadAnnouncementIntent"), CFSTR("ReadAnnouncementIntentResponse"), v4, v5, CFSTR("sirikit.intent.home.communication.ReadAnnouncementIntent"), 0, sel_handleReadAnnouncement_completion_, sel_confirmReadAnnouncement_completion_, v44);
  v61[1] = v43;
  v6 = [INIntentDescription alloc];
  v7 = objc_opt_class();
  v8 = objc_opt_class();
  v42 = -[INIntentSlotDescription initWithName:tag:facadePropertyName:dataPropertyName:isExtended:isPrivate:valueType:valueStyle:defaultValueSelectorStrings:provideOptionsSelectorStrings:resolutionResultClass:resolveSelectors:]([INIntentSlotDescription alloc], "initWithName:tag:facadePropertyName:dataPropertyName:isExtended:isPrivate:valueType:valueStyle:defaultValueSelectorStrings:provideOptionsSelectorStrings:resolutionResultClass:resolveSelectors:", CFSTR("announcement"), 2, CFSTR("announcement"), CFSTR("announcement"), 0, 0, 93, 1, &unk_1E23F7428, &unk_1E23F7440, objc_opt_class(), sel_resolveAnnouncementForSendAnnouncement_withCompletion_, sel_resolveAnnouncementForSendAnnouncement_completion_, 0);
  v58[0] = v42;
  v41 = -[INIntentSlotDescription initWithName:tag:facadePropertyName:dataPropertyName:isExtended:isPrivate:valueType:valueStyle:defaultValueSelectorStrings:provideOptionsSelectorStrings:resolutionResultClass:resolveSelectors:]([INIntentSlotDescription alloc], "initWithName:tag:facadePropertyName:dataPropertyName:isExtended:isPrivate:valueType:valueStyle:defaultValueSelectorStrings:provideOptionsSelectorStrings:resolutionResultClass:resolveSelectors:", CFSTR("recipients"), 3, CFSTR("recipients"), CFSTR("recipients"), 0, 0, 49, 3, &unk_1E23F7458, &unk_1E23F7470, objc_opt_class(), sel_resolveRecipientsForSendAnnouncement_withCompletion_, sel_resolveRecipientsForSendAnnouncement_completion_, 0);
  v58[1] = v41;
  v40 = -[INIntentSlotDescription initWithName:tag:facadePropertyName:dataPropertyName:isExtended:isPrivate:valueType:valueStyle:defaultValueSelectorStrings:provideOptionsSelectorStrings:resolutionResultClass:resolveSelectors:]([INIntentSlotDescription alloc], "initWithName:tag:facadePropertyName:dataPropertyName:isExtended:isPrivate:valueType:valueStyle:defaultValueSelectorStrings:provideOptionsSelectorStrings:resolutionResultClass:resolveSelectors:", CFSTR("isReply"), 4, CFSTR("isReply"), CFSTR("isReply"), 0, 0, 1, 1, 0, 0, 0, 0);
  v58[2] = v40;
  v39 = -[INIntentSlotDescription initWithName:tag:facadePropertyName:dataPropertyName:isExtended:isPrivate:valueType:valueStyle:defaultValueSelectorStrings:provideOptionsSelectorStrings:resolutionResultClass:resolveSelectors:]([INIntentSlotDescription alloc], "initWithName:tag:facadePropertyName:dataPropertyName:isExtended:isPrivate:valueType:valueStyle:defaultValueSelectorStrings:provideOptionsSelectorStrings:resolutionResultClass:resolveSelectors:", CFSTR("sharedUserID"), 5, CFSTR("sharedUserID"), CFSTR("sharedUserID"), 0, 1, 7, 1, 0, 0, 0, 0);
  v58[3] = v39;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v58, 4);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  _INIntentSchemaBuildIntentSlotDescriptionMap(v38);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[INIntentDescription initWithName:responseName:facadeClass:dataClass:type:isPrivate:handleSelector:confirmSelector:slotsByName:](v6, "initWithName:responseName:facadeClass:dataClass:type:isPrivate:handleSelector:confirmSelector:slotsByName:", CFSTR("SendAnnouncementIntent"), CFSTR("SendAnnouncementIntentResponse"), v7, v8, CFSTR("sirikit.intent.home.communication.SendAnnouncementIntent"), 0, sel_handleSendAnnouncement_completion_, sel_confirmSendAnnouncement_completion_, v9);
  v61[2] = v10;
  v11 = [INIntentDescription alloc];
  v12 = objc_opt_class();
  v13 = objc_opt_class();
  v14 = (void *)MEMORY[0x1E0C9AA60];
  _INIntentSchemaBuildIntentSlotDescriptionMap(MEMORY[0x1E0C9AA60]);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = -[INIntentDescription initWithName:responseName:facadeClass:dataClass:type:isPrivate:handleSelector:confirmSelector:slotsByName:](v11, "initWithName:responseName:facadeClass:dataClass:type:isPrivate:handleSelector:confirmSelector:slotsByName:", CFSTR("SkipAnnouncementIntent"), CFSTR("SkipAnnouncementIntentResponse"), v12, v13, CFSTR("sirikit.intent.home.communication.SkipAnnouncementIntent"), 0, sel_handleSkipAnnouncement_completion_, sel_confirmSkipAnnouncement_completion_, v15);
  v61[3] = v16;
  v17 = [INIntentDescription alloc];
  v18 = objc_opt_class();
  v19 = objc_opt_class();
  _INIntentSchemaBuildIntentSlotDescriptionMap(v14);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = -[INIntentDescription initWithName:responseName:facadeClass:dataClass:type:isPrivate:handleSelector:confirmSelector:slotsByName:](v17, "initWithName:responseName:facadeClass:dataClass:type:isPrivate:handleSelector:confirmSelector:slotsByName:", CFSTR("StopAnnouncementIntent"), CFSTR("StopAnnouncementIntentResponse"), v18, v19, CFSTR("sirikit.intent.home.communication.StopAnnouncementIntent"), 0, sel_handleStopAnnouncement_completion_, sel_confirmStopAnnouncement_completion_, v20);
  v61[4] = v21;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v61, 5);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  v23 = objc_msgSend(v22, "count");
  v24 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", v23);
  v25 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", v23);
  v53 = 0u;
  v54 = 0u;
  v55 = 0u;
  v56 = 0u;
  v26 = v22;
  v27 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v53, v57, 16);
  if (v27)
  {
    v28 = v27;
    v29 = *(_QWORD *)v54;
    do
    {
      for (i = 0; i != v28; ++i)
      {
        if (*(_QWORD *)v54 != v29)
          objc_enumerationMutation(v26);
        v31 = *(void **)(*((_QWORD *)&v53 + 1) + 8 * i);
        objc_msgSend(v31, "name");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "setObject:forKey:", v31, v32);

        objc_msgSend(v31, "type");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "setObject:forKey:", v31, v33);

      }
      v28 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v53, v57, 16);
    }
    while (v28);
  }

  v34 = objc_msgSend(v24, "copy");
  v35 = (void *)sHomeCommunicationDomain_intentDescsByName;
  sHomeCommunicationDomain_intentDescsByName = v34;

  v36 = objc_msgSend(v25, "copy");
  v37 = (void *)sHomeCommunicationDomain_intentDescsByType;
  sHomeCommunicationDomain_intentDescsByType = v36;

}

@end
