@implementation JETreatment

- (id)performTreatment:(id)a3
{
  id v4;
  JETreatmentContext *v5;
  JEMetricsDataPredicate *v6;
  JEMetricsDataPredicate *v7;
  _BOOL4 v8;
  NSDictionary *fieldActions;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  NSDictionary *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t j;
  void *v23;
  void *v24;
  void *v25;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  _BYTE v35[128];
  _BYTE v36[128];
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = -[JETreatmentContext initWithTreatment:metrics:]([JETreatmentContext alloc], "initWithTreatment:metrics:", self, v4);
  if (self)
  {
    v6 = self->_predicate;
    if (v6)
    {
      v7 = v6;
      v8 = -[JEMetricsDataPredicate evaluateWithMetricsData:](self->_predicate, "evaluateWithMetricsData:", v4);

      if (!v8)
        goto LABEL_29;
    }
    if (self->_eventAction)
      -[JETreatmentAction performActionWithContext:](self->_eventAction, "performActionWithContext:", v5);
  }
  v33 = 0u;
  v34 = 0u;
  v31 = 0u;
  v32 = 0u;
  if (self)
    fieldActions = self->_fieldActions;
  else
    fieldActions = 0;
  -[NSDictionary objectEnumerator](fieldActions, "objectEnumerator");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v31, v36, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v32;
    do
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v32 != v13)
          objc_enumerationMutation(v10);
        v15 = *(void **)(*((_QWORD *)&v31 + 1) + 8 * i);
        -[JETreatmentAction sourceField]((uint64_t)v15);
        v16 = (void *)objc_claimAutoreleasedReturnValue();

        if (v16)
          objc_msgSend(v15, "performActionWithContext:", v5);
      }
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v31, v36, 16);
    }
    while (v12);
  }

  v29 = 0u;
  v30 = 0u;
  v27 = 0u;
  v28 = 0u;
  if (self)
    v17 = self->_fieldActions;
  else
    v17 = 0;
  -[NSDictionary objectEnumerator](v17, "objectEnumerator", (_QWORD)v27);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v27, v35, 16);
  if (v19)
  {
    v20 = v19;
    v21 = *(_QWORD *)v28;
    do
    {
      for (j = 0; j != v20; ++j)
      {
        if (*(_QWORD *)v28 != v21)
          objc_enumerationMutation(v18);
        v23 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * j);
        -[JETreatmentAction sourceField]((uint64_t)v23);
        v24 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v24)
          objc_msgSend(v23, "performActionWithContext:", v5);
      }
      v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v27, v35, 16);
    }
    while (v20);
  }

LABEL_29:
  -[JETreatmentContext metrics]((uint64_t)v5);
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  return v25;
}

+ (id)treatmentWithConfiguration:(id)a3 topic:(id)a4
{
  id v5;
  id v6;
  id v7;
  id v8;
  JETreatment *v9;

  v5 = a3;
  v6 = a4;
  v7 = v5;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v8 = v7;
  else
    v8 = 0;

  if (v8)
    v9 = -[JETreatment initWithConfigDictionary:topic:]([JETreatment alloc], "initWithConfigDictionary:topic:", v8, v6);
  else
    v9 = 0;

  return v9;
}

- (JETreatment)initWithConfigDictionary:(id)a3 topic:(id)a4
{
  id v6;
  id v7;
  JETreatment *v8;
  void *v9;
  uint64_t v10;
  JEMetricsDataPredicate *predicate;
  void *v12;
  uint64_t v13;
  JETreatmentAction *eventAction;
  void *v15;
  id v16;
  void *v17;
  id v18;
  uint64_t v19;
  NSDictionary *fieldActions;
  uint64_t v22;
  uint64_t v23;
  void (*v24)(uint64_t, void *);
  void *v25;
  id v26;
  id v27;
  objc_super v28;

  v6 = a3;
  v7 = a4;
  v28.receiver = self;
  v28.super_class = (Class)JETreatment;
  v8 = -[JETreatment init](&v28, sel_init);
  if (v8)
  {
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("filters"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    +[JEMetricsDataPredicate predicateWithConfiguration:](JEMetricsDataPredicate, "predicateWithConfiguration:", v9);
    v10 = objc_claimAutoreleasedReturnValue();
    predicate = v8->_predicate;
    v8->_predicate = (JEMetricsDataPredicate *)v10;

    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("eventActions"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    +[JETreatmentAction treatmentActionWithField:configuration:topic:](JETreatmentAction, "treatmentActionWithField:configuration:topic:", 0, v12, v7);
    v13 = objc_claimAutoreleasedReturnValue();
    eventAction = v8->_eventAction;
    v8->_eventAction = (JETreatmentAction *)v13;

    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("fieldActions"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v16 = 0;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v16 = v15;

    if (v16)
    {
      v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", objc_msgSend(v16, "count"));
      v22 = MEMORY[0x1E0C809B0];
      v23 = 3221225472;
      v24 = __46__JETreatment_initWithConfigDictionary_topic___block_invoke;
      v25 = &unk_1E3DDED90;
      v26 = v7;
      v27 = v17;
      v18 = v17;
      objc_msgSend(v16, "enumerateKeysAndObjectsUsingBlock:", &v22);
      v19 = objc_msgSend(v18, "copy", v22, v23, v24, v25);
      fieldActions = v8->_fieldActions;
      v8->_fieldActions = (NSDictionary *)v19;

    }
  }

  return v8;
}

void __46__JETreatment_initWithConfigDictionary_topic___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;

  v4 = a2;
  +[JETreatmentAction treatmentActionWithField:configuration:topic:](JETreatmentAction, "treatmentActionWithField:configuration:topic:");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
    objc_msgSend(*(id *)(a1 + 40), "setObject:forKeyedSubscript:", v3, v4);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fieldActions, 0);
  objc_storeStrong((id *)&self->_eventAction, 0);
  objc_storeStrong((id *)&self->_predicate, 0);
}

@end
