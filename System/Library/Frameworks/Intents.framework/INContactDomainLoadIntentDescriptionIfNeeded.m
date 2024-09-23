@implementation INContactDomainLoadIntentDescriptionIfNeeded

void ___INContactDomainLoadIntentDescriptionIfNeeded_block_invoke()
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
  INIntentDescription *v9;
  uint64_t v10;
  uint64_t v11;
  INIntentSlotDescription *v12;
  INIntentSlotDescription *v13;
  void *v14;
  void *v15;
  INIntentDescription *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t i;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  void *v30;
  uint64_t v31;
  void *v32;
  INIntentDescription *v33;
  void *v34;
  void *v35;
  INIntentSlotDescription *v36;
  INIntentDescription *v37;
  void *v38;
  INIntentDescription *v39;
  void *v40;
  void *v41;
  INIntentSlotDescription *v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  _BYTE v47[128];
  _QWORD v48[2];
  INIntentSlotDescription *v49;
  INIntentSlotDescription *v50;
  _QWORD v51[6];

  v51[4] = *MEMORY[0x1E0C80C00];
  v0 = [INIntentDescription alloc];
  v1 = objc_opt_class();
  v2 = objc_opt_class();
  v42 = -[INIntentSlotDescription initWithName:tag:facadePropertyName:dataPropertyName:isExtended:isPrivate:valueType:valueStyle:defaultValueSelectorStrings:provideOptionsSelectorStrings:resolutionResultClass:resolveSelectors:]([INIntentSlotDescription alloc], "initWithName:tag:facadePropertyName:dataPropertyName:isExtended:isPrivate:valueType:valueStyle:defaultValueSelectorStrings:provideOptionsSelectorStrings:resolutionResultClass:resolveSelectors:", CFSTR("contactIdentifiers"), 2, CFSTR("contactIdentifiers"), CFSTR("contactIdentifiers"), 0, 0, 30, 3, &unk_1E23F7188, &unk_1E23F71A0, objc_opt_class(), sel_resolveContactIdentifiersForSearchForContact_withCompletion_, sel_resolveContactIdentifiersForSearchForContact_completion_, 0);
  v50 = v42;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v50, 1);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  _INIntentSchemaBuildIntentSlotDescriptionMap(v41);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  v39 = -[INIntentDescription initWithName:responseName:facadeClass:dataClass:type:isPrivate:handleSelector:confirmSelector:slotsByName:](v0, "initWithName:responseName:facadeClass:dataClass:type:isPrivate:handleSelector:confirmSelector:slotsByName:", CFSTR("SearchForContactIntent"), CFSTR("SearchForContactIntentResponse"), v1, v2, CFSTR("sirikit.intent.contact.SearchForContactIntent"), 0, sel_handleSearchForContact_completion_, sel_confirmSearchForContact_completion_, v40);
  v51[0] = v39;
  v3 = [INIntentDescription alloc];
  v4 = objc_opt_class();
  v5 = objc_opt_class();
  _INIntentSchemaBuildIntentSlotDescriptionMap(MEMORY[0x1E0C9AA60]);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v37 = -[INIntentDescription initWithName:responseName:facadeClass:dataClass:type:isPrivate:handleSelector:confirmSelector:slotsByName:](v3, "initWithName:responseName:facadeClass:dataClass:type:isPrivate:handleSelector:confirmSelector:slotsByName:", CFSTR("SearchForMeCardIntent"), CFSTR("SearchForMeCardIntentResponse"), v4, v5, CFSTR("sirikit.intent.contact.SearchForMeCardIntent"), 0, sel_handleSearchForMeCard_completion_, sel_confirmSearchForMeCard_completion_, v38);
  v51[1] = v37;
  v6 = [INIntentDescription alloc];
  v7 = objc_opt_class();
  v8 = objc_opt_class();
  v36 = -[INIntentSlotDescription initWithName:tag:facadePropertyName:dataPropertyName:isExtended:isPrivate:valueType:valueStyle:defaultValueSelectorStrings:provideOptionsSelectorStrings:resolutionResultClass:resolveSelectors:]([INIntentSlotDescription alloc], "initWithName:tag:facadePropertyName:dataPropertyName:isExtended:isPrivate:valueType:valueStyle:defaultValueSelectorStrings:provideOptionsSelectorStrings:resolutionResultClass:resolveSelectors:", CFSTR("targetNickname"), 2, CFSTR("targetNickname"), CFSTR("targetNickname"), 0, 0, 194, 1, &unk_1E23F71B8, &unk_1E23F71D0, objc_opt_class(), sel_resolveTargetNicknameForSetNickname_withCompletion_, sel_resolveTargetNicknameForSetNickname_completion_, 0);
  v49 = v36;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v49, 1);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  _INIntentSchemaBuildIntentSlotDescriptionMap(v35);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[INIntentDescription initWithName:responseName:facadeClass:dataClass:type:isPrivate:handleSelector:confirmSelector:slotsByName:](v6, "initWithName:responseName:facadeClass:dataClass:type:isPrivate:handleSelector:confirmSelector:slotsByName:", CFSTR("SetNicknameIntent"), CFSTR("SetNicknameIntentResponse"), v7, v8, CFSTR("sirikit.intent.contact.SetNicknameIntent"), 0, sel_handleSetNickname_completion_, sel_confirmSetNickname_completion_, v34);
  v51[2] = v9;
  v33 = [INIntentDescription alloc];
  v10 = objc_opt_class();
  v11 = objc_opt_class();
  v12 = -[INIntentSlotDescription initWithName:tag:facadePropertyName:dataPropertyName:isExtended:isPrivate:valueType:valueStyle:defaultValueSelectorStrings:provideOptionsSelectorStrings:resolutionResultClass:resolveSelectors:]([INIntentSlotDescription alloc], "initWithName:tag:facadePropertyName:dataPropertyName:isExtended:isPrivate:valueType:valueStyle:defaultValueSelectorStrings:provideOptionsSelectorStrings:resolutionResultClass:resolveSelectors:", CFSTR("contactIdentifiers"), 2, CFSTR("contactIdentifiers"), CFSTR("contactIdentifiers"), 0, 0, 30, 3, &unk_1E23F71E8, &unk_1E23F7200, objc_opt_class(), sel_resolveContactIdentifiersForSetRelationship_withCompletion_, sel_resolveContactIdentifiersForSetRelationship_completion_, 0);
  v48[0] = v12;
  v13 = -[INIntentSlotDescription initWithName:tag:facadePropertyName:dataPropertyName:isExtended:isPrivate:valueType:valueStyle:defaultValueSelectorStrings:provideOptionsSelectorStrings:resolutionResultClass:resolveSelectors:]([INIntentSlotDescription alloc], "initWithName:tag:facadePropertyName:dataPropertyName:isExtended:isPrivate:valueType:valueStyle:defaultValueSelectorStrings:provideOptionsSelectorStrings:resolutionResultClass:resolveSelectors:", CFSTR("targetRelationship"), 3, CFSTR("targetRelationship"), CFSTR("targetRelationship"), 0, 0, 193, 1, &unk_1E23F7218, &unk_1E23F7230, objc_opt_class(), sel_resolveTargetRelationshipForSetRelationship_withCompletion_, sel_resolveTargetRelationshipForSetRelationship_completion_, 0);
  v48[1] = v13;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v48, 2);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  _INIntentSchemaBuildIntentSlotDescriptionMap(v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = -[INIntentDescription initWithName:responseName:facadeClass:dataClass:type:isPrivate:handleSelector:confirmSelector:slotsByName:](v33, "initWithName:responseName:facadeClass:dataClass:type:isPrivate:handleSelector:confirmSelector:slotsByName:", CFSTR("SetRelationshipIntent"), CFSTR("SetRelationshipIntentResponse"), v10, v11, CFSTR("sirikit.intent.contact.SetRelationshipIntent"), 0, sel_handleSetRelationship_completion_, sel_confirmSetRelationship_completion_, v15);
  v51[3] = v16;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v51, 4);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  v18 = objc_msgSend(v17, "count");
  v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", v18);
  v20 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", v18);
  v43 = 0u;
  v44 = 0u;
  v45 = 0u;
  v46 = 0u;
  v21 = v17;
  v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v43, v47, 16);
  if (v22)
  {
    v23 = v22;
    v24 = *(_QWORD *)v44;
    do
    {
      for (i = 0; i != v23; ++i)
      {
        if (*(_QWORD *)v44 != v24)
          objc_enumerationMutation(v21);
        v26 = *(void **)(*((_QWORD *)&v43 + 1) + 8 * i);
        objc_msgSend(v26, "name");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "setObject:forKey:", v26, v27);

        objc_msgSend(v26, "type");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "setObject:forKey:", v26, v28);

      }
      v23 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v43, v47, 16);
    }
    while (v23);
  }

  v29 = objc_msgSend(v19, "copy");
  v30 = (void *)sContactDomain_intentDescsByName;
  sContactDomain_intentDescsByName = v29;

  v31 = objc_msgSend(v20, "copy");
  v32 = (void *)sContactDomain_intentDescsByType;
  sContactDomain_intentDescsByType = v31;

}

@end
