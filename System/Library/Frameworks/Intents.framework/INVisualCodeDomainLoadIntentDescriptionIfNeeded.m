@implementation INVisualCodeDomainLoadIntentDescriptionIfNeeded

void ___INVisualCodeDomainLoadIntentDescriptionIfNeeded_block_invoke()
{
  INIntentDescription *v0;
  uint64_t v1;
  uint64_t v2;
  INIntentSlotDescription *v3;
  void *v4;
  void *v5;
  INIntentDescription *v6;
  INIntentDescription *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  INIntentDescription *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t i;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  void *v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  INIntentSlotDescription *v33;
  _QWORD v34[4];

  v34[2] = *MEMORY[0x1E0C80C00];
  v0 = [INIntentDescription alloc];
  v1 = objc_opt_class();
  v2 = objc_opt_class();
  v3 = -[INIntentSlotDescription initWithName:tag:facadePropertyName:dataPropertyName:isExtended:isPrivate:valueType:valueStyle:defaultValueSelectorStrings:provideOptionsSelectorStrings:resolutionResultClass:resolveSelectors:]([INIntentSlotDescription alloc], "initWithName:tag:facadePropertyName:dataPropertyName:isExtended:isPrivate:valueType:valueStyle:defaultValueSelectorStrings:provideOptionsSelectorStrings:resolutionResultClass:resolveSelectors:", CFSTR("visualCodeType"), 2, CFSTR("visualCodeType"), CFSTR("visualCodeType"), 0, 0, 114, 1, &unk_1E23F91F8, &unk_1E23F9210, objc_opt_class(), sel_resolveVisualCodeTypeForGetVisualCode_withCompletion_, sel_resolveVisualCodeTypeForGetVisualCode_completion_, 0);
  v33 = v3;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v33, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  _INIntentSchemaBuildIntentSlotDescriptionMap(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[INIntentDescription initWithName:responseName:facadeClass:dataClass:type:isPrivate:handleSelector:confirmSelector:slotsByName:](v0, "initWithName:responseName:facadeClass:dataClass:type:isPrivate:handleSelector:confirmSelector:slotsByName:", CFSTR("GetVisualCodeIntent"), CFSTR("GetVisualCodeIntentResponse"), v1, v2, CFSTR("sirikit.intent.GetVisualCodeIntent"), 0, sel_handleGetVisualCode_completion_, sel_confirmGetVisualCode_completion_, v5);
  v34[0] = v6;
  v7 = [INIntentDescription alloc];
  v8 = objc_opt_class();
  v9 = objc_opt_class();
  _INIntentSchemaBuildIntentSlotDescriptionMap(MEMORY[0x1E0C9AA60]);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = -[INIntentDescription initWithName:responseName:facadeClass:dataClass:type:isPrivate:handleSelector:confirmSelector:slotsByName:](v7, "initWithName:responseName:facadeClass:dataClass:type:isPrivate:handleSelector:confirmSelector:slotsByName:", CFSTR("ScanVisualCodeIntent"), CFSTR("ScanVisualCodeIntentResponse"), v8, v9, CFSTR("sirikit.intent.ScanVisualCodeIntent"), 0, sel_handleScanVisualCode_completion_, sel_confirmScanVisualCode_completion_, v10);
  v34[1] = v11;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v34, 2);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = objc_msgSend(v12, "count");
  v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", v13);
  v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", v13);
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v16 = v12;
  v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
  if (v17)
  {
    v18 = v17;
    v19 = *(_QWORD *)v29;
    do
    {
      for (i = 0; i != v18; ++i)
      {
        if (*(_QWORD *)v29 != v19)
          objc_enumerationMutation(v16);
        v21 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * i);
        objc_msgSend(v21, "name");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "setObject:forKey:", v21, v22);

        objc_msgSend(v21, "type");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "setObject:forKey:", v21, v23);

      }
      v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
    }
    while (v18);
  }

  v24 = objc_msgSend(v14, "copy");
  v25 = (void *)sVisualCodeDomain_intentDescsByName;
  sVisualCodeDomain_intentDescsByName = v24;

  v26 = objc_msgSend(v15, "copy");
  v27 = (void *)sVisualCodeDomain_intentDescsByType;
  sVisualCodeDomain_intentDescsByType = v26;

}

@end
