@implementation INPhotosDomainLoadIntentResponseDescriptionIfNeeded

void ___INPhotosDomainLoadIntentResponseDescriptionIfNeeded_block_invoke()
{
  INIntentResponseDescription *v0;
  uint64_t v1;
  uint64_t v2;
  void *v3;
  void *v4;
  INIntentResponseDescription *v5;
  INIntentResponseDescription *v6;
  uint64_t v7;
  uint64_t v8;
  INIntentSlotDescription *v9;
  void *v10;
  void *v11;
  INIntentResponseDescription *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t i;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  void *v28;
  INIntentSlotDescription *v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _BYTE v34[128];
  INIntentSlotDescription *v35;
  INIntentSlotDescription *v36;
  _QWORD v37[4];

  v37[2] = *MEMORY[0x1E0C80C00];
  v0 = [INIntentResponseDescription alloc];
  v1 = objc_opt_class();
  v2 = objc_opt_class();
  v29 = -[INIntentSlotDescription initWithName:tag:facadePropertyName:dataPropertyName:isExtended:isPrivate:valueType:valueStyle:defaultValueSelectorStrings:provideOptionsSelectorStrings:resolutionResultClass:resolveSelectors:]([INIntentSlotDescription alloc], "initWithName:tag:facadePropertyName:dataPropertyName:isExtended:isPrivate:valueType:valueStyle:defaultValueSelectorStrings:provideOptionsSelectorStrings:resolutionResultClass:resolveSelectors:", CFSTR("searchResultsCount"), 7, CFSTR("searchResultsCount"), CFSTR("searchResultsCount"), 0, 0, 5, 1, 0, 0, 0, 0);
  v36 = v29;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v36, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  _INIntentSchemaBuildIntentSlotDescriptionMap(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[INIntentResponseDescription initWithName:facadeClass:dataClass:type:isPrivate:slotsByName:](v0, "initWithName:facadeClass:dataClass:type:isPrivate:slotsByName:", CFSTR("SearchForPhotosIntentResponse"), v1, v2, CFSTR("sirikit.intent.photos.SearchForPhotosIntentResponse"), 0, v4);
  v37[0] = v5;
  v6 = [INIntentResponseDescription alloc];
  v7 = objc_opt_class();
  v8 = objc_opt_class();
  v9 = -[INIntentSlotDescription initWithName:tag:facadePropertyName:dataPropertyName:isExtended:isPrivate:valueType:valueStyle:defaultValueSelectorStrings:provideOptionsSelectorStrings:resolutionResultClass:resolveSelectors:]([INIntentSlotDescription alloc], "initWithName:tag:facadePropertyName:dataPropertyName:isExtended:isPrivate:valueType:valueStyle:defaultValueSelectorStrings:provideOptionsSelectorStrings:resolutionResultClass:resolveSelectors:", CFSTR("searchResultsCount"), 7, CFSTR("searchResultsCount"), CFSTR("searchResultsCount"), 0, 0, 5, 1, 0, 0, 0, 0);
  v35 = v9;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v35, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  _INIntentSchemaBuildIntentSlotDescriptionMap(v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = -[INIntentResponseDescription initWithName:facadeClass:dataClass:type:isPrivate:slotsByName:](v6, "initWithName:facadeClass:dataClass:type:isPrivate:slotsByName:", CFSTR("StartPhotoPlaybackIntentResponse"), v7, v8, CFSTR("sirikit.intent.photos.StartPhotoPlaybackIntentResponse"), 0, v11);
  v37[1] = v12;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v37, 2);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = objc_msgSend(v13, "count");
  v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", v14);
  v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", v14);
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  v17 = v13;
  v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
  if (v18)
  {
    v19 = v18;
    v20 = *(_QWORD *)v31;
    do
    {
      for (i = 0; i != v19; ++i)
      {
        if (*(_QWORD *)v31 != v20)
          objc_enumerationMutation(v17);
        v22 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * i);
        objc_msgSend(v22, "name");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "setObject:forKey:", v22, v23);

        objc_msgSend(v22, "type");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "setObject:forKey:", v22, v24);

      }
      v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
    }
    while (v19);
  }

  v25 = objc_msgSend(v15, "copy");
  v26 = (void *)sPhotosDomain_intentResponseDescsByName;
  sPhotosDomain_intentResponseDescsByName = v25;

  v27 = objc_msgSend(v16, "copy");
  v28 = (void *)sPhotosDomain_intentResponseDescsByType;
  sPhotosDomain_intentResponseDescsByType = v27;

}

@end
