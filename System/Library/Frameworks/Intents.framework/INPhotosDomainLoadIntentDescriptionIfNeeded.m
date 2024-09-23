@implementation INPhotosDomainLoadIntentDescriptionIfNeeded

void ___INPhotosDomainLoadIntentDescriptionIfNeeded_block_invoke()
{
  INIntentSlotDescription *v0;
  INIntentSlotDescription *v1;
  INIntentSlotDescription *v2;
  INIntentSlotDescription *v3;
  INIntentSlotDescription *v4;
  INIntentSlotDescription *v5;
  void *v6;
  void *v7;
  INIntentDescription *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  INIntentSlotDescription *v28;
  INIntentSlotDescription *v29;
  INIntentSlotDescription *v30;
  uint64_t v31;
  uint64_t v32;
  INIntentDescription *v33;
  uint64_t v34;
  INIntentSlotDescription *v35;
  INIntentDescription *v36;
  INIntentDescription *v37;
  INIntentSlotDescription *v38;
  INIntentSlotDescription *v39;
  INIntentSlotDescription *v40;
  INIntentSlotDescription *v41;
  INIntentSlotDescription *v42;
  INIntentSlotDescription *v43;
  INIntentSlotDescription *v44;
  INIntentSlotDescription *v45;
  INIntentSlotDescription *v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  _BYTE v51[128];
  _QWORD v52[7];
  _QWORD v53[12];
  _QWORD v54[4];

  v54[2] = *MEMORY[0x1E0C80C00];
  v36 = [INIntentDescription alloc];
  v34 = objc_opt_class();
  v32 = objc_opt_class();
  v46 = -[INIntentSlotDescription initWithName:tag:facadePropertyName:dataPropertyName:isExtended:isPrivate:valueType:valueStyle:defaultValueSelectorStrings:provideOptionsSelectorStrings:resolutionResultClass:resolveSelectors:]([INIntentSlotDescription alloc], "initWithName:tag:facadePropertyName:dataPropertyName:isExtended:isPrivate:valueType:valueStyle:defaultValueSelectorStrings:provideOptionsSelectorStrings:resolutionResultClass:resolveSelectors:", CFSTR("dateCreated"), 2, CFSTR("dateCreated"), CFSTR("dateCreated"), 0, 0, 16, 1, &unk_1E23F8688, &unk_1E23F86A0, objc_opt_class(), sel_resolveDateCreatedForSearchForPhotos_withCompletion_, sel_resolveDateCreatedForSearchForPhotos_completion_, 0);
  v53[0] = v46;
  v45 = -[INIntentSlotDescription initWithName:tag:facadePropertyName:dataPropertyName:isExtended:isPrivate:valueType:valueStyle:defaultValueSelectorStrings:provideOptionsSelectorStrings:resolutionResultClass:resolveSelectors:]([INIntentSlotDescription alloc], "initWithName:tag:facadePropertyName:dataPropertyName:isExtended:isPrivate:valueType:valueStyle:defaultValueSelectorStrings:provideOptionsSelectorStrings:resolutionResultClass:resolveSelectors:", CFSTR("locationCreated"), 3, CFSTR("locationCreated"), CFSTR("locationCreated"), 0, 0, 27, 1, &unk_1E23F86B8, &unk_1E23F86D0, objc_opt_class(), sel_resolveLocationCreatedForSearchForPhotos_withCompletion_, sel_resolveLocationCreatedForSearchForPhotos_completion_, 0);
  v53[1] = v45;
  v44 = -[INIntentSlotDescription initWithName:tag:facadePropertyName:dataPropertyName:isExtended:isPrivate:valueType:valueStyle:defaultValueSelectorStrings:provideOptionsSelectorStrings:resolutionResultClass:resolveSelectors:]([INIntentSlotDescription alloc], "initWithName:tag:facadePropertyName:dataPropertyName:isExtended:isPrivate:valueType:valueStyle:defaultValueSelectorStrings:provideOptionsSelectorStrings:resolutionResultClass:resolveSelectors:", CFSTR("albumName"), 5, CFSTR("albumName"), CFSTR("albumName"), 0, 0, 30, 1, &unk_1E23F86E8, &unk_1E23F8700, objc_opt_class(), sel_resolveAlbumNameForSearchForPhotos_withCompletion_, sel_resolveAlbumNameForSearchForPhotos_completion_, 0);
  v53[2] = v44;
  v43 = -[INIntentSlotDescription initWithName:tag:facadePropertyName:dataPropertyName:isExtended:isPrivate:valueType:valueStyle:defaultValueSelectorStrings:provideOptionsSelectorStrings:resolutionResultClass:resolveSelectors:]([INIntentSlotDescription alloc], "initWithName:tag:facadePropertyName:dataPropertyName:isExtended:isPrivate:valueType:valueStyle:defaultValueSelectorStrings:provideOptionsSelectorStrings:resolutionResultClass:resolveSelectors:", CFSTR("searchTerm"), 8, CFSTR("searchTerms"), CFSTR("searchTerms"), 0, 0, 31, 1, &unk_1E23F8718, &unk_1E23F8730, objc_opt_class(), sel_resolveSearchTermsForSearchForPhotos_withCompletion_, sel_resolveSearchTermsForSearchForPhotos_completion_, 0);
  v53[3] = v43;
  v42 = -[INIntentSlotDescription initWithName:tag:facadePropertyName:dataPropertyName:isExtended:isPrivate:valueType:valueStyle:defaultValueSelectorStrings:provideOptionsSelectorStrings:resolutionResultClass:resolveSelectors:]([INIntentSlotDescription alloc], "initWithName:tag:facadePropertyName:dataPropertyName:isExtended:isPrivate:valueType:valueStyle:defaultValueSelectorStrings:provideOptionsSelectorStrings:resolutionResultClass:resolveSelectors:", CFSTR("includedAttribute"), 9, CFSTR("includedAttributes"), CFSTR("includedAttributes"), 0, 0, 98, 3, 0, 0, 0, 0);
  v53[4] = v42;
  v41 = -[INIntentSlotDescription initWithName:tag:facadePropertyName:dataPropertyName:isExtended:isPrivate:valueType:valueStyle:defaultValueSelectorStrings:provideOptionsSelectorStrings:resolutionResultClass:resolveSelectors:]([INIntentSlotDescription alloc], "initWithName:tag:facadePropertyName:dataPropertyName:isExtended:isPrivate:valueType:valueStyle:defaultValueSelectorStrings:provideOptionsSelectorStrings:resolutionResultClass:resolveSelectors:", CFSTR("excludedAttribute"), 10, CFSTR("excludedAttributes"), CFSTR("excludedAttributes"), 0, 0, 98, 3, 0, 0, 0, 0);
  v53[5] = v41;
  v40 = -[INIntentSlotDescription initWithName:tag:facadePropertyName:dataPropertyName:isExtended:isPrivate:valueType:valueStyle:defaultValueSelectorStrings:provideOptionsSelectorStrings:resolutionResultClass:resolveSelectors:]([INIntentSlotDescription alloc], "initWithName:tag:facadePropertyName:dataPropertyName:isExtended:isPrivate:valueType:valueStyle:defaultValueSelectorStrings:provideOptionsSelectorStrings:resolutionResultClass:resolveSelectors:", CFSTR("peopleInPhoto"), 11, CFSTR("peopleInPhoto"), CFSTR("peopleInPhoto"), 0, 0, 11, 1, &unk_1E23F8748, &unk_1E23F8760, objc_opt_class(), sel_resolvePeopleInPhotoForSearchForPhotos_withCompletion_, sel_resolvePeopleInPhotoForSearchForPhotos_completion_, 0);
  v53[6] = v40;
  v39 = -[INIntentSlotDescription initWithName:tag:facadePropertyName:dataPropertyName:isExtended:isPrivate:valueType:valueStyle:defaultValueSelectorStrings:provideOptionsSelectorStrings:resolutionResultClass:resolveSelectors:]([INIntentSlotDescription alloc], "initWithName:tag:facadePropertyName:dataPropertyName:isExtended:isPrivate:valueType:valueStyle:defaultValueSelectorStrings:provideOptionsSelectorStrings:resolutionResultClass:resolveSelectors:", CFSTR("events"), 12, CFSTR("events"), CFSTR("events"), 0, 1, 100, 1, 0, 0, 0, 0);
  v53[7] = v39;
  v38 = -[INIntentSlotDescription initWithName:tag:facadePropertyName:dataPropertyName:isExtended:isPrivate:valueType:valueStyle:defaultValueSelectorStrings:provideOptionsSelectorStrings:resolutionResultClass:resolveSelectors:]([INIntentSlotDescription alloc], "initWithName:tag:facadePropertyName:dataPropertyName:isExtended:isPrivate:valueType:valueStyle:defaultValueSelectorStrings:provideOptionsSelectorStrings:resolutionResultClass:resolveSelectors:", CFSTR("places"), 13, CFSTR("places"), CFSTR("places"), 0, 1, 102, 1, 0, 0, 0, 0);
  v53[8] = v38;
  v30 = -[INIntentSlotDescription initWithName:tag:facadePropertyName:dataPropertyName:isExtended:isPrivate:valueType:valueStyle:defaultValueSelectorStrings:provideOptionsSelectorStrings:resolutionResultClass:resolveSelectors:]([INIntentSlotDescription alloc], "initWithName:tag:facadePropertyName:dataPropertyName:isExtended:isPrivate:valueType:valueStyle:defaultValueSelectorStrings:provideOptionsSelectorStrings:resolutionResultClass:resolveSelectors:", CFSTR("activities"), 14, CFSTR("activities"), CFSTR("activities"), 0, 1, 105, 1, 0, 0, 0, 0);
  v53[9] = v30;
  v29 = -[INIntentSlotDescription initWithName:tag:facadePropertyName:dataPropertyName:isExtended:isPrivate:valueType:valueStyle:defaultValueSelectorStrings:provideOptionsSelectorStrings:resolutionResultClass:resolveSelectors:]([INIntentSlotDescription alloc], "initWithName:tag:facadePropertyName:dataPropertyName:isExtended:isPrivate:valueType:valueStyle:defaultValueSelectorStrings:provideOptionsSelectorStrings:resolutionResultClass:resolveSelectors:", CFSTR("geographicalFeatures"), 15, CFSTR("geographicalFeatures"), CFSTR("geographicalFeatures"), 0, 1, 107, 1, 0, 0, 0, 0);
  v53[10] = v29;
  v28 = -[INIntentSlotDescription initWithName:tag:facadePropertyName:dataPropertyName:isExtended:isPrivate:valueType:valueStyle:defaultValueSelectorStrings:provideOptionsSelectorStrings:resolutionResultClass:resolveSelectors:]([INIntentSlotDescription alloc], "initWithName:tag:facadePropertyName:dataPropertyName:isExtended:isPrivate:valueType:valueStyle:defaultValueSelectorStrings:provideOptionsSelectorStrings:resolutionResultClass:resolveSelectors:", CFSTR("memoryName"), 16, CFSTR("memoryName"), CFSTR("memoryName"), 0, 1, 30, 1, 0, 0, 0, 0);
  v53[11] = v28;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v53, 12);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  _INIntentSchemaBuildIntentSlotDescriptionMap(v27);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v37 = -[INIntentDescription initWithName:responseName:facadeClass:dataClass:type:isPrivate:handleSelector:confirmSelector:slotsByName:](v36, "initWithName:responseName:facadeClass:dataClass:type:isPrivate:handleSelector:confirmSelector:slotsByName:", CFSTR("SearchForPhotosIntent"), CFSTR("SearchForPhotosIntentResponse"), v34, v32, CFSTR("sirikit.intent.photos.SearchForPhotosIntent"), 0, sel_handleSearchForPhotos_completion_, sel_confirmSearchForPhotos_completion_, v26);
  v54[0] = v37;
  v33 = [INIntentDescription alloc];
  v31 = objc_opt_class();
  v25 = objc_opt_class();
  v35 = -[INIntentSlotDescription initWithName:tag:facadePropertyName:dataPropertyName:isExtended:isPrivate:valueType:valueStyle:defaultValueSelectorStrings:provideOptionsSelectorStrings:resolutionResultClass:resolveSelectors:]([INIntentSlotDescription alloc], "initWithName:tag:facadePropertyName:dataPropertyName:isExtended:isPrivate:valueType:valueStyle:defaultValueSelectorStrings:provideOptionsSelectorStrings:resolutionResultClass:resolveSelectors:", CFSTR("dateCreated"), 2, CFSTR("dateCreated"), CFSTR("dateCreated"), 0, 0, 16, 1, &unk_1E23F8778, &unk_1E23F8790, objc_opt_class(), sel_resolveDateCreatedForStartPhotoPlayback_withCompletion_, sel_resolveDateCreatedForStartPhotoPlayback_completion_, 0);
  v52[0] = v35;
  v0 = -[INIntentSlotDescription initWithName:tag:facadePropertyName:dataPropertyName:isExtended:isPrivate:valueType:valueStyle:defaultValueSelectorStrings:provideOptionsSelectorStrings:resolutionResultClass:resolveSelectors:]([INIntentSlotDescription alloc], "initWithName:tag:facadePropertyName:dataPropertyName:isExtended:isPrivate:valueType:valueStyle:defaultValueSelectorStrings:provideOptionsSelectorStrings:resolutionResultClass:resolveSelectors:", CFSTR("locationCreated"), 3, CFSTR("locationCreated"), CFSTR("locationCreated"), 0, 0, 27, 1, &unk_1E23F87A8, &unk_1E23F87C0, objc_opt_class(), sel_resolveLocationCreatedForStartPhotoPlayback_withCompletion_, sel_resolveLocationCreatedForStartPhotoPlayback_completion_, 0);
  v52[1] = v0;
  v1 = -[INIntentSlotDescription initWithName:tag:facadePropertyName:dataPropertyName:isExtended:isPrivate:valueType:valueStyle:defaultValueSelectorStrings:provideOptionsSelectorStrings:resolutionResultClass:resolveSelectors:]([INIntentSlotDescription alloc], "initWithName:tag:facadePropertyName:dataPropertyName:isExtended:isPrivate:valueType:valueStyle:defaultValueSelectorStrings:provideOptionsSelectorStrings:resolutionResultClass:resolveSelectors:", CFSTR("albumName"), 5, CFSTR("albumName"), CFSTR("albumName"), 0, 0, 30, 1, &unk_1E23F87D8, &unk_1E23F87F0, objc_opt_class(), sel_resolveAlbumNameForStartPhotoPlayback_withCompletion_, sel_resolveAlbumNameForStartPhotoPlayback_completion_, 0);
  v52[2] = v1;
  v2 = -[INIntentSlotDescription initWithName:tag:facadePropertyName:dataPropertyName:isExtended:isPrivate:valueType:valueStyle:defaultValueSelectorStrings:provideOptionsSelectorStrings:resolutionResultClass:resolveSelectors:]([INIntentSlotDescription alloc], "initWithName:tag:facadePropertyName:dataPropertyName:isExtended:isPrivate:valueType:valueStyle:defaultValueSelectorStrings:provideOptionsSelectorStrings:resolutionResultClass:resolveSelectors:", CFSTR("searchTerm"), 7, CFSTR("searchTerms"), CFSTR("searchTerms"), 0, 0, 31, 1, 0, 0, 0, 0);
  v52[3] = v2;
  v3 = -[INIntentSlotDescription initWithName:tag:facadePropertyName:dataPropertyName:isExtended:isPrivate:valueType:valueStyle:defaultValueSelectorStrings:provideOptionsSelectorStrings:resolutionResultClass:resolveSelectors:]([INIntentSlotDescription alloc], "initWithName:tag:facadePropertyName:dataPropertyName:isExtended:isPrivate:valueType:valueStyle:defaultValueSelectorStrings:provideOptionsSelectorStrings:resolutionResultClass:resolveSelectors:", CFSTR("includedAttribute"), 8, CFSTR("includedAttributes"), CFSTR("includedAttributes"), 0, 0, 98, 3, 0, 0, 0, 0);
  v52[4] = v3;
  v4 = -[INIntentSlotDescription initWithName:tag:facadePropertyName:dataPropertyName:isExtended:isPrivate:valueType:valueStyle:defaultValueSelectorStrings:provideOptionsSelectorStrings:resolutionResultClass:resolveSelectors:]([INIntentSlotDescription alloc], "initWithName:tag:facadePropertyName:dataPropertyName:isExtended:isPrivate:valueType:valueStyle:defaultValueSelectorStrings:provideOptionsSelectorStrings:resolutionResultClass:resolveSelectors:", CFSTR("excludedAttribute"), 9, CFSTR("excludedAttributes"), CFSTR("excludedAttributes"), 0, 0, 98, 3, 0, 0, 0, 0);
  v52[5] = v4;
  v5 = -[INIntentSlotDescription initWithName:tag:facadePropertyName:dataPropertyName:isExtended:isPrivate:valueType:valueStyle:defaultValueSelectorStrings:provideOptionsSelectorStrings:resolutionResultClass:resolveSelectors:]([INIntentSlotDescription alloc], "initWithName:tag:facadePropertyName:dataPropertyName:isExtended:isPrivate:valueType:valueStyle:defaultValueSelectorStrings:provideOptionsSelectorStrings:resolutionResultClass:resolveSelectors:", CFSTR("peopleInPhoto"), 10, CFSTR("peopleInPhoto"), CFSTR("peopleInPhoto"), 0, 0, 11, 1, &unk_1E23F8808, &unk_1E23F8820, objc_opt_class(), sel_resolvePeopleInPhotoForStartPhotoPlayback_withCompletion_, sel_resolvePeopleInPhotoForStartPhotoPlayback_completion_, 0);
  v52[6] = v5;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v52, 7);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  _INIntentSchemaBuildIntentSlotDescriptionMap(v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[INIntentDescription initWithName:responseName:facadeClass:dataClass:type:isPrivate:handleSelector:confirmSelector:slotsByName:](v33, "initWithName:responseName:facadeClass:dataClass:type:isPrivate:handleSelector:confirmSelector:slotsByName:", CFSTR("StartPhotoPlaybackIntent"), CFSTR("StartPhotoPlaybackIntentResponse"), v31, v25, CFSTR("sirikit.intent.photos.StartPhotoPlaybackIntent"), 0, sel_handleStartPhotoPlayback_completion_, sel_confirmStartPhotoPlayback_completion_, v7);
  v54[1] = v8;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v54, 2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = objc_msgSend(v9, "count");
  v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", v10);
  v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", v10);
  v47 = 0u;
  v48 = 0u;
  v49 = 0u;
  v50 = 0u;
  v13 = v9;
  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v47, v51, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v48;
    do
    {
      for (i = 0; i != v15; ++i)
      {
        if (*(_QWORD *)v48 != v16)
          objc_enumerationMutation(v13);
        v18 = *(void **)(*((_QWORD *)&v47 + 1) + 8 * i);
        objc_msgSend(v18, "name");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "setObject:forKey:", v18, v19);

        objc_msgSend(v18, "type");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "setObject:forKey:", v18, v20);

      }
      v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v47, v51, 16);
    }
    while (v15);
  }

  v21 = objc_msgSend(v11, "copy");
  v22 = (void *)sPhotosDomain_intentDescsByName;
  sPhotosDomain_intentDescsByName = v21;

  v23 = objc_msgSend(v12, "copy");
  v24 = (void *)sPhotosDomain_intentDescsByType;
  sPhotosDomain_intentDescsByType = v23;

}

@end
