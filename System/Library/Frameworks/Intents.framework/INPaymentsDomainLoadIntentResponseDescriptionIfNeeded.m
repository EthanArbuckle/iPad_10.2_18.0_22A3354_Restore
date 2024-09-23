@implementation INPaymentsDomainLoadIntentResponseDescriptionIfNeeded

void ___INPaymentsDomainLoadIntentResponseDescriptionIfNeeded_block_invoke()
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
  INIntentResponseDescription *v9;
  uint64_t v10;
  uint64_t v11;
  INIntentResponseDescription *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  INIntentSlotDescription *v16;
  INIntentSlotDescription *v17;
  INIntentSlotDescription *v18;
  INIntentSlotDescription *v19;
  INIntentSlotDescription *v20;
  INIntentSlotDescription *v21;
  void *v22;
  void *v23;
  INIntentResponseDescription *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  id v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t i;
  void *v34;
  void *v35;
  void *v36;
  uint64_t v37;
  void *v38;
  uint64_t v39;
  void *v40;
  uint64_t v41;
  INIntentResponseDescription *v42;
  INIntentResponseDescription *v43;
  void *v44;
  void *v45;
  INIntentSlotDescription *v46;
  INIntentResponseDescription *v47;
  void *v48;
  void *v49;
  INIntentSlotDescription *v50;
  INIntentResponseDescription *v51;
  void *v52;
  void *v53;
  INIntentSlotDescription *v54;
  INIntentResponseDescription *v55;
  void *v56;
  void *v57;
  INIntentSlotDescription *v58;
  INIntentResponseDescription *v59;
  void *v60;
  void *v61;
  INIntentSlotDescription *v62;
  INIntentSlotDescription *v63;
  INIntentSlotDescription *v64;
  INIntentSlotDescription *v65;
  INIntentSlotDescription *v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  _BYTE v71[128];
  _QWORD v72[6];
  INIntentSlotDescription *v73;
  INIntentSlotDescription *v74;
  INIntentSlotDescription *v75;
  INIntentSlotDescription *v76;
  _QWORD v77[5];
  _QWORD v78[8];

  v78[6] = *MEMORY[0x1E0C80C00];
  v0 = [INIntentResponseDescription alloc];
  v1 = objc_opt_class();
  v2 = objc_opt_class();
  v66 = -[INIntentSlotDescription initWithName:tag:facadePropertyName:dataPropertyName:isExtended:isPrivate:valueType:valueStyle:defaultValueSelectorStrings:provideOptionsSelectorStrings:resolutionResultClass:resolveSelectors:]([INIntentSlotDescription alloc], "initWithName:tag:facadePropertyName:dataPropertyName:isExtended:isPrivate:valueType:valueStyle:defaultValueSelectorStrings:provideOptionsSelectorStrings:resolutionResultClass:resolveSelectors:", CFSTR("fromAccount"), 2, CFSTR("fromAccount"), CFSTR("fromAccount"), 0, 0, 61, 1, 0, 0, 0, 0);
  v77[0] = v66;
  v65 = -[INIntentSlotDescription initWithName:tag:facadePropertyName:dataPropertyName:isExtended:isPrivate:valueType:valueStyle:defaultValueSelectorStrings:provideOptionsSelectorStrings:resolutionResultClass:resolveSelectors:]([INIntentSlotDescription alloc], "initWithName:tag:facadePropertyName:dataPropertyName:isExtended:isPrivate:valueType:valueStyle:defaultValueSelectorStrings:provideOptionsSelectorStrings:resolutionResultClass:resolveSelectors:", CFSTR("billDetails"), 4, CFSTR("billDetails"), CFSTR("billDetails"), 0, 0, 60, 1, 0, 0, 0, 0);
  v77[1] = v65;
  v64 = -[INIntentSlotDescription initWithName:tag:facadePropertyName:dataPropertyName:isExtended:isPrivate:valueType:valueStyle:defaultValueSelectorStrings:provideOptionsSelectorStrings:resolutionResultClass:resolveSelectors:]([INIntentSlotDescription alloc], "initWithName:tag:facadePropertyName:dataPropertyName:isExtended:isPrivate:valueType:valueStyle:defaultValueSelectorStrings:provideOptionsSelectorStrings:resolutionResultClass:resolveSelectors:", CFSTR("transactionAmount"), 5, CFSTR("transactionAmount"), CFSTR("transactionAmount"), 0, 0, 62, 1, 0, 0, 0, 0);
  v77[2] = v64;
  v63 = -[INIntentSlotDescription initWithName:tag:facadePropertyName:dataPropertyName:isExtended:isPrivate:valueType:valueStyle:defaultValueSelectorStrings:provideOptionsSelectorStrings:resolutionResultClass:resolveSelectors:]([INIntentSlotDescription alloc], "initWithName:tag:facadePropertyName:dataPropertyName:isExtended:isPrivate:valueType:valueStyle:defaultValueSelectorStrings:provideOptionsSelectorStrings:resolutionResultClass:resolveSelectors:", CFSTR("transactionScheduledDate"), 6, CFSTR("transactionScheduledDate"), CFSTR("transactionScheduledDate"), 0, 0, 16, 1, 0, 0, 0, 0);
  v77[3] = v63;
  v62 = -[INIntentSlotDescription initWithName:tag:facadePropertyName:dataPropertyName:isExtended:isPrivate:valueType:valueStyle:defaultValueSelectorStrings:provideOptionsSelectorStrings:resolutionResultClass:resolveSelectors:]([INIntentSlotDescription alloc], "initWithName:tag:facadePropertyName:dataPropertyName:isExtended:isPrivate:valueType:valueStyle:defaultValueSelectorStrings:provideOptionsSelectorStrings:resolutionResultClass:resolveSelectors:", CFSTR("transactionNote"), 7, CFSTR("transactionNote"), CFSTR("transactionNote"), 0, 0, 30, 1, 0, 0, 0, 0);
  v77[4] = v62;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v77, 5);
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  _INIntentSchemaBuildIntentSlotDescriptionMap(v61);
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  v59 = -[INIntentResponseDescription initWithName:facadeClass:dataClass:type:isPrivate:slotsByName:](v0, "initWithName:facadeClass:dataClass:type:isPrivate:slotsByName:", CFSTR("PayBillIntentResponse"), v1, v2, CFSTR("sirikit.intent.payments.PayBillIntentResponse"), 0, v60);
  v78[0] = v59;
  v3 = [INIntentResponseDescription alloc];
  v4 = objc_opt_class();
  v5 = objc_opt_class();
  v58 = -[INIntentSlotDescription initWithName:tag:facadePropertyName:dataPropertyName:isExtended:isPrivate:valueType:valueStyle:defaultValueSelectorStrings:provideOptionsSelectorStrings:resolutionResultClass:resolveSelectors:]([INIntentSlotDescription alloc], "initWithName:tag:facadePropertyName:dataPropertyName:isExtended:isPrivate:valueType:valueStyle:defaultValueSelectorStrings:provideOptionsSelectorStrings:resolutionResultClass:resolveSelectors:", CFSTR("paymentRecord"), 1, CFSTR("paymentRecord"), CFSTR("paymentRecord"), 0, 0, 56, 1, 0, 0, 0, 0);
  v76 = v58;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v76, 1);
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  _INIntentSchemaBuildIntentSlotDescriptionMap(v57);
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  v55 = -[INIntentResponseDescription initWithName:facadeClass:dataClass:type:isPrivate:slotsByName:](v3, "initWithName:facadeClass:dataClass:type:isPrivate:slotsByName:", CFSTR("RequestPaymentIntentResponse"), v4, v5, CFSTR("sirikit.intent.payments.RequestPaymentIntentResponse"), 0, v56);
  v78[1] = v55;
  v6 = [INIntentResponseDescription alloc];
  v7 = objc_opt_class();
  v8 = objc_opt_class();
  v54 = -[INIntentSlotDescription initWithName:tag:facadePropertyName:dataPropertyName:isExtended:isPrivate:valueType:valueStyle:defaultValueSelectorStrings:provideOptionsSelectorStrings:resolutionResultClass:resolveSelectors:]([INIntentSlotDescription alloc], "initWithName:tag:facadePropertyName:dataPropertyName:isExtended:isPrivate:valueType:valueStyle:defaultValueSelectorStrings:provideOptionsSelectorStrings:resolutionResultClass:resolveSelectors:", CFSTR("accounts"), 2, CFSTR("accounts"), CFSTR("accounts"), 0, 0, 61, 3, 0, 0, 0, 0);
  v75 = v54;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v75, 1);
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  _INIntentSchemaBuildIntentSlotDescriptionMap(v53);
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  v51 = -[INIntentResponseDescription initWithName:facadeClass:dataClass:type:isPrivate:slotsByName:](v6, "initWithName:facadeClass:dataClass:type:isPrivate:slotsByName:", CFSTR("SearchForAccountsIntentResponse"), v7, v8, CFSTR("sirikit.intent.payments.SearchForAccountsIntentResponse"), 0, v52);
  v78[2] = v51;
  v9 = [INIntentResponseDescription alloc];
  v10 = objc_opt_class();
  v11 = objc_opt_class();
  v50 = -[INIntentSlotDescription initWithName:tag:facadePropertyName:dataPropertyName:isExtended:isPrivate:valueType:valueStyle:defaultValueSelectorStrings:provideOptionsSelectorStrings:resolutionResultClass:resolveSelectors:]([INIntentSlotDescription alloc], "initWithName:tag:facadePropertyName:dataPropertyName:isExtended:isPrivate:valueType:valueStyle:defaultValueSelectorStrings:provideOptionsSelectorStrings:resolutionResultClass:resolveSelectors:", CFSTR("bills"), 2, CFSTR("bills"), CFSTR("bills"), 0, 0, 60, 3, 0, 0, 0, 0);
  v74 = v50;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v74, 1);
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  _INIntentSchemaBuildIntentSlotDescriptionMap(v49);
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  v47 = -[INIntentResponseDescription initWithName:facadeClass:dataClass:type:isPrivate:slotsByName:](v9, "initWithName:facadeClass:dataClass:type:isPrivate:slotsByName:", CFSTR("SearchForBillsIntentResponse"), v10, v11, CFSTR("sirikit.intent.payments.SearchForBillsIntentResponse"), 0, v48);
  v78[3] = v47;
  v12 = [INIntentResponseDescription alloc];
  v13 = objc_opt_class();
  v14 = objc_opt_class();
  v46 = -[INIntentSlotDescription initWithName:tag:facadePropertyName:dataPropertyName:isExtended:isPrivate:valueType:valueStyle:defaultValueSelectorStrings:provideOptionsSelectorStrings:resolutionResultClass:resolveSelectors:]([INIntentSlotDescription alloc], "initWithName:tag:facadePropertyName:dataPropertyName:isExtended:isPrivate:valueType:valueStyle:defaultValueSelectorStrings:provideOptionsSelectorStrings:resolutionResultClass:resolveSelectors:", CFSTR("paymentRecord"), 1, CFSTR("paymentRecord"), CFSTR("paymentRecord"), 0, 0, 56, 1, 0, 0, 0, 0);
  v73 = v46;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v73, 1);
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  _INIntentSchemaBuildIntentSlotDescriptionMap(v45);
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  v43 = -[INIntentResponseDescription initWithName:facadeClass:dataClass:type:isPrivate:slotsByName:](v12, "initWithName:facadeClass:dataClass:type:isPrivate:slotsByName:", CFSTR("SendPaymentIntentResponse"), v13, v14, CFSTR("sirikit.intent.payments.SendPaymentIntentResponse"), 0, v44);
  v78[4] = v43;
  v42 = [INIntentResponseDescription alloc];
  v41 = objc_opt_class();
  v15 = objc_opt_class();
  v16 = -[INIntentSlotDescription initWithName:tag:facadePropertyName:dataPropertyName:isExtended:isPrivate:valueType:valueStyle:defaultValueSelectorStrings:provideOptionsSelectorStrings:resolutionResultClass:resolveSelectors:]([INIntentSlotDescription alloc], "initWithName:tag:facadePropertyName:dataPropertyName:isExtended:isPrivate:valueType:valueStyle:defaultValueSelectorStrings:provideOptionsSelectorStrings:resolutionResultClass:resolveSelectors:", CFSTR("fromAccount"), 2, CFSTR("fromAccount"), CFSTR("fromAccount"), 0, 0, 61, 1, 0, 0, 0, 0);
  v72[0] = v16;
  v17 = -[INIntentSlotDescription initWithName:tag:facadePropertyName:dataPropertyName:isExtended:isPrivate:valueType:valueStyle:defaultValueSelectorStrings:provideOptionsSelectorStrings:resolutionResultClass:resolveSelectors:]([INIntentSlotDescription alloc], "initWithName:tag:facadePropertyName:dataPropertyName:isExtended:isPrivate:valueType:valueStyle:defaultValueSelectorStrings:provideOptionsSelectorStrings:resolutionResultClass:resolveSelectors:", CFSTR("toAccount"), 4, CFSTR("toAccount"), CFSTR("toAccount"), 0, 0, 61, 1, 0, 0, 0, 0);
  v72[1] = v17;
  v18 = -[INIntentSlotDescription initWithName:tag:facadePropertyName:dataPropertyName:isExtended:isPrivate:valueType:valueStyle:defaultValueSelectorStrings:provideOptionsSelectorStrings:resolutionResultClass:resolveSelectors:]([INIntentSlotDescription alloc], "initWithName:tag:facadePropertyName:dataPropertyName:isExtended:isPrivate:valueType:valueStyle:defaultValueSelectorStrings:provideOptionsSelectorStrings:resolutionResultClass:resolveSelectors:", CFSTR("transactionAmount"), 5, CFSTR("transactionAmount"), CFSTR("transactionAmount"), 0, 0, 62, 1, 0, 0, 0, 0);
  v72[2] = v18;
  v19 = -[INIntentSlotDescription initWithName:tag:facadePropertyName:dataPropertyName:isExtended:isPrivate:valueType:valueStyle:defaultValueSelectorStrings:provideOptionsSelectorStrings:resolutionResultClass:resolveSelectors:]([INIntentSlotDescription alloc], "initWithName:tag:facadePropertyName:dataPropertyName:isExtended:isPrivate:valueType:valueStyle:defaultValueSelectorStrings:provideOptionsSelectorStrings:resolutionResultClass:resolveSelectors:", CFSTR("transactionScheduledDate"), 6, CFSTR("transactionScheduledDate"), CFSTR("transactionScheduledDate"), 0, 0, 16, 1, 0, 0, 0, 0);
  v72[3] = v19;
  v20 = -[INIntentSlotDescription initWithName:tag:facadePropertyName:dataPropertyName:isExtended:isPrivate:valueType:valueStyle:defaultValueSelectorStrings:provideOptionsSelectorStrings:resolutionResultClass:resolveSelectors:]([INIntentSlotDescription alloc], "initWithName:tag:facadePropertyName:dataPropertyName:isExtended:isPrivate:valueType:valueStyle:defaultValueSelectorStrings:provideOptionsSelectorStrings:resolutionResultClass:resolveSelectors:", CFSTR("transactionNote"), 7, CFSTR("transactionNote"), CFSTR("transactionNote"), 0, 0, 7, 1, 0, 0, 0, 0);
  v72[4] = v20;
  v21 = -[INIntentSlotDescription initWithName:tag:facadePropertyName:dataPropertyName:isExtended:isPrivate:valueType:valueStyle:defaultValueSelectorStrings:provideOptionsSelectorStrings:resolutionResultClass:resolveSelectors:]([INIntentSlotDescription alloc], "initWithName:tag:facadePropertyName:dataPropertyName:isExtended:isPrivate:valueType:valueStyle:defaultValueSelectorStrings:provideOptionsSelectorStrings:resolutionResultClass:resolveSelectors:", CFSTR("transferFee"), 8, CFSTR("transferFee"), CFSTR("transferFee"), 0, 0, 53, 1, 0, 0, 0, 0);
  v72[5] = v21;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v72, 6);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  _INIntentSchemaBuildIntentSlotDescriptionMap(v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = -[INIntentResponseDescription initWithName:facadeClass:dataClass:type:isPrivate:slotsByName:](v42, "initWithName:facadeClass:dataClass:type:isPrivate:slotsByName:", CFSTR("TransferMoneyIntentResponse"), v41, v15, CFSTR("sirikit.intent.payments.TransferMoneyIntentResponse"), 0, v23);
  v78[5] = v24;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v78, 6);
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  v26 = objc_msgSend(v25, "count");
  v27 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", v26);
  v28 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", v26);
  v67 = 0u;
  v68 = 0u;
  v69 = 0u;
  v70 = 0u;
  v29 = v25;
  v30 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v67, v71, 16);
  if (v30)
  {
    v31 = v30;
    v32 = *(_QWORD *)v68;
    do
    {
      for (i = 0; i != v31; ++i)
      {
        if (*(_QWORD *)v68 != v32)
          objc_enumerationMutation(v29);
        v34 = *(void **)(*((_QWORD *)&v67 + 1) + 8 * i);
        objc_msgSend(v34, "name");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "setObject:forKey:", v34, v35);

        objc_msgSend(v34, "type");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "setObject:forKey:", v34, v36);

      }
      v31 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v67, v71, 16);
    }
    while (v31);
  }

  v37 = objc_msgSend(v27, "copy");
  v38 = (void *)sPaymentsDomain_intentResponseDescsByName;
  sPaymentsDomain_intentResponseDescsByName = v37;

  v39 = objc_msgSend(v28, "copy");
  v40 = (void *)sPaymentsDomain_intentResponseDescsByType;
  sPaymentsDomain_intentResponseDescsByType = v39;

}

@end
