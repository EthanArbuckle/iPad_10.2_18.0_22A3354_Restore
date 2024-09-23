@implementation INRidesharingDomainLoadIntentResponseDescriptionIfNeeded

void ___INRidesharingDomainLoadIntentResponseDescriptionIfNeeded_block_invoke()
{
  INIntentResponseDescription *v0;
  uint64_t v1;
  uint64_t v2;
  INIntentResponseDescription *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  INIntentResponseDescription *v8;
  INIntentResponseDescription *v9;
  uint64_t v10;
  uint64_t v11;
  INIntentSlotDescription *v12;
  void *v13;
  void *v14;
  INIntentResponseDescription *v15;
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
  INIntentSlotDescription *v32;
  INIntentSlotDescription *v33;
  INIntentSlotDescription *v34;
  INIntentResponseDescription *v35;
  void *v36;
  void *v37;
  INIntentSlotDescription *v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  _BYTE v43[128];
  INIntentSlotDescription *v44;
  _QWORD v45[3];
  INIntentSlotDescription *v46;
  _QWORD v47[5];

  v47[3] = *MEMORY[0x1E0C80C00];
  v0 = [INIntentResponseDescription alloc];
  v1 = objc_opt_class();
  v2 = objc_opt_class();
  v38 = -[INIntentSlotDescription initWithName:tag:facadePropertyName:dataPropertyName:isExtended:isPrivate:valueType:valueStyle:defaultValueSelectorStrings:provideOptionsSelectorStrings:resolutionResultClass:resolveSelectors:]([INIntentSlotDescription alloc], "initWithName:tag:facadePropertyName:dataPropertyName:isExtended:isPrivate:valueType:valueStyle:defaultValueSelectorStrings:provideOptionsSelectorStrings:resolutionResultClass:resolveSelectors:", CFSTR("rideStatus"), 1, CFSTR("rideStatus"), CFSTR("rideStatus"), 0, 0, 0, 1, 0, 0, 0, 0);
  v46 = v38;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v46, 1);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  _INIntentSchemaBuildIntentSlotDescriptionMap(v37);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = -[INIntentResponseDescription initWithName:facadeClass:dataClass:type:isPrivate:slotsByName:](v0, "initWithName:facadeClass:dataClass:type:isPrivate:slotsByName:", CFSTR("GetRideStatusIntentResponse"), v1, v2, CFSTR("sirikit.intent.ride.GetRideStatusIntentResponse"), 0, v36);
  v47[0] = v35;
  v3 = [INIntentResponseDescription alloc];
  v4 = objc_opt_class();
  v5 = objc_opt_class();
  v34 = -[INIntentSlotDescription initWithName:tag:facadePropertyName:dataPropertyName:isExtended:isPrivate:valueType:valueStyle:defaultValueSelectorStrings:provideOptionsSelectorStrings:resolutionResultClass:resolveSelectors:]([INIntentSlotDescription alloc], "initWithName:tag:facadePropertyName:dataPropertyName:isExtended:isPrivate:valueType:valueStyle:defaultValueSelectorStrings:provideOptionsSelectorStrings:resolutionResultClass:resolveSelectors:", CFSTR("rideOptions"), 1, CFSTR("rideOptions"), CFSTR("rideOptions"), 0, 0, 0, 3, 0, 0, 0, 0);
  v45[0] = v34;
  v33 = -[INIntentSlotDescription initWithName:tag:facadePropertyName:dataPropertyName:isExtended:isPrivate:valueType:valueStyle:defaultValueSelectorStrings:provideOptionsSelectorStrings:resolutionResultClass:resolveSelectors:]([INIntentSlotDescription alloc], "initWithName:tag:facadePropertyName:dataPropertyName:isExtended:isPrivate:valueType:valueStyle:defaultValueSelectorStrings:provideOptionsSelectorStrings:resolutionResultClass:resolveSelectors:", CFSTR("paymentMethods"), 2, CFSTR("paymentMethods"), CFSTR("paymentMethods"), 0, 0, 54, 3, 0, 0, 0, 0);
  v45[1] = v33;
  v32 = -[INIntentSlotDescription initWithName:tag:facadePropertyName:dataPropertyName:isExtended:isPrivate:valueType:valueStyle:defaultValueSelectorStrings:provideOptionsSelectorStrings:resolutionResultClass:resolveSelectors:]([INIntentSlotDescription alloc], "initWithName:tag:facadePropertyName:dataPropertyName:isExtended:isPrivate:valueType:valueStyle:defaultValueSelectorStrings:provideOptionsSelectorStrings:resolutionResultClass:resolveSelectors:", CFSTR("expirationDate"), 4, CFSTR("expirationDate"), CFSTR("expirationDate"), 0, 0, 34, 1, 0, 0, 0, 0);
  v45[2] = v32;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v45, 3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  _INIntentSchemaBuildIntentSlotDescriptionMap(v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[INIntentResponseDescription initWithName:facadeClass:dataClass:type:isPrivate:slotsByName:](v3, "initWithName:facadeClass:dataClass:type:isPrivate:slotsByName:", CFSTR("ListRideOptionsIntentResponse"), v4, v5, CFSTR("sirikit.intent.ride.ListRideOptionsIntentResponse"), 0, v7);
  v47[1] = v8;
  v9 = [INIntentResponseDescription alloc];
  v10 = objc_opt_class();
  v11 = objc_opt_class();
  v12 = -[INIntentSlotDescription initWithName:tag:facadePropertyName:dataPropertyName:isExtended:isPrivate:valueType:valueStyle:defaultValueSelectorStrings:provideOptionsSelectorStrings:resolutionResultClass:resolveSelectors:]([INIntentSlotDescription alloc], "initWithName:tag:facadePropertyName:dataPropertyName:isExtended:isPrivate:valueType:valueStyle:defaultValueSelectorStrings:provideOptionsSelectorStrings:resolutionResultClass:resolveSelectors:", CFSTR("rideStatus"), 1, CFSTR("rideStatus"), CFSTR("rideStatus"), 0, 0, 0, 1, 0, 0, 0, 0);
  v44 = v12;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v44, 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  _INIntentSchemaBuildIntentSlotDescriptionMap(v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = -[INIntentResponseDescription initWithName:facadeClass:dataClass:type:isPrivate:slotsByName:](v9, "initWithName:facadeClass:dataClass:type:isPrivate:slotsByName:", CFSTR("RequestRideIntentResponse"), v10, v11, CFSTR("sirikit.intent.ride.RequestRideIntentResponse"), 0, v14);
  v47[2] = v15;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v47, 3);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  v17 = objc_msgSend(v16, "count");
  v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", v17);
  v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", v17);
  v39 = 0u;
  v40 = 0u;
  v41 = 0u;
  v42 = 0u;
  v20 = v16;
  v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v39, v43, 16);
  if (v21)
  {
    v22 = v21;
    v23 = *(_QWORD *)v40;
    do
    {
      for (i = 0; i != v22; ++i)
      {
        if (*(_QWORD *)v40 != v23)
          objc_enumerationMutation(v20);
        v25 = *(void **)(*((_QWORD *)&v39 + 1) + 8 * i);
        objc_msgSend(v25, "name");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "setObject:forKey:", v25, v26);

        objc_msgSend(v25, "type");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "setObject:forKey:", v25, v27);

      }
      v22 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v39, v43, 16);
    }
    while (v22);
  }

  v28 = objc_msgSend(v18, "copy");
  v29 = (void *)sRidesharingDomain_intentResponseDescsByName;
  sRidesharingDomain_intentResponseDescsByName = v28;

  v30 = objc_msgSend(v19, "copy");
  v31 = (void *)sRidesharingDomain_intentResponseDescsByType;
  sRidesharingDomain_intentResponseDescsByType = v30;

}

@end
