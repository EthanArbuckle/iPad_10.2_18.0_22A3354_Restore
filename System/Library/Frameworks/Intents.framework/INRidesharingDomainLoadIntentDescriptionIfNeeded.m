@implementation INRidesharingDomainLoadIntentDescriptionIfNeeded

void ___INRidesharingDomainLoadIntentDescriptionIfNeeded_block_invoke()
{
  INIntentDescription *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  INIntentDescription *v5;
  INIntentSlotDescription *v6;
  INIntentSlotDescription *v7;
  INIntentSlotDescription *v8;
  INIntentSlotDescription *v9;
  INIntentSlotDescription *v10;
  void *v11;
  void *v12;
  INIntentDescription *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t i;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  INIntentSlotDescription *v32;
  INIntentDescription *v33;
  INIntentDescription *v34;
  void *v35;
  void *v36;
  INIntentSlotDescription *v37;
  INIntentSlotDescription *v38;
  INIntentDescription *v39;
  void *v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  _BYTE v45[128];
  _QWORD v46[6];
  _QWORD v47[2];
  _QWORD v48[5];

  v48[3] = *MEMORY[0x1E0C80C00];
  v0 = [INIntentDescription alloc];
  v1 = objc_opt_class();
  v2 = objc_opt_class();
  _INIntentSchemaBuildIntentSlotDescriptionMap(MEMORY[0x1E0C9AA60]);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  v39 = -[INIntentDescription initWithName:responseName:facadeClass:dataClass:type:isPrivate:handleSelector:confirmSelector:slotsByName:](v0, "initWithName:responseName:facadeClass:dataClass:type:isPrivate:handleSelector:confirmSelector:slotsByName:", CFSTR("GetRideStatusIntent"), CFSTR("GetRideStatusIntentResponse"), v1, v2, CFSTR("sirikit.intent.ride.GetRideStatusIntent"), 0, sel_handleGetRideStatus_completion_, sel_confirmGetRideStatus_completion_, v40);
  v48[0] = v39;
  v33 = [INIntentDescription alloc];
  v3 = objc_opt_class();
  v4 = objc_opt_class();
  v38 = -[INIntentSlotDescription initWithName:tag:facadePropertyName:dataPropertyName:isExtended:isPrivate:valueType:valueStyle:defaultValueSelectorStrings:provideOptionsSelectorStrings:resolutionResultClass:resolveSelectors:]([INIntentSlotDescription alloc], "initWithName:tag:facadePropertyName:dataPropertyName:isExtended:isPrivate:valueType:valueStyle:defaultValueSelectorStrings:provideOptionsSelectorStrings:resolutionResultClass:resolveSelectors:", CFSTR("pickupLocation"), 2, CFSTR("pickupLocation"), CFSTR("pickupLocation"), 0, 0, 27, 1, &unk_1E23F89B8, &unk_1E23F89D0, objc_opt_class(), sel_resolvePickupLocationForListRideOptions_withCompletion_, sel_resolvePickupLocationForListRideOptions_completion_, 0);
  v47[0] = v38;
  v37 = -[INIntentSlotDescription initWithName:tag:facadePropertyName:dataPropertyName:isExtended:isPrivate:valueType:valueStyle:defaultValueSelectorStrings:provideOptionsSelectorStrings:resolutionResultClass:resolveSelectors:]([INIntentSlotDescription alloc], "initWithName:tag:facadePropertyName:dataPropertyName:isExtended:isPrivate:valueType:valueStyle:defaultValueSelectorStrings:provideOptionsSelectorStrings:resolutionResultClass:resolveSelectors:", CFSTR("dropOffLocation"), 3, CFSTR("dropOffLocation"), CFSTR("dropOffLocation"), 0, 0, 27, 1, &unk_1E23F89E8, &unk_1E23F8A00, objc_opt_class(), sel_resolveDropOffLocationForListRideOptions_withCompletion_, sel_resolveDropOffLocationForListRideOptions_completion_, 0);
  v47[1] = v37;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v47, 2);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  _INIntentSchemaBuildIntentSlotDescriptionMap(v36);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[INIntentDescription initWithName:responseName:facadeClass:dataClass:type:isPrivate:handleSelector:confirmSelector:slotsByName:](v33, "initWithName:responseName:facadeClass:dataClass:type:isPrivate:handleSelector:confirmSelector:slotsByName:", CFSTR("ListRideOptionsIntent"), CFSTR("ListRideOptionsIntentResponse"), v3, v4, CFSTR("sirikit.intent.ride.ListRideOptionsIntent"), 0, sel_handleListRideOptions_completion_, sel_confirmListRideOptions_completion_, v35);
  v48[1] = v5;
  v34 = [INIntentDescription alloc];
  v31 = objc_opt_class();
  v30 = objc_opt_class();
  v32 = -[INIntentSlotDescription initWithName:tag:facadePropertyName:dataPropertyName:isExtended:isPrivate:valueType:valueStyle:defaultValueSelectorStrings:provideOptionsSelectorStrings:resolutionResultClass:resolveSelectors:]([INIntentSlotDescription alloc], "initWithName:tag:facadePropertyName:dataPropertyName:isExtended:isPrivate:valueType:valueStyle:defaultValueSelectorStrings:provideOptionsSelectorStrings:resolutionResultClass:resolveSelectors:", CFSTR("pickupLocation"), 2, CFSTR("pickupLocation"), CFSTR("pickupLocation"), 0, 0, 27, 1, &unk_1E23F8A18, &unk_1E23F8A30, objc_opt_class(), sel_resolvePickupLocationForRequestRide_withCompletion_, sel_resolvePickupLocationForRequestRide_completion_, 0);
  v46[0] = v32;
  v6 = -[INIntentSlotDescription initWithName:tag:facadePropertyName:dataPropertyName:isExtended:isPrivate:valueType:valueStyle:defaultValueSelectorStrings:provideOptionsSelectorStrings:resolutionResultClass:resolveSelectors:]([INIntentSlotDescription alloc], "initWithName:tag:facadePropertyName:dataPropertyName:isExtended:isPrivate:valueType:valueStyle:defaultValueSelectorStrings:provideOptionsSelectorStrings:resolutionResultClass:resolveSelectors:", CFSTR("dropOffLocation"), 3, CFSTR("dropOffLocation"), CFSTR("dropOffLocation"), 0, 0, 27, 1, &unk_1E23F8A48, &unk_1E23F8A60, objc_opt_class(), sel_resolveDropOffLocationForRequestRide_withCompletion_, sel_resolveDropOffLocationForRequestRide_completion_, 0);
  v46[1] = v6;
  v7 = -[INIntentSlotDescription initWithName:tag:facadePropertyName:dataPropertyName:isExtended:isPrivate:valueType:valueStyle:defaultValueSelectorStrings:provideOptionsSelectorStrings:resolutionResultClass:resolveSelectors:]([INIntentSlotDescription alloc], "initWithName:tag:facadePropertyName:dataPropertyName:isExtended:isPrivate:valueType:valueStyle:defaultValueSelectorStrings:provideOptionsSelectorStrings:resolutionResultClass:resolveSelectors:", CFSTR("rideOptionName"), 4, CFSTR("rideOptionName"), CFSTR("rideOptionName"), 0, 0, 12, 1, &unk_1E23F8A78, &unk_1E23F8A90, objc_opt_class(), sel_resolveRideOptionNameForRequestRide_withCompletion_, sel_resolveRideOptionNameForRequestRide_completion_, 0);
  v46[2] = v7;
  v8 = -[INIntentSlotDescription initWithName:tag:facadePropertyName:dataPropertyName:isExtended:isPrivate:valueType:valueStyle:defaultValueSelectorStrings:provideOptionsSelectorStrings:resolutionResultClass:resolveSelectors:]([INIntentSlotDescription alloc], "initWithName:tag:facadePropertyName:dataPropertyName:isExtended:isPrivate:valueType:valueStyle:defaultValueSelectorStrings:provideOptionsSelectorStrings:resolutionResultClass:resolveSelectors:", CFSTR("partySize"), 5, CFSTR("partySize"), CFSTR("partySize"), 0, 0, 24, 1, &unk_1E23F8AA8, &unk_1E23F8AC0, objc_opt_class(), sel_resolvePartySizeForRequestRide_withCompletion_, sel_resolvePartySizeForRequestRide_completion_, 0);
  v46[3] = v8;
  v9 = -[INIntentSlotDescription initWithName:tag:facadePropertyName:dataPropertyName:isExtended:isPrivate:valueType:valueStyle:defaultValueSelectorStrings:provideOptionsSelectorStrings:resolutionResultClass:resolveSelectors:]([INIntentSlotDescription alloc], "initWithName:tag:facadePropertyName:dataPropertyName:isExtended:isPrivate:valueType:valueStyle:defaultValueSelectorStrings:provideOptionsSelectorStrings:resolutionResultClass:resolveSelectors:", CFSTR("paymentMethod"), 8, CFSTR("paymentMethod"), CFSTR("paymentMethod"), 0, 0, 54, 1, 0, 0, 0, 0);
  v46[4] = v9;
  v10 = -[INIntentSlotDescription initWithName:tag:facadePropertyName:dataPropertyName:isExtended:isPrivate:valueType:valueStyle:defaultValueSelectorStrings:provideOptionsSelectorStrings:resolutionResultClass:resolveSelectors:]([INIntentSlotDescription alloc], "initWithName:tag:facadePropertyName:dataPropertyName:isExtended:isPrivate:valueType:valueStyle:defaultValueSelectorStrings:provideOptionsSelectorStrings:resolutionResultClass:resolveSelectors:", CFSTR("scheduledPickupTime"), 10, CFSTR("scheduledPickupTime"), CFSTR("scheduledPickupTime"), 0, 0, 16, 1, &unk_1E23F8AD8, &unk_1E23F8AF0, objc_opt_class(), sel_resolveScheduledPickupTimeForRequestRide_withCompletion_, sel_resolveScheduledPickupTimeForRequestRide_completion_, 0);
  v46[5] = v10;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v46, 6);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  _INIntentSchemaBuildIntentSlotDescriptionMap(v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = -[INIntentDescription initWithName:responseName:facadeClass:dataClass:type:isPrivate:handleSelector:confirmSelector:slotsByName:](v34, "initWithName:responseName:facadeClass:dataClass:type:isPrivate:handleSelector:confirmSelector:slotsByName:", CFSTR("RequestRideIntent"), CFSTR("RequestRideIntentResponse"), v31, v30, CFSTR("sirikit.intent.ride.RequestRideIntent"), 0, sel_handleRequestRide_completion_, sel_confirmRequestRide_completion_, v12);
  v48[2] = v13;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v48, 3);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v15 = objc_msgSend(v14, "count");
  v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", v15);
  v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", v15);
  v41 = 0u;
  v42 = 0u;
  v43 = 0u;
  v44 = 0u;
  v18 = v14;
  v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v41, v45, 16);
  if (v19)
  {
    v20 = v19;
    v21 = *(_QWORD *)v42;
    do
    {
      for (i = 0; i != v20; ++i)
      {
        if (*(_QWORD *)v42 != v21)
          objc_enumerationMutation(v18);
        v23 = *(void **)(*((_QWORD *)&v41 + 1) + 8 * i);
        objc_msgSend(v23, "name");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "setObject:forKey:", v23, v24);

        objc_msgSend(v23, "type");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "setObject:forKey:", v23, v25);

      }
      v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v41, v45, 16);
    }
    while (v20);
  }

  v26 = objc_msgSend(v16, "copy");
  v27 = (void *)sRidesharingDomain_intentDescsByName;
  sRidesharingDomain_intentDescsByName = v26;

  v28 = objc_msgSend(v17, "copy");
  v29 = (void *)sRidesharingDomain_intentDescsByType;
  sRidesharingDomain_intentDescsByType = v28;

}

@end
