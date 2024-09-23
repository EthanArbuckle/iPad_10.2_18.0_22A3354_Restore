@implementation INWorkoutsDomainLoadIntentResponseDescriptionIfNeeded

void ___INWorkoutsDomainLoadIntentResponseDescriptionIfNeeded_block_invoke()
{
  INIntentResponseDescription *v0;
  uint64_t v1;
  uint64_t v2;
  void *v3;
  INIntentResponseDescription *v4;
  uint64_t v5;
  uint64_t v6;
  INIntentResponseDescription *v7;
  INIntentResponseDescription *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  INIntentResponseDescription *v12;
  INIntentResponseDescription *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  INIntentResponseDescription *v17;
  INIntentResponseDescription *v18;
  uint64_t v19;
  uint64_t v20;
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
  INIntentResponseDescription *v40;
  void *v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  _BYTE v46[128];
  _QWORD v47[7];

  v47[5] = *MEMORY[0x1E0C80C00];
  v0 = [INIntentResponseDescription alloc];
  v1 = objc_opt_class();
  v2 = objc_opt_class();
  v3 = (void *)MEMORY[0x1E0C9AA60];
  _INIntentSchemaBuildIntentSlotDescriptionMap(MEMORY[0x1E0C9AA60]);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  v40 = -[INIntentResponseDescription initWithName:facadeClass:dataClass:type:isPrivate:slotsByName:](v0, "initWithName:facadeClass:dataClass:type:isPrivate:slotsByName:", CFSTR("CancelWorkoutIntentResponse"), v1, v2, CFSTR("sirikit.intent.fitness.CancelWorkoutIntentResponse"), 0, v41);
  v47[0] = v40;
  v4 = [INIntentResponseDescription alloc];
  v5 = objc_opt_class();
  v6 = objc_opt_class();
  _INIntentSchemaBuildIntentSlotDescriptionMap(v3);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[INIntentResponseDescription initWithName:facadeClass:dataClass:type:isPrivate:slotsByName:](v4, "initWithName:facadeClass:dataClass:type:isPrivate:slotsByName:", CFSTR("EndWorkoutIntentResponse"), v5, v6, CFSTR("sirikit.intent.fitness.EndWorkoutIntentResponse"), 0, v39);
  v47[1] = v7;
  v8 = [INIntentResponseDescription alloc];
  v9 = objc_opt_class();
  v10 = objc_opt_class();
  _INIntentSchemaBuildIntentSlotDescriptionMap(v3);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = -[INIntentResponseDescription initWithName:facadeClass:dataClass:type:isPrivate:slotsByName:](v8, "initWithName:facadeClass:dataClass:type:isPrivate:slotsByName:", CFSTR("PauseWorkoutIntentResponse"), v9, v10, CFSTR("sirikit.intent.fitness.PauseWorkoutIntentResponse"), 0, v11);
  v47[2] = v12;
  v13 = [INIntentResponseDescription alloc];
  v14 = objc_opt_class();
  v15 = objc_opt_class();
  _INIntentSchemaBuildIntentSlotDescriptionMap(v3);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = -[INIntentResponseDescription initWithName:facadeClass:dataClass:type:isPrivate:slotsByName:](v13, "initWithName:facadeClass:dataClass:type:isPrivate:slotsByName:", CFSTR("ResumeWorkoutIntentResponse"), v14, v15, CFSTR("sirikit.intent.fitness.ResumeWorkoutIntentResponse"), 0, v16);
  v47[3] = v17;
  v18 = [INIntentResponseDescription alloc];
  v19 = objc_opt_class();
  v20 = objc_opt_class();
  _INIntentSchemaBuildIntentSlotDescriptionMap(v3);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = -[INIntentResponseDescription initWithName:facadeClass:dataClass:type:isPrivate:slotsByName:](v18, "initWithName:facadeClass:dataClass:type:isPrivate:slotsByName:", CFSTR("StartWorkoutIntentResponse"), v19, v20, CFSTR("sirikit.intent.fitness.StartWorkoutIntentResponse"), 0, v21);
  v47[4] = v22;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v47, 5);
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  v24 = objc_msgSend(v23, "count");
  v25 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", v24);
  v26 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", v24);
  v42 = 0u;
  v43 = 0u;
  v44 = 0u;
  v45 = 0u;
  v27 = v23;
  v28 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v42, v46, 16);
  if (v28)
  {
    v29 = v28;
    v30 = *(_QWORD *)v43;
    do
    {
      for (i = 0; i != v29; ++i)
      {
        if (*(_QWORD *)v43 != v30)
          objc_enumerationMutation(v27);
        v32 = *(void **)(*((_QWORD *)&v42 + 1) + 8 * i);
        objc_msgSend(v32, "name");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "setObject:forKey:", v32, v33);

        objc_msgSend(v32, "type");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "setObject:forKey:", v32, v34);

      }
      v29 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v42, v46, 16);
    }
    while (v29);
  }

  v35 = objc_msgSend(v25, "copy");
  v36 = (void *)sWorkoutsDomain_intentResponseDescsByName;
  sWorkoutsDomain_intentResponseDescsByName = v35;

  v37 = objc_msgSend(v26, "copy");
  v38 = (void *)sWorkoutsDomain_intentResponseDescsByType;
  sWorkoutsDomain_intentResponseDescsByType = v37;

}

@end
